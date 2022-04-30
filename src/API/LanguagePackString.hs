-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.LanguagePackStringValue as LanguagePackStringValue

-- |
-- 
-- Represents one language pack string 
-- 
-- __key__ String key
-- 
-- __value__ String value; pass null if the string needs to be taken from the built-in English language pack
data LanguagePackString = 

 LanguagePackString { value :: Maybe LanguagePackStringValue.LanguagePackStringValue, key :: Maybe String }  deriving (Eq)

instance Show LanguagePackString where
 show LanguagePackString { value=value, key=key } =
  "LanguagePackString" ++ U.cc [U.p "value" value, U.p "key" key ]

instance T.ToJSON LanguagePackString where
 toJSON LanguagePackString { value = value, key = key } =
  A.object [ "@type" A..= T.String "languagePackString", "value" A..= value, "key" A..= key ]

instance T.FromJSON LanguagePackString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "languagePackString" -> parseLanguagePackString v
   _ -> mempty
  where
   parseLanguagePackString :: A.Value -> T.Parser LanguagePackString
   parseLanguagePackString = A.withObject "LanguagePackString" $ \o -> do
    value <- o A..:? "value"
    key <- o A..:? "key"
    return $ LanguagePackString { value = value, key = key }
 parseJSON _ = mempty
