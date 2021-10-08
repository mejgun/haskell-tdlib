-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetJsonString where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

-- |
-- 
-- Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously 
-- 
-- __json_value__ The JsonValue object
data GetJsonString = 

 GetJsonString { json_value :: Maybe JsonValue.JsonValue }  deriving (Eq)

instance Show GetJsonString where
 show GetJsonString { json_value=json_value } =
  "GetJsonString" ++ cc [p "json_value" json_value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetJsonString where
 toJSON GetJsonString { json_value = json_value } =
  A.object [ "@type" A..= T.String "getJsonString", "json_value" A..= json_value ]

instance T.FromJSON GetJsonString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getJsonString" -> parseGetJsonString v
   _ -> mempty
  where
   parseGetJsonString :: A.Value -> T.Parser GetJsonString
   parseGetJsonString = A.withObject "GetJsonString" $ \o -> do
    json_value <- o A..:? "json_value"
    return $ GetJsonString { json_value = json_value }
 parseJSON _ = mempty
