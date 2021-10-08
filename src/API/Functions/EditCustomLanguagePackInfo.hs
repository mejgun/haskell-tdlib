-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditCustomLanguagePackInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.LanguagePackInfo as LanguagePackInfo

-- |
-- 
-- Edits information about a custom local language pack in the current localization target. Can be called before authorization 
-- 
-- __info__ New information about the custom local language pack
data EditCustomLanguagePackInfo = 

 EditCustomLanguagePackInfo { info :: Maybe LanguagePackInfo.LanguagePackInfo }  deriving (Eq)

instance Show EditCustomLanguagePackInfo where
 show EditCustomLanguagePackInfo { info=info } =
  "EditCustomLanguagePackInfo" ++ cc [p "info" info ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditCustomLanguagePackInfo where
 toJSON EditCustomLanguagePackInfo { info = info } =
  A.object [ "@type" A..= T.String "editCustomLanguagePackInfo", "info" A..= info ]

instance T.FromJSON EditCustomLanguagePackInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editCustomLanguagePackInfo" -> parseEditCustomLanguagePackInfo v
   _ -> mempty
  where
   parseEditCustomLanguagePackInfo :: A.Value -> T.Parser EditCustomLanguagePackInfo
   parseEditCustomLanguagePackInfo = A.withObject "EditCustomLanguagePackInfo" $ \o -> do
    info <- o A..:? "info"
    return $ EditCustomLanguagePackInfo { info = info }
 parseJSON _ = mempty
