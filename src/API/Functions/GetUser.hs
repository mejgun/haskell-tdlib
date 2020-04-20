-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetUser = 
 GetUser { user_id :: Int }  -- deriving (Show)

instance T.ToJSON GetUser where
 toJSON (GetUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "getUser", "user_id" A..= user_id ]
-- getUser GetUser  { user_id :: Int } 

