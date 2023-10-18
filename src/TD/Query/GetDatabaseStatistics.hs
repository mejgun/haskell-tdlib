module TD.Query.GetDatabaseStatistics
  (GetDatabaseStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns database statistics. Returns 'TD.Data.DatabaseStatistics.DatabaseStatistics'
data GetDatabaseStatistics
  = GetDatabaseStatistics
  deriving (Eq, Show)

instance I.ShortShow GetDatabaseStatistics where
  shortShow
    GetDatabaseStatistics
        = "GetDatabaseStatistics"

instance AT.ToJSON GetDatabaseStatistics where
  toJSON
    GetDatabaseStatistics
        = A.object
          [ "@type" A..= AT.String "getDatabaseStatistics"
          ]

