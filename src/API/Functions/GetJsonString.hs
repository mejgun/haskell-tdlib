-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetJsonString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

--main = putStrLn "ok"

data GetJsonString = 
 GetJsonString { json_value :: JsonValue.JsonValue }  deriving (Show)

instance T.ToJSON GetJsonString where
 toJSON (GetJsonString { json_value = json_value }) =
  A.object [ "@type" A..= T.String "getJsonString", "json_value" A..= json_value ]



instance T.FromJSON GetJsonString where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getJsonString" -> parseGetJsonString v

   _ -> mempty ""
  where
   parseGetJsonString :: A.Value -> T.Parser GetJsonString
   parseGetJsonString = A.withObject "GetJsonString" $ \o -> do
    json_value <- o A..: "json_value"
    return $ GetJsonString { json_value = json_value }