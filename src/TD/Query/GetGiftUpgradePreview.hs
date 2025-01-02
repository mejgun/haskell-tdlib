module TD.Query.GetGiftUpgradePreview
  (GetGiftUpgradePreview(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns examples of possible upgraded gifts for a regular gift. Returns 'TD.Data.GiftUpgradePreview.GiftUpgradePreview'
data GetGiftUpgradePreview
  = GetGiftUpgradePreview
    { gift_id :: Maybe Int -- ^ Identifier of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftUpgradePreview where
  shortShow
    GetGiftUpgradePreview
      { gift_id = gift_id_
      }
        = "GetGiftUpgradePreview"
          ++ I.cc
          [ "gift_id" `I.p` gift_id_
          ]

instance AT.ToJSON GetGiftUpgradePreview where
  toJSON
    GetGiftUpgradePreview
      { gift_id = gift_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getGiftUpgradePreview"
          , "gift_id" A..= fmap I.writeInt64  gift_id_
          ]

