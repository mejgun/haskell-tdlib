-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountryCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetCountryCode = 
 GetCountryCode -- deriving (Show)

instance T.ToJSON GetCountryCode where
 toJSON (GetCountryCode {  }) =
  A.object [ "@type" A..= T.String "getCountryCode" ]
-- getCountryCode GetCountryCode 

