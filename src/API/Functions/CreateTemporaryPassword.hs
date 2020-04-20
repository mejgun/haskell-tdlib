-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateTemporaryPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateTemporaryPassword = 
 CreateTemporaryPassword { valid_for :: Int, password :: String }  -- deriving (Show)

instance T.ToJSON CreateTemporaryPassword where
 toJSON (CreateTemporaryPassword { valid_for = valid_for, password = password }) =
  A.object [ "@type" A..= T.String "createTemporaryPassword", "valid_for" A..= valid_for, "password" A..= password ]
-- createTemporaryPassword CreateTemporaryPassword  { valid_for :: Int, password :: String } 

