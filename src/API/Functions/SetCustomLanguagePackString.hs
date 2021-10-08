-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCustomLanguagePackString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

-- |
-- 
-- Adds, edits or deletes a string in a custom local language pack. Can be called before authorization 
-- 
-- __language_pack_id__ Identifier of a previously added custom local language pack in the current localization target
-- 
-- __new_string__ New language pack string
data SetCustomLanguagePackString = 

 SetCustomLanguagePackString { new_string :: Maybe LanguagePackString.LanguagePackString, language_pack_id :: Maybe String }  deriving (Eq)

instance Show SetCustomLanguagePackString where
 show SetCustomLanguagePackString { new_string=new_string, language_pack_id=language_pack_id } =
  "SetCustomLanguagePackString" ++ cc [p "new_string" new_string, p "language_pack_id" language_pack_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetCustomLanguagePackString where
 toJSON SetCustomLanguagePackString { new_string = new_string, language_pack_id = language_pack_id } =
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
 parseJSON _ = mempty
