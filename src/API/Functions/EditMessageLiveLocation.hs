-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageLiveLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditMessageLiveLocation = 
 EditMessageLiveLocation { location :: Location.Location, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON EditMessageLiveLocation where
 toJSON (EditMessageLiveLocation { location = location, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageLiveLocation", "location" A..= location, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageLiveLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageLiveLocation" -> parseEditMessageLiveLocation v
   _ -> mempty
  where
   parseEditMessageLiveLocation :: A.Value -> T.Parser EditMessageLiveLocation
   parseEditMessageLiveLocation = A.withObject "EditMessageLiveLocation" $ \o -> do
    location <- o A..: "location"
    reply_markup <- o A..: "reply_markup"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ EditMessageLiveLocation { location = location, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }