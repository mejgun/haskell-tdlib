module TD.Data.DatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DatabaseStatistics
  = DatabaseStatistics -- ^ Contains database statistics
    { statistics :: Maybe T.Text -- ^ Database statistics in an unspecified human-readable format
    }
  deriving (Eq)

instance Show DatabaseStatistics where
  show DatabaseStatistics
    { statistics = statistics_
    }
      = "DatabaseStatistics"
        ++ I.cc
        [ "statistics" `I.p` statistics_
        ]

instance AT.FromJSON DatabaseStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "databaseStatistics" -> parseDatabaseStatistics v
      _                    -> mempty
    
    where
      parseDatabaseStatistics :: A.Value -> AT.Parser DatabaseStatistics
      parseDatabaseStatistics = A.withObject "DatabaseStatistics" $ \o -> do
        statistics_ <- o A..:?  "statistics"
        pure $ DatabaseStatistics
          { statistics = statistics_
          }

instance AT.ToJSON DatabaseStatistics where
  toJSON DatabaseStatistics
    { statistics = statistics_
    }
      = A.object
        [ "@type"      A..= AT.String "databaseStatistics"
        , "statistics" A..= statistics_
        ]
