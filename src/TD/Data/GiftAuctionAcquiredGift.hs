module TD.Data.GiftAuctionAcquiredGift
  (GiftAuctionAcquiredGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.FormattedText as FormattedText

data GiftAuctionAcquiredGift
  = GiftAuctionAcquiredGift -- ^ Represents a gift that was acquired by the current user on an auction
    { receiver_id            :: Maybe MessageSender.MessageSender -- ^ Receiver of the gift
    , date                   :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the gift was acquired
    , star_count             :: Maybe Int                         -- ^ The number of Telegram Stars that were paid for the gift
    , auction_round_number   :: Maybe Int                         -- ^ Identifier of the auction round in which the gift was acquired
    , auction_round_position :: Maybe Int                         -- ^ Position of the user in the round among all auction participants
    , text                   :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , is_private             :: Maybe Bool                        -- ^ True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    }
  deriving (Eq, Show)

instance I.ShortShow GiftAuctionAcquiredGift where
  shortShow GiftAuctionAcquiredGift
    { receiver_id            = receiver_id_
    , date                   = date_
    , star_count             = star_count_
    , auction_round_number   = auction_round_number_
    , auction_round_position = auction_round_position_
    , text                   = text_
    , is_private             = is_private_
    }
      = "GiftAuctionAcquiredGift"
        ++ I.cc
        [ "receiver_id"            `I.p` receiver_id_
        , "date"                   `I.p` date_
        , "star_count"             `I.p` star_count_
        , "auction_round_number"   `I.p` auction_round_number_
        , "auction_round_position" `I.p` auction_round_position_
        , "text"                   `I.p` text_
        , "is_private"             `I.p` is_private_
        ]

instance AT.FromJSON GiftAuctionAcquiredGift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftAuctionAcquiredGift" -> parseGiftAuctionAcquiredGift v
      _                         -> mempty
    
    where
      parseGiftAuctionAcquiredGift :: A.Value -> AT.Parser GiftAuctionAcquiredGift
      parseGiftAuctionAcquiredGift = A.withObject "GiftAuctionAcquiredGift" $ \o -> do
        receiver_id_            <- o A..:?  "receiver_id"
        date_                   <- o A..:?  "date"
        star_count_             <- o A..:?  "star_count"
        auction_round_number_   <- o A..:?  "auction_round_number"
        auction_round_position_ <- o A..:?  "auction_round_position"
        text_                   <- o A..:?  "text"
        is_private_             <- o A..:?  "is_private"
        pure $ GiftAuctionAcquiredGift
          { receiver_id            = receiver_id_
          , date                   = date_
          , star_count             = star_count_
          , auction_round_number   = auction_round_number_
          , auction_round_position = auction_round_position_
          , text                   = text_
          , is_private             = is_private_
          }
  parseJSON _ = mempty

