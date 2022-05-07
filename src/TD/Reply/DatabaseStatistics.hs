{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.DatabaseStatistics where

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
      { statistics = statistics
      } =
      "DatabaseStatistics"
        ++ U.cc
          [ U.p "statistics" statistics
          ]

instance T.FromJSON DatabaseStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "databaseStatistics" -> parseDatabaseStatistics v
      _ -> fail ""
    where
      parseDatabaseStatistics :: A.Value -> T.Parser DatabaseStatistics
      parseDatabaseStatistics = A.withObject "DatabaseStatistics" $ \o -> do
        statistics_ <- o A..:? "statistics"
        return $ DatabaseStatistics {statistics = statistics_}
  parseJSON _ = fail ""

instance T.ToJSON DatabaseStatistics where
  toJSON
    DatabaseStatistics
      { statistics = statistics
      } =
      A.object
        [ "@type" A..= T.String "databaseStatistics",
          "statistics" A..= statistics
        ]
