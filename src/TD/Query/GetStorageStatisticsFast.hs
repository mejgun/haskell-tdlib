module TD.Query.GetStorageStatisticsFast(GetStorageStatisticsFast(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetStorageStatisticsFast -- ^ Quickly returns approximate storage usage statistics. Can be called before authorization
  = GetStorageStatisticsFast
  deriving (Eq)

instance Show GetStorageStatisticsFast where
  show
    GetStorageStatisticsFast
        = "GetStorageStatisticsFast"

instance AT.ToJSON GetStorageStatisticsFast where
  toJSON
    GetStorageStatisticsFast
        = A.object
          [ "@type" A..= AT.String "getStorageStatisticsFast"
          ]
