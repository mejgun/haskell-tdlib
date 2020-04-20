-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetJsonValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetJsonValue = 
 GetJsonValue { json :: String }  -- deriving (Show)

instance T.ToJSON GetJsonValue where
 toJSON (GetJsonValue { json = json }) =
  A.object [ "@type" A..= T.String "getJsonValue", "json" A..= json ]
-- getJsonValue GetJsonValue  { json :: String } 



instance T.FromJSON GetJsonValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getJsonValue" -> parseGetJsonValue v
  where
   parseGetJsonValue :: A.Value -> T.Parser GetJsonValue
   parseGetJsonValue = A.withObject "GetJsonValue" $ \o -> do
    json <- o A..: "json"
    return $ GetJsonValue { json = json }