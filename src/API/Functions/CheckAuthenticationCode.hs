-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckAuthenticationCode = 
 CheckAuthenticationCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckAuthenticationCode where
 toJSON (CheckAuthenticationCode { code = code }) =
  A.object [ "@type" A..= T.String "checkAuthenticationCode", "code" A..= code ]
-- checkAuthenticationCode CheckAuthenticationCode  { code :: String } 

