-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DatabaseStatistics = 
 DatabaseStatistics { statistics :: String }  -- deriving (Show)

instance T.ToJSON DatabaseStatistics where
 toJSON (DatabaseStatistics { statistics = statistics }) =
  A.object [ "@type" A..= T.String "databaseStatistics", "statistics" A..= statistics ]
-- databaseStatistics DatabaseStatistics  { statistics :: String } 



instance T.FromJSON DatabaseStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "databaseStatistics" -> parseDatabaseStatistics v
  where
   parseDatabaseStatistics :: A.Value -> T.Parser DatabaseStatistics
   parseDatabaseStatistics = A.withObject "DatabaseStatistics" $ \o -> do
    statistics <- o A..: "statistics"
    return $ DatabaseStatistics { statistics = statistics }