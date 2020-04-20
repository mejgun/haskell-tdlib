-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AuthenticationCodeType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AuthenticationCodeType = 
 AuthenticationCodeTypeTelegramMessage { _length :: Int }  
 | AuthenticationCodeTypeSms { _length :: Int }  
 | AuthenticationCodeTypeCall { _length :: Int }  
 | AuthenticationCodeTypeFlashCall { pattern :: String }  -- deriving (Show)

instance T.ToJSON AuthenticationCodeType where
 toJSON (AuthenticationCodeTypeTelegramMessage { _length = _length }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeTelegramMessage", "length" A..= _length ]

 toJSON (AuthenticationCodeTypeSms { _length = _length }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeSms", "length" A..= _length ]

 toJSON (AuthenticationCodeTypeCall { _length = _length }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeCall", "length" A..= _length ]

 toJSON (AuthenticationCodeTypeFlashCall { pattern = pattern }) =
  A.object [ "@type" A..= T.String "authenticationCodeTypeFlashCall", "pattern" A..= pattern ]
-- authenticationCodeTypeTelegramMessage AuthenticationCodeType  { _length :: Int } 

-- authenticationCodeTypeSms AuthenticationCodeType  { _length :: Int } 

-- authenticationCodeTypeCall AuthenticationCodeType  { _length :: Int } 

-- authenticationCodeTypeFlashCall AuthenticationCodeType  { pattern :: String } 

