-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.JsonObjectMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

--main = putStrLn "ok"

data JsonObjectMember = 
 JsonObjectMember { value :: JsonValue.JsonValue, key :: String }  deriving (Show)

instance T.ToJSON JsonObjectMember where
 toJSON (JsonObjectMember { value = value, key = key }) =
  A.object [ "@type" A..= T.String "jsonObjectMember", "value" A..= value, "key" A..= key ]



instance T.FromJSON JsonObjectMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "jsonObjectMember" -> parseJsonObjectMember v

   _ -> mempty ""
  where
   parseJsonObjectMember :: A.Value -> T.Parser JsonObjectMember
   parseJsonObjectMember = A.withObject "JsonObjectMember" $ \o -> do
    value <- o A..: "value"
    key <- o A..: "key"
    return $ JsonObjectMember { value = value, key = key }