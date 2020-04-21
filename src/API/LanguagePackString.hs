-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackStringValue as LanguagePackStringValue

--main = putStrLn "ok"

data LanguagePackString = 
 LanguagePackString { value :: LanguagePackStringValue.LanguagePackStringValue, key :: String }  deriving (Show)

instance T.ToJSON LanguagePackString where
 toJSON (LanguagePackString { value = value, key = key }) =
  A.object [ "@type" A..= T.String "languagePackString", "value" A..= value, "key" A..= key ]



instance T.FromJSON LanguagePackString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "languagePackString" -> parseLanguagePackString v

   _ -> mempty ""
  where
   parseLanguagePackString :: A.Value -> T.Parser LanguagePackString
   parseLanguagePackString = A.withObject "LanguagePackString" $ \o -> do
    value <- o A..: "value"
    key <- o A..: "key"
    return $ LanguagePackString { value = value, key = key }