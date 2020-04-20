-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendAuthenticationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendAuthenticationCode = 
 ResendAuthenticationCode -- deriving (Show)

instance T.ToJSON ResendAuthenticationCode where
 toJSON (ResendAuthenticationCode {  }) =
  A.object [ "@type" A..= T.String "resendAuthenticationCode" ]
-- resendAuthenticationCode ResendAuthenticationCode 

