-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetDatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetDatabaseStatistics = 
 GetDatabaseStatistics -- deriving (Show)

instance T.ToJSON GetDatabaseStatistics where
 toJSON (GetDatabaseStatistics {  }) =
  A.object [ "@type" A..= T.String "getDatabaseStatistics" ]
-- getDatabaseStatistics GetDatabaseStatistics 

