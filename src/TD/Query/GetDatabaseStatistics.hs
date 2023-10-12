module TD.Query.GetDatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetDatabaseStatistics -- ^ Returns database statistics
  = GetDatabaseStatistics
  deriving (Eq)

instance Show GetDatabaseStatistics where
  show
    GetDatabaseStatistics
        = "GetDatabaseStatistics"

instance AT.ToJSON GetDatabaseStatistics where
  toJSON
    GetDatabaseStatistics
        = A.object
          [ "@type" A..= AT.String "getDatabaseStatistics"
          ]
