-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetJsonString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

--main = putStrLn "ok"

data GetJsonString = 
 GetJsonString { json_value :: JsonValue.JsonValue }  -- deriving (Show)

instance T.ToJSON GetJsonString where
 toJSON (GetJsonString { json_value = json_value }) =
  A.object [ "@type" A..= T.String "getJsonString", "json_value" A..= json_value ]
-- getJsonString GetJsonString  { json_value :: JsonValue.JsonValue } 

