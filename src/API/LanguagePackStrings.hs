-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStrings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

-- |
-- 
-- Contains a list of language pack strings 
-- 
-- __strings__ A list of language pack strings
data LanguagePackStrings = 

 LanguagePackStrings { strings :: Maybe [LanguagePackString.LanguagePackString] }  deriving (Show, Eq)

instance T.ToJSON LanguagePackStrings where
 toJSON (LanguagePackStrings { strings = strings }) =
  A.object [ "@type" A..= T.String "languagePackStrings", "strings" A..= strings ]

instance T.FromJSON LanguagePackStrings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "languagePackStrings" -> parseLanguagePackStrings v
   _ -> mempty
  where
   parseLanguagePackStrings :: A.Value -> T.Parser LanguagePackStrings
   parseLanguagePackStrings = A.withObject "LanguagePackStrings" $ \o -> do
    strings <- o A..:? "strings"
    return $ LanguagePackStrings { strings = strings }