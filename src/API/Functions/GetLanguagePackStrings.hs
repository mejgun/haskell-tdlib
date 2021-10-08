-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackStrings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns strings from a language pack in the current localization target by their keys. Can be called before authorization 
-- 
-- __language_pack_id__ Language pack identifier of the strings to be returned
-- 
-- __keys__ Language pack keys of the strings to be returned; leave empty to request all available strings
data GetLanguagePackStrings = 

 GetLanguagePackStrings { keys :: Maybe [String], language_pack_id :: Maybe String }  deriving (Eq)

instance Show GetLanguagePackStrings where
 show GetLanguagePackStrings { keys=keys, language_pack_id=language_pack_id } =
  "GetLanguagePackStrings" ++ cc [p "keys" keys, p "language_pack_id" language_pack_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetLanguagePackStrings where
 toJSON GetLanguagePackStrings { keys = keys, language_pack_id = language_pack_id } =
  A.object [ "@type" A..= T.String "getLanguagePackStrings", "keys" A..= keys, "language_pack_id" A..= language_pack_id ]

instance T.FromJSON GetLanguagePackStrings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLanguagePackStrings" -> parseGetLanguagePackStrings v
   _ -> mempty
  where
   parseGetLanguagePackStrings :: A.Value -> T.Parser GetLanguagePackStrings
   parseGetLanguagePackStrings = A.withObject "GetLanguagePackStrings" $ \o -> do
    keys <- o A..:? "keys"
    language_pack_id <- o A..:? "language_pack_id"
    return $ GetLanguagePackStrings { keys = keys, language_pack_id = language_pack_id }
 parseJSON _ = mempty
