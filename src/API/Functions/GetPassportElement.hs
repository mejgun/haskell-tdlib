-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data GetPassportElement = 
 GetPassportElement { password :: String, _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON GetPassportElement where
 toJSON (GetPassportElement { password = password, _type = _type }) =
  A.object [ "@type" A..= T.String "getPassportElement", "password" A..= password, "type" A..= _type ]
-- getPassportElement GetPassportElement  { password :: String, _type :: PassportElementType.PassportElementType } 

