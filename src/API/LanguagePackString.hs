-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackStringValue as LanguagePackStringValue

--main = putStrLn "ok"

data LanguagePackString = 
 LanguagePackString { value :: LanguagePackStringValue.LanguagePackStringValue, key :: String }  -- deriving (Show)

instance T.ToJSON LanguagePackString where
 toJSON (LanguagePackString { value = value, key = key }) =
  A.object [ "@type" A..= T.String "languagePackString", "value" A..= value, "key" A..= key ]
-- languagePackString LanguagePackString  { value :: LanguagePackStringValue.LanguagePackStringValue, key :: String } 

