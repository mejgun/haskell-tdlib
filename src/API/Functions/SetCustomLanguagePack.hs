-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCustomLanguagePack where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

data SetCustomLanguagePack = 
 SetCustomLanguagePack { strings :: Maybe [LanguagePackString.LanguagePackString], info :: Maybe LanguagePackInfo.LanguagePackInfo }  deriving (Show, Eq)

instance T.ToJSON SetCustomLanguagePack where
 toJSON (SetCustomLanguagePack { strings = strings, info = info }) =
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