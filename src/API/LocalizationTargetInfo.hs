-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LocalizationTargetInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

--main = putStrLn "ok"

data LocalizationTargetInfo = 
 LocalizationTargetInfo { language_packs :: [LanguagePackInfo.LanguagePackInfo] }  -- deriving (Show)

instance T.ToJSON LocalizationTargetInfo where
 toJSON (LocalizationTargetInfo { language_packs = language_packs }) =
  A.object [ "@type" A..= T.String "localizationTargetInfo", "language_packs" A..= language_packs ]
-- localizationTargetInfo LocalizationTargetInfo  { language_packs :: [LanguagePackInfo.LanguagePackInfo] } 

