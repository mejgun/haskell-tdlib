{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data DatabaseStatistics = -- | Contains database statistics
  DatabaseStatistics
  { -- | Database statistics in an unspecified human-readable format
    statistics :: Maybe String
  }
  deriving (Eq)

instance Show DatabaseStatistics where
  show
    DatabaseStatistics
      { statistics = statistics_
      } =
      "DatabaseStatistics"
        ++ U.cc
          [ U.p "statistics" statistics_
          ]

instance T.FromJSON DatabaseStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "databaseStatistics" -> parseDatabaseStatistics v
      _ -> mempty
    where
      parseDatabaseStatistics :: A.Value -> T.Parser DatabaseStatistics
      parseDatabaseStatistics = A.withObject "DatabaseStatistics" $ \o -> do
        statistics_ <- o A..:? "statistics"
        return $ DatabaseStatistics {statistics = statistics_}
  parseJSON _ = mempty

instance T.ToJSON DatabaseStatistics where
  toJSON
    DatabaseStatistics
      { statistics = statistics_
      } =
      A.object
        [ "@type" A..= T.String "databaseStatistics",
          "statistics" A..= statistics_
        ]
