-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLanguagePackInfo = 
 GetLanguagePackInfo { language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON GetLanguagePackInfo where
 toJSON (GetLanguagePackInfo { language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "getLanguagePackInfo", "language_pack_id" A..= language_pack_id ]
-- getLanguagePackInfo GetLanguagePackInfo  { language_pack_id :: String } 

