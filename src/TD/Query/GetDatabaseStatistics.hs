module TD.Query.GetDatabaseStatistics
  (GetDatabaseStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns database statistics
data GetDatabaseStatistics
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

