module TD.Query.GetUpgradedGift
  (GetUpgradedGift(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about an upgraded gift by its name. Returns 'TD.Data.UpgradedGift.UpgradedGift'
data GetUpgradedGift
  = GetUpgradedGift
    { name :: Maybe T.Text -- ^ Unique name of the upgraded gift
    }
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGift where
  shortShow
    GetUpgradedGift
      { name = name_
      }
        = "GetUpgradedGift"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON GetUpgradedGift where
  toJSON
    GetUpgradedGift
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "getUpgradedGift"
          , "name"  A..= name_
          ]

