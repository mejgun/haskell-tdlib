-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.JsonValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonObjectMember as JsonObjectMember

--main = putStrLn "ok"

data JsonValue = 
 JsonValueNull 
 | JsonValueBoolean { __value :: Bool }  
 | JsonValueNumber { _value :: Float }  
 | JsonValueString { value :: String }  
 | JsonValueArray { values :: [JsonValue] }  
 | JsonValueObject { members :: [JsonObjectMember.JsonObjectMember] }  -- deriving (Show)

instance T.ToJSON JsonValue where
 toJSON (JsonValueNull {  }) =
  A.object [ "@type" A..= T.String "jsonValueNull" ]

 toJSON (JsonValueBoolean { __value = __value }) =
  A.object [ "@type" A..= T.String "jsonValueBoolean", "value" A..= __value ]

 toJSON (JsonValueNumber { _value = _value }) =
  A.object [ "@type" A..= T.String "jsonValueNumber", "value" A..= _value ]

 toJSON (JsonValueString { value = value }) =
  A.object [ "@type" A..= T.String "jsonValueString", "value" A..= value ]

 toJSON (JsonValueArray { values = values }) =
  A.object [ "@type" A..= T.String "jsonValueArray", "values" A..= values ]

 toJSON (JsonValueObject { members = members }) =
  A.object [ "@type" A..= T.String "jsonValueObject", "members" A..= members ]
-- jsonValueNull JsonValue 

-- jsonValueBoolean JsonValue  { __value :: Bool } 

-- jsonValueNumber JsonValue  { _value :: Float } 

-- jsonValueString JsonValue  { value :: String } 

-- jsonValueArray JsonValue  { values :: [JsonValue] } 

-- jsonValueObject JsonValue  { members :: [JsonObjectMember.JsonObjectMember] } 

