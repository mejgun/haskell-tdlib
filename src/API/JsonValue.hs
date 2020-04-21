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
 | JsonValueObject { members :: [JsonObjectMember.JsonObjectMember] }  deriving (Show)

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

   _ -> mempty ""
  where
   parseJsonValueNull :: A.Value -> T.Parser JsonValue
   parseJsonValueNull = A.withObject "JsonValueNull" $ \o -> do
    return $ JsonValueNull {  }

   parseJsonValueBoolean :: A.Value -> T.Parser JsonValue
   parseJsonValueBoolean = A.withObject "JsonValueBoolean" $ \o -> do
    __value <- o A..: "value"
    return $ JsonValueBoolean { __value = __value }

   parseJsonValueNumber :: A.Value -> T.Parser JsonValue
   parseJsonValueNumber = A.withObject "JsonValueNumber" $ \o -> do
    _value <- o A..: "value"
    return $ JsonValueNumber { _value = _value }

   parseJsonValueString :: A.Value -> T.Parser JsonValue
   parseJsonValueString = A.withObject "JsonValueString" $ \o -> do
    value <- o A..: "value"
    return $ JsonValueString { value = value }

   parseJsonValueArray :: A.Value -> T.Parser JsonValue
   parseJsonValueArray = A.withObject "JsonValueArray" $ \o -> do
    values <- o A..: "values"
    return $ JsonValueArray { values = values }

   parseJsonValueObject :: A.Value -> T.Parser JsonValue
   parseJsonValueObject = A.withObject "JsonValueObject" $ \o -> do
    members <- o A..: "members"
    return $ JsonValueObject { members = members }