-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.JsonValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonObjectMember as JsonObjectMember

-- |
-- 
-- Represents a JSON value
data JsonValue = 
 -- |
 -- 
 -- Represents a null JSON value
 JsonValueNull |
 -- |
 -- 
 -- Represents a boolean JSON value 
 -- 
 -- __value__ The value
 JsonValueBoolean { __value :: Maybe Bool }  |
 -- |
 -- 
 -- Represents a numeric JSON value 
 -- 
 -- __value__ The value
 JsonValueNumber { _value :: Maybe Float }  |
 -- |
 -- 
 -- Represents a string JSON value 
 -- 
 -- __value__ The value
 JsonValueString { value :: Maybe String }  |
 -- |
 -- 
 -- Represents a JSON array 
 -- 
 -- __values__ The list of array elements
 JsonValueArray { values :: Maybe [JsonValue] }  |
 -- |
 -- 
 -- Represents a JSON object 
 -- 
 -- __members__ The list of object members
 JsonValueObject { members :: Maybe [JsonObjectMember.JsonObjectMember] }  deriving (Show, Eq)

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

instance T.FromJSON JsonValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "jsonValueNull" -> parseJsonValueNull v
   "jsonValueBoolean" -> parseJsonValueBoolean v
   "jsonValueNumber" -> parseJsonValueNumber v
   "jsonValueString" -> parseJsonValueString v
   "jsonValueArray" -> parseJsonValueArray v
   "jsonValueObject" -> parseJsonValueObject v
   _ -> mempty
  where
   parseJsonValueNull :: A.Value -> T.Parser JsonValue
   parseJsonValueNull = A.withObject "JsonValueNull" $ \o -> do
    return $ JsonValueNull {  }

   parseJsonValueBoolean :: A.Value -> T.Parser JsonValue
   parseJsonValueBoolean = A.withObject "JsonValueBoolean" $ \o -> do
    __value <- o A..:? "value"
    return $ JsonValueBoolean { __value = __value }

   parseJsonValueNumber :: A.Value -> T.Parser JsonValue
   parseJsonValueNumber = A.withObject "JsonValueNumber" $ \o -> do
    _value <- o A..:? "value"
    return $ JsonValueNumber { _value = _value }

   parseJsonValueString :: A.Value -> T.Parser JsonValue
   parseJsonValueString = A.withObject "JsonValueString" $ \o -> do
    value <- o A..:? "value"
    return $ JsonValueString { value = value }

   parseJsonValueArray :: A.Value -> T.Parser JsonValue
   parseJsonValueArray = A.withObject "JsonValueArray" $ \o -> do
    values <- o A..:? "values"
    return $ JsonValueArray { values = values }

   parseJsonValueObject :: A.Value -> T.Parser JsonValue
   parseJsonValueObject = A.withObject "JsonValueObject" $ \o -> do
    members <- o A..:? "members"
    return $ JsonValueObject { members = members }