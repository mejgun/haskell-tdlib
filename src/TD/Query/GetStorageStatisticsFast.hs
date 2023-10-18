module TD.Query.GetStorageStatisticsFast
  (GetStorageStatisticsFast(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Quickly returns approximate storage usage statistics. Can be called before authorization. Returns 'TD.Data.StorageStatisticsFast.StorageStatisticsFast'
data GetStorageStatisticsFast
  = GetStorageStatisticsFast
  deriving (Eq, Show)

instance I.ShortShow GetStorageStatisticsFast where
  shortShow
    GetStorageStatisticsFast
        = "GetStorageStatisticsFast"

instance AT.ToJSON GetStorageStatisticsFast where
  toJSON
    GetStorageStatisticsFast
        = A.object
          [ "@type" A..= AT.String "getStorageStatisticsFast"
          ]

