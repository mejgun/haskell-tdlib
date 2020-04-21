-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetDatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetDatabaseStatistics = 
 GetDatabaseStatistics deriving (Show)

instance T.ToJSON GetDatabaseStatistics where
 toJSON (GetDatabaseStatistics {  }) =
  A.object [ "@type" A..= T.String "getDatabaseStatistics" ]



instance T.FromJSON GetDatabaseStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getDatabaseStatistics" -> parseGetDatabaseStatistics v

   _ -> mempty ""
  where
   parseGetDatabaseStatistics :: A.Value -> T.Parser GetDatabaseStatistics
   parseGetDatabaseStatistics = A.withObject "GetDatabaseStatistics" $ \o -> do
    return $ GetDatabaseStatistics {  }