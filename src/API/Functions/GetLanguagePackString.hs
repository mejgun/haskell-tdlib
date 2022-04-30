-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously
-- 
-- __language_pack_database_path__ Path to the language pack database in which strings are stored
-- 
-- __localization_target__ Localization target to which the language pack belongs
-- 
-- __language_pack_id__ Language pack identifier
-- 
-- __key__ Language pack key of the string to be returned
data GetLanguagePackString = 

 GetLanguagePackString { key :: Maybe String, language_pack_id :: Maybe String, localization_target :: Maybe String, language_pack_database_path :: Maybe String }  deriving (Eq)

instance Show GetLanguagePackString where
 show GetLanguagePackString { key=key, language_pack_id=language_pack_id, localization_target=localization_target, language_pack_database_path=language_pack_database_path } =
  "GetLanguagePackString" ++ U.cc [U.p "key" key, U.p "language_pack_id" language_pack_id, U.p "localization_target" localization_target, U.p "language_pack_database_path" language_pack_database_path ]

instance T.ToJSON GetLanguagePackString where
 toJSON GetLanguagePackString { key = key, language_pack_id = language_pack_id, localization_target = localization_target, language_pack_database_path = language_pack_database_path } =
  A.object [ "@type" A..= T.String "getLanguagePackString", "key" A..= key, "language_pack_id" A..= language_pack_id, "localization_target" A..= localization_target, "language_pack_database_path" A..= language_pack_database_path ]

instance T.FromJSON GetLanguagePackString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLanguagePackString" -> parseGetLanguagePackString v
   _ -> mempty
  where
   parseGetLanguagePackString :: A.Value -> T.Parser GetLanguagePackString
   parseGetLanguagePackString = A.withObject "GetLanguagePackString" $ \o -> do
    key <- o A..:? "key"
    language_pack_id <- o A..:? "language_pack_id"
    localization_target <- o A..:? "localization_target"
    language_pack_database_path <- o A..:? "language_pack_database_path"
    return $ GetLanguagePackString { key = key, language_pack_id = language_pack_id, localization_target = localization_target, language_pack_database_path = language_pack_database_path }
 parseJSON _ = mempty
