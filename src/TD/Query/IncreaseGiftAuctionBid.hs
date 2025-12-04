module TD.Query.IncreaseGiftAuctionBid
  (IncreaseGiftAuctionBid(..)
  , defaultIncreaseGiftAuctionBid
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Increases a bid for an auction gift without changing gift text and receiver. Returns 'TD.Data.Ok.Ok'
data IncreaseGiftAuctionBid
  = IncreaseGiftAuctionBid
    { gift_id    :: Maybe Int -- ^ Identifier of the gift to put the bid on
    , star_count :: Maybe Int -- ^ The number of Telegram Stars to put in the bid
    }
  deriving (Eq, Show)

instance I.ShortShow IncreaseGiftAuctionBid where
  shortShow
    IncreaseGiftAuctionBid
      { gift_id    = gift_id_
      , star_count = star_count_
      }
        = "IncreaseGiftAuctionBid"
          ++ I.cc
          [ "gift_id"    `I.p` gift_id_
          , "star_count" `I.p` star_count_
          ]

instance AT.ToJSON IncreaseGiftAuctionBid where
  toJSON
    IncreaseGiftAuctionBid
      { gift_id    = gift_id_
      , star_count = star_count_
      }
        = A.object
          [ "@type"      A..= AT.String "increaseGiftAuctionBid"
          , "gift_id"    A..= fmap I.writeInt64  gift_id_
          , "star_count" A..= star_count_
          ]

defaultIncreaseGiftAuctionBid :: IncreaseGiftAuctionBid
defaultIncreaseGiftAuctionBid =
  IncreaseGiftAuctionBid
    { gift_id    = Nothing
    , star_count = Nothing
    }

