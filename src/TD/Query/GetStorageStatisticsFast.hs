module TD.Query.GetStorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
