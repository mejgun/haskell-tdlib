-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCustomLanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

--main = putStrLn "ok"

data SetCustomLanguagePackString = 
 SetCustomLanguagePackString { new_string :: LanguagePackString.LanguagePackString, language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON SetCustomLanguagePackString where
 toJSON (SetCustomLanguagePackString { new_string = new_string, language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "setCustomLanguagePackString", "new_string" A..= new_string, "language_pack_id" A..= language_pack_id ]
-- setCustomLanguagePackString SetCustomLanguagePackString  { new_string :: LanguagePackString.LanguagePackString, language_pack_id :: String } 

