-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LocalizationTargetInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

-- |
-- 
-- Contains information about the current localization target 
-- 
-- __language_packs__ List of available language packs for this application
data LocalizationTargetInfo = 

 LocalizationTargetInfo { language_packs :: Maybe [LanguagePackInfo.LanguagePackInfo] }  deriving (Eq)

instance Show LocalizationTargetInfo where
 show LocalizationTargetInfo { language_packs=language_packs } =
  "LocalizationTargetInfo" ++ cc [p "language_packs" language_packs ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON LocalizationTargetInfo where
 toJSON LocalizationTargetInfo { language_packs = language_packs } =
  A.object [ "@type" A..= T.String "localizationTargetInfo", "language_packs" A..= language_packs ]

instance T.FromJSON LocalizationTargetInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "localizationTargetInfo" -> parseLocalizationTargetInfo v
   _ -> mempty
  where
   parseLocalizationTargetInfo :: A.Value -> T.Parser LocalizationTargetInfo
   parseLocalizationTargetInfo = A.withObject "LocalizationTargetInfo" $ \o -> do
    language_packs <- o A..:? "language_packs"
    return $ LocalizationTargetInfo { language_packs = language_packs }
 parseJSON _ = mempty
