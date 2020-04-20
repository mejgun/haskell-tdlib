-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportAuthorizationFormAvailableElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPassportAuthorizationFormAvailableElements = 
 GetPassportAuthorizationFormAvailableElements { password :: String, autorization_form_id :: Int }  -- deriving (Show)

instance T.ToJSON GetPassportAuthorizationFormAvailableElements where
 toJSON (GetPassportAuthorizationFormAvailableElements { password = password, autorization_form_id = autorization_form_id }) =
  A.object [ "@type" A..= T.String "getPassportAuthorizationFormAvailableElements", "password" A..= password, "autorization_form_id" A..= autorization_form_id ]
-- getPassportAuthorizationFormAvailableElements GetPassportAuthorizationFormAvailableElements  { password :: String, autorization_form_id :: Int } 

