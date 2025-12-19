module TD.Query.GetGiftUpgradeVariants
  (GetGiftUpgradeVariants(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all possible variants of upgraded gifts for a regular gift. Returns 'TD.Data.GiftUpgradeVariants.GiftUpgradeVariants'
data GetGiftUpgradeVariants
  = GetGiftUpgradeVariants
    { gift_id :: Maybe Int -- ^ Identifier of the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftUpgradeVariants where
  shortShow
    GetGiftUpgradeVariants
      { gift_id = gift_id_
      }
        = "GetGiftUpgradeVariants"
          ++ I.cc
          [ "gift_id" `I.p` gift_id_
          ]

instance AT.ToJSON GetGiftUpgradeVariants where
  toJSON
    GetGiftUpgradeVariants
      { gift_id = gift_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getGiftUpgradeVariants"
          , "gift_id" A..= fmap I.writeInt64  gift_id_
          ]

