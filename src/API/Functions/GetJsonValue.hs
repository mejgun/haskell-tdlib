-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetJsonValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Converts a JSON-serialized string to corresponding JsonValue object. This is an offline method. Can be called before authorization. Can be called synchronously 
-- 
-- __json__ The JSON-serialized string
data GetJsonValue = 

 GetJsonValue { json :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetJsonValue where
 toJSON (GetJsonValue { json = json }) =
  A.object [ "@type" A..= T.String "getJsonValue", "json" A..= json ]

instance T.FromJSON GetJsonValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getJsonValue" -> parseGetJsonValue v
   _ -> mempty
  where
   parseGetJsonValue :: A.Value -> T.Parser GetJsonValue
   parseGetJsonValue = A.withObject "GetJsonValue" $ \o -> do
    json <- o A..:? "json"
    return $ GetJsonValue { json = json }