module TD.Query.GetGiftUpgradePreview
  (GetGiftUpgradePreview(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns examples of possible upgraded gifts for a regular gift. Returns 'TD.Data.GiftUpgradePreview.GiftUpgradePreview'
data GetGiftUpgradePreview
  = GetGiftUpgradePreview
    { regular_gift_id :: Maybe Int -- ^ Identifier of the regular gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftUpgradePreview where
  shortShow
    GetGiftUpgradePreview
      { regular_gift_id = regular_gift_id_
      }
        = "GetGiftUpgradePreview"
          ++ I.cc
          [ "regular_gift_id" `I.p` regular_gift_id_
          ]

instance AT.ToJSON GetGiftUpgradePreview where
  toJSON
    GetGiftUpgradePreview
      { regular_gift_id = regular_gift_id_
      }
        = A.object
          [ "@type"           A..= AT.String "getGiftUpgradePreview"
          , "regular_gift_id" A..= fmap I.writeInt64  regular_gift_id_
          ]

