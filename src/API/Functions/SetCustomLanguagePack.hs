-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCustomLanguagePack where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

-- |
-- 
-- Adds or changes a custom local language pack to the current localization target 
-- 
-- __info__ Information about the language pack. Language pack ID must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
-- 
-- __strings__ Strings of the new language pack
data SetCustomLanguagePack = 

 SetCustomLanguagePack { strings :: Maybe [LanguagePackString.LanguagePackString], info :: Maybe LanguagePackInfo.LanguagePackInfo }  deriving (Eq)

instance Show SetCustomLanguagePack where
 show SetCustomLanguagePack { strings=strings, info=info } =
  "SetCustomLanguagePack" ++ U.cc [U.p "strings" strings, U.p "info" info ]

instance T.ToJSON SetCustomLanguagePack where
 toJSON SetCustomLanguagePack { strings = strings, info = info } =
  A.object [ "@type" A..= T.String "setCustomLanguagePack", "strings" A..= strings, "info" A..= info ]

instance T.FromJSON SetCustomLanguagePack where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setCustomLanguagePack" -> parseSetCustomLanguagePack v
   _ -> mempty
  where
   parseSetCustomLanguagePack :: A.Value -> T.Parser SetCustomLanguagePack
   parseSetCustomLanguagePack = A.withObject "SetCustomLanguagePack" $ \o -> do
    strings <- o A..:? "strings"
    info <- o A..:? "info"
    return $ SetCustomLanguagePack { strings = strings, info = info }
 parseJSON _ = mempty
