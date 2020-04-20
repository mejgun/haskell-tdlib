-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckAuthenticationPassword = 
 CheckAuthenticationPassword { password :: String }  -- deriving (Show)

instance T.ToJSON CheckAuthenticationPassword where
 toJSON (CheckAuthenticationPassword { password = password }) =
  A.object [ "@type" A..= T.String "checkAuthenticationPassword", "password" A..= password ]
-- checkAuthenticationPassword CheckAuthenticationPassword  { password :: String } 

