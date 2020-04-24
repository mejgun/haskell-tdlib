-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageLiveLocation where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditMessageLiveLocation = 
 EditMessageLiveLocation { location :: Maybe Location.Location, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    location <- optional $ o A..: "location"
    reply_markup <- optional $ o A..: "reply_markup"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ EditMessageLiveLocation { location = location, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }