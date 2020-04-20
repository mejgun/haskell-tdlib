-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBlockedUsers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetBlockedUsers = 
 GetBlockedUsers { limit :: Int, offset :: Int }  -- deriving (Show)

instance T.ToJSON GetBlockedUsers where
 toJSON (GetBlockedUsers { limit = limit, offset = offset }) =
  A.object [ "@type" A..= T.String "getBlockedUsers", "limit" A..= limit, "offset" A..= offset ]
-- getBlockedUsers GetBlockedUsers  { limit :: Int, offset :: Int } 

