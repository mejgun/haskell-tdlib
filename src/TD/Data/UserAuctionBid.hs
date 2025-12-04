module TD.Data.UserAuctionBid
  (UserAuctionBid(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data UserAuctionBid
  = UserAuctionBid -- ^ Describes a bid of the current user in an auction
    { star_count          :: Maybe Int                         -- ^ The number of Telegram Stars that were put in the bid
    , bid_date            :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the bid was made
    , next_bid_star_count :: Maybe Int                         -- ^ The minimum number of Telegram Stars that can be put for the next bid
    , owner_id            :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the chat that will receive the auctioned item. If the auction is opened in context of another user or chat, then a warning is supposed to be shown to the current user
    , was_returned        :: Maybe Bool                        -- ^ True, if the bid was returned to the user, because it was outbid and can't win anymore
    }
  deriving (Eq, Show)

instance I.ShortShow UserAuctionBid where
  shortShow UserAuctionBid
    { star_count          = star_count_
    , bid_date            = bid_date_
    , next_bid_star_count = next_bid_star_count_
    , owner_id            = owner_id_
    , was_returned        = was_returned_
    }
      = "UserAuctionBid"
        ++ I.cc
        [ "star_count"          `I.p` star_count_
        , "bid_date"            `I.p` bid_date_
        , "next_bid_star_count" `I.p` next_bid_star_count_
        , "owner_id"            `I.p` owner_id_
        , "was_returned"        `I.p` was_returned_
        ]

instance AT.FromJSON UserAuctionBid where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userAuctionBid" -> parseUserAuctionBid v
      _                -> mempty
    
    where
      parseUserAuctionBid :: A.Value -> AT.Parser UserAuctionBid
      parseUserAuctionBid = A.withObject "UserAuctionBid" $ \o -> do
        star_count_          <- o A..:?  "star_count"
        bid_date_            <- o A..:?  "bid_date"
        next_bid_star_count_ <- o A..:?  "next_bid_star_count"
        owner_id_            <- o A..:?  "owner_id"
        was_returned_        <- o A..:?  "was_returned"
        pure $ UserAuctionBid
          { star_count          = star_count_
          , bid_date            = bid_date_
          , next_bid_star_count = next_bid_star_count_
          , owner_id            = owner_id_
          , was_returned        = was_returned_
          }
  parseJSON _ = mempty

