-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLanguagePackString = 
 GetLanguagePackString { key :: String, language_pack_id :: String, localization_target :: String, language_pack_database_path :: String }  -- deriving (Show)

instance T.ToJSON GetLanguagePackString where
 toJSON (GetLanguagePackString { key = key, language_pack_id = language_pack_id, localization_target = localization_target, language_pack_database_path = language_pack_database_path }) =
  A.object [ "@type" A..= T.String "getLanguagePackString", "key" A..= key, "language_pack_id" A..= language_pack_id, "localization_target" A..= localization_target, "language_pack_database_path" A..= language_pack_database_path ]
-- getLanguagePackString GetLanguagePackString  { key :: String, language_pack_id :: String, localization_target :: String, language_pack_database_path :: String } 

