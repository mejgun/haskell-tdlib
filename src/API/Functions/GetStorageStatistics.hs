-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStorageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetStorageStatistics = 
 GetStorageStatistics { chat_limit :: Int }  -- deriving (Show)

instance T.ToJSON GetStorageStatistics where
 toJSON (GetStorageStatistics { chat_limit = chat_limit }) =
  A.object [ "@type" A..= T.String "getStorageStatistics", "chat_limit" A..= chat_limit ]
-- getStorageStatistics GetStorageStatistics  { chat_limit :: Int } 

