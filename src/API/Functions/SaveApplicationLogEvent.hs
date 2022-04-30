-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SaveApplicationLogEvent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

-- |
-- 
-- Saves application log event on the server. Can be called before authorization 
-- 
-- __type__ Event type
-- 
-- __chat_id__ Optional chat identifier, associated with the event
-- 
-- __data__ The log event data
data SaveApplicationLogEvent = 

 SaveApplicationLogEvent { _data :: Maybe JsonValue.JsonValue, chat_id :: Maybe Int, _type :: Maybe String }  deriving (Eq)

instance Show SaveApplicationLogEvent where
 show SaveApplicationLogEvent { _data=_data, chat_id=chat_id, _type=_type } =
  "SaveApplicationLogEvent" ++ U.cc [U.p "_data" _data, U.p "chat_id" chat_id, U.p "_type" _type ]

instance T.ToJSON SaveApplicationLogEvent where
 toJSON SaveApplicationLogEvent { _data = _data, chat_id = chat_id, _type = _type } =
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
    _data <- o A..:? "data"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _type <- o A..:? "type"
    return $ SaveApplicationLogEvent { _data = _data, chat_id = chat_id, _type = _type }
 parseJSON _ = mempty
