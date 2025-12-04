module TD.Query.PlaceGiftAuctionBid
  (PlaceGiftAuctionBid(..)
  , defaultPlaceGiftAuctionBid
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Places a bid on an auction gift. Returns 'TD.Data.Ok.Ok'
data PlaceGiftAuctionBid
  = PlaceGiftAuctionBid
    { gift_id    :: Maybe Int                         -- ^ Identifier of the gift to place the bid on
    , star_count :: Maybe Int                         -- ^ The number of Telegram Stars to place in the bid
    , user_id    :: Maybe Int                         -- ^ Identifier of the user that will receive the gift
    , text       :: Maybe FormattedText.FormattedText -- ^ Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed. Must be empty if the receiver enabled paid messages
    , is_private :: Maybe Bool                        -- ^ Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
    }
  deriving (Eq, Show)

instance I.ShortShow PlaceGiftAuctionBid where
  shortShow
    PlaceGiftAuctionBid
      { gift_id    = gift_id_
      , star_count = star_count_
      , user_id    = user_id_
      , text       = text_
      , is_private = is_private_
      }
        = "PlaceGiftAuctionBid"
          ++ I.cc
          [ "gift_id"    `I.p` gift_id_
          , "star_count" `I.p` star_count_
          , "user_id"    `I.p` user_id_
          , "text"       `I.p` text_
          , "is_private" `I.p` is_private_
          ]

instance AT.ToJSON PlaceGiftAuctionBid where
  toJSON
    PlaceGiftAuctionBid
      { gift_id    = gift_id_
      , star_count = star_count_
      , user_id    = user_id_
      , text       = text_
      , is_private = is_private_
      }
        = A.object
          [ "@type"      A..= AT.String "placeGiftAuctionBid"
          , "gift_id"    A..= fmap I.writeInt64  gift_id_
          , "star_count" A..= star_count_
          , "user_id"    A..= user_id_
          , "text"       A..= text_
          , "is_private" A..= is_private_
          ]

defaultPlaceGiftAuctionBid :: PlaceGiftAuctionBid
defaultPlaceGiftAuctionBid =
  PlaceGiftAuctionBid
    { gift_id    = Nothing
    , star_count = Nothing
    , user_id    = Nothing
    , text       = Nothing
    , is_private = Nothing
    }

