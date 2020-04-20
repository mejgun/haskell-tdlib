-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckPhoneNumberConfirmationCode = 
 CheckPhoneNumberConfirmationCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckPhoneNumberConfirmationCode where
 toJSON (CheckPhoneNumberConfirmationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkPhoneNumberConfirmationCode", "code" A..= code ]
-- checkPhoneNumberConfirmationCode CheckPhoneNumberConfirmationCode  { code :: String } 

