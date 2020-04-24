-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SaveApplicationLogEvent where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

data SaveApplicationLogEvent = 
 SaveApplicationLogEvent { _data :: Maybe JsonValue.JsonValue, chat_id :: Maybe Int, _type :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SaveApplicationLogEvent where
 toJSON (SaveApplicationLogEvent { _data = _data, chat_id = chat_id, _type = _type }) =
  A.object [ "@type" A..= T.String "saveApplicationLogEvent", "data" A..= _data, "chat_id" A..= chat_id, "type" A..= _type ]

instance T.FromJSON SaveApplicationLogEvent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "saveApplicationLogEvent" -> parseSaveApplicationLogEvent v
   _ -> mempty
  where
   parseSaveApplicationLogEvent :: A.Value -> T.Parser SaveApplicationLogEvent
   parseSaveApplicationLogEvent = A.withObject "SaveApplicationLogEvent" $ \o -> do
    _data <- optional $ o A..: "data"
    chat_id <- optional $ o A..: "chat_id"
    _type <- optional $ o A..: "type"
    return $ SaveApplicationLogEvent { _data = _data, chat_id = chat_id, _type = _type }