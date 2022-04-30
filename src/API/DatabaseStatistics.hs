-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DatabaseStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains database statistics
-- 
-- __statistics__ Database statistics in an unspecified human-readable format
data DatabaseStatistics = 

 DatabaseStatistics { statistics :: Maybe String }  deriving (Eq)

instance Show DatabaseStatistics where
 show DatabaseStatistics { statistics=statistics } =
  "DatabaseStatistics" ++ U.cc [U.p "statistics" statistics ]

instance T.ToJSON DatabaseStatistics where
 toJSON DatabaseStatistics { statistics = statistics } =
  A.object [ "@type" A..= T.String "databaseStatistics", "statistics" A..= statistics ]

instance T.FromJSON DatabaseStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "databaseStatistics" -> parseDatabaseStatistics v
   _ -> mempty
  where
   parseDatabaseStatistics :: A.Value -> T.Parser DatabaseStatistics
   parseDatabaseStatistics = A.withObject "DatabaseStatistics" $ \o -> do
    statistics <- o A..:? "statistics"
    return $ DatabaseStatistics { statistics = statistics }
 parseJSON _ = mempty
