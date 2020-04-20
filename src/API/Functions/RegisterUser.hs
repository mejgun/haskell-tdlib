-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RegisterUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RegisterUser = 
 RegisterUser { last_name :: String, first_name :: String }  -- deriving (Show)

instance T.ToJSON RegisterUser where
 toJSON (RegisterUser { last_name = last_name, first_name = first_name }) =
  A.object [ "@type" A..= T.String "registerUser", "last_name" A..= last_name, "first_name" A..= first_name ]
-- registerUser RegisterUser  { last_name :: String, first_name :: String } 

