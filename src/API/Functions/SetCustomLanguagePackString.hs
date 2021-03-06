-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCustomLanguagePackString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

-- |
-- 
-- Adds, edits or deletes a string in a custom local language pack. Can be called before authorization 
-- 
-- __language_pack_id__ Identifier of a previously added custom local language pack in the current localization target
-- 
-- __new_string__ New language pack string
data SetCustomLanguagePackString = 

 SetCustomLanguagePackString { new_string :: Maybe LanguagePackString.LanguagePackString, language_pack_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SetCustomLanguagePackString where
 toJSON (SetCustomLanguagePackString { new_string = new_string, language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "setCustomLanguagePackString", "new_string" A..= new_string, "language_pack_id" A..= language_pack_id ]

instance T.FromJSON SetCustomLanguagePackString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setCustomLanguagePackString" -> parseSetCustomLanguagePackString v
   _ -> mempty
  where
   parseSetCustomLanguagePackString :: A.Value -> T.Parser SetCustomLanguagePackString
   parseSetCustomLanguagePackString = A.withObject "SetCustomLanguagePackString" $ \o -> do
    new_string <- o A..:? "new_string"
    language_pack_id <- o A..:? "language_pack_id"
    return $ SetCustomLanguagePackString { new_string = new_string, language_pack_id = language_pack_id }