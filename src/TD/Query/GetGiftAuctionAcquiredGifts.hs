module TD.Query.GetGiftAuctionAcquiredGifts
  (GetGiftAuctionAcquiredGifts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the gifts that were acquired by the current user on a gift auction. Returns 'TD.Data.GiftAuctionAcquiredGifts.GiftAuctionAcquiredGifts'
data GetGiftAuctionAcquiredGifts
  = GetGiftAuctionAcquiredGifts
    { gift_id :: Maybe Int -- ^ Identifier of the auctioned gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftAuctionAcquiredGifts where
  shortShow
    GetGiftAuctionAcquiredGifts
      { gift_id = gift_id_
      }
        = "GetGiftAuctionAcquiredGifts"
          ++ I.cc
          [ "gift_id" `I.p` gift_id_
          ]

instance AT.ToJSON GetGiftAuctionAcquiredGifts where
  toJSON
    GetGiftAuctionAcquiredGifts
      { gift_id = gift_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getGiftAuctionAcquiredGifts"
          , "gift_id" A..= fmap I.writeInt64  gift_id_
          ]

