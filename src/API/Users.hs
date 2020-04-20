-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Users where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Users = 
 Users { user_ids :: [Int], total_count :: Int }  -- deriving (Show)

instance T.ToJSON Users where
 toJSON (Users { user_ids = user_ids, total_count = total_count }) =
  A.object [ "@type" A..= T.String "users", "user_ids" A..= user_ids, "total_count" A..= total_count ]
-- users Users  { user_ids :: [Int], total_count :: Int } 

