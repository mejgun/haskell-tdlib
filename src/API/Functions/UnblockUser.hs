-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnblockUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UnblockUser = 
 UnblockUser { user_id :: Int }  -- deriving (Show)

instance T.ToJSON UnblockUser where
 toJSON (UnblockUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "unblockUser", "user_id" A..= user_id ]
-- unblockUser UnblockUser  { user_id :: Int } 

