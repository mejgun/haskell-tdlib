-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DatabaseStatistics where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DatabaseStatistics = 
 DatabaseStatistics { statistics :: Maybe String }  deriving (Show)

instance T.ToJSON DatabaseStatistics where
 toJSON (DatabaseStatistics { statistics = statistics }) =
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
    statistics <- optional $ o A..: "statistics"
    return $ DatabaseStatistics { statistics = statistics }