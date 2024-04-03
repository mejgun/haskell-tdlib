module TD.Query.GetCollectibleItemInfo
  (GetCollectibleItemInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CollectibleItemType as CollectibleItemType

-- | Returns information about a given collectible item that was purchased at https://fragment.com. Returns 'TD.Data.CollectibleItemInfo.CollectibleItemInfo'
data GetCollectibleItemInfo
  = GetCollectibleItemInfo
    { _type :: Maybe CollectibleItemType.CollectibleItemType -- ^ Type of the collectible item. The item must be used by a user and must be visible to the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetCollectibleItemInfo where
  shortShow
    GetCollectibleItemInfo
      { _type = _type_
      }
        = "GetCollectibleItemInfo"
          ++ I.cc
          [ "_type" `I.p` _type_
          ]

instance AT.ToJSON GetCollectibleItemInfo where
  toJSON
    GetCollectibleItemInfo
      { _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "getCollectibleItemInfo"
          , "type"  A..= _type_
          ]

