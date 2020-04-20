-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackStrings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLanguagePackStrings = 
 GetLanguagePackStrings { keys :: [String], language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON GetLanguagePackStrings where
 toJSON (GetLanguagePackStrings { keys = keys, language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "getLanguagePackStrings", "keys" A..= keys, "language_pack_id" A..= language_pack_id ]
-- getLanguagePackStrings GetLanguagePackStrings  { keys :: [String], language_pack_id :: String } 

