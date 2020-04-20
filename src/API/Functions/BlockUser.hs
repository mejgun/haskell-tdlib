-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.BlockUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data BlockUser = 
 BlockUser { user_id :: Int }  -- deriving (Show)

instance T.ToJSON BlockUser where
 toJSON (BlockUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "blockUser", "user_id" A..= user_id ]
-- blockUser BlockUser  { user_id :: Int } 

