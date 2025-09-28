module TD.Query.GetUpgradedGiftValueInfo
  (GetUpgradedGiftValueInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about value of an upgraded gift by its name. Returns 'TD.Data.UpgradedGiftValueInfo.UpgradedGiftValueInfo'
data GetUpgradedGiftValueInfo
  = GetUpgradedGiftValueInfo
    { name :: Maybe T.Text -- ^ Unique name of the upgraded gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGiftValueInfo where
  shortShow
    GetUpgradedGiftValueInfo
      { name = name_
      }
        = "GetUpgradedGiftValueInfo"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON GetUpgradedGiftValueInfo where
  toJSON
    GetUpgradedGiftValueInfo
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "getUpgradedGiftValueInfo"
          , "name"  A..= name_
          ]

