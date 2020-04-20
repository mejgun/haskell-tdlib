-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendPhoneNumberConfirmationCode = 
 ResendPhoneNumberConfirmationCode -- deriving (Show)

instance T.ToJSON ResendPhoneNumberConfirmationCode where
 toJSON (ResendPhoneNumberConfirmationCode {  }) =
  A.object [ "@type" A..= T.String "resendPhoneNumberConfirmationCode" ]
-- resendPhoneNumberConfirmationCode ResendPhoneNumberConfirmationCode 

