-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SaveApplicationLogEvent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

--main = putStrLn "ok"

data SaveApplicationLogEvent = 
 SaveApplicationLogEvent { _data :: JsonValue.JsonValue, chat_id :: Int, _type :: String }  -- deriving (Show)

instance T.ToJSON SaveApplicationLogEvent where
 toJSON (SaveApplicationLogEvent { _data = _data, chat_id = chat_id, _type = _type }) =
  A.object [ "@type" A..= T.String "saveApplicationLogEvent", "data" A..= _data, "chat_id" A..= chat_id, "type" A..= _type ]
-- saveApplicationLogEvent SaveApplicationLogEvent  { _data :: JsonValue.JsonValue, chat_id :: Int, _type :: String } 



instance T.FromJSON SaveApplicationLogEvent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "saveApplicationLogEvent" -> parseSaveApplicationLogEvent v
  where
   parseSaveApplicationLogEvent :: A.Value -> T.Parser SaveApplicationLogEvent
   parseSaveApplicationLogEvent = A.withObject "SaveApplicationLogEvent" $ \o -> do
    _data <- o A..: "data"
    chat_id <- o A..: "chat_id"
    _type <- o A..: "type"
    return $ SaveApplicationLogEvent { _data = _data, chat_id = chat_id, _type = _type }