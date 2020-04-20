-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCustomLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

--main = putStrLn "ok"

data SetCustomLanguagePack = 
 SetCustomLanguagePack { strings :: [LanguagePackString.LanguagePackString], info :: LanguagePackInfo.LanguagePackInfo }  -- deriving (Show)

instance T.ToJSON SetCustomLanguagePack where
 toJSON (SetCustomLanguagePack { strings = strings, info = info }) =
  A.object [ "@type" A..= T.String "setCustomLanguagePack", "strings" A..= strings, "info" A..= info ]
-- setCustomLanguagePack SetCustomLanguagePack  { strings :: [LanguagePackString.LanguagePackString], info :: LanguagePackInfo.LanguagePackInfo } 

