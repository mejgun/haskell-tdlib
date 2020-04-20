-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.JsonObjectMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

--main = putStrLn "ok"

data JsonObjectMember = 
 JsonObjectMember { value :: JsonValue.JsonValue, key :: String }  -- deriving (Show)

instance T.ToJSON JsonObjectMember where
 toJSON (JsonObjectMember { value = value, key = key }) =
  A.object [ "@type" A..= T.String "jsonObjectMember", "value" A..= value, "key" A..= key ]
-- jsonObjectMember JsonObjectMember  { value :: JsonValue.JsonValue, key :: String } 

