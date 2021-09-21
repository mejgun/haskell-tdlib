-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageForwardOrigin as MessageForwardOrigin

-- |
-- 
-- Contains information about a forwarded message
-- 
-- __origin__ Origin of a forwarded message
-- 
-- __date__ Point in time (Unix timestamp) when the message was originally sent
-- 
-- __public_service_announcement_type__ The type of a public service announcement for the forwarded message
-- 
-- __from_chat_id__ For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the chat from which the message was forwarded last time; 0 if unknown
-- 
-- __from_message_id__ For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the original message from which the new message was forwarded last time; 0 if unknown
data MessageForwardInfo = 

 MessageForwardInfo { from_message_id :: Maybe Int, from_chat_id :: Maybe Int, public_service_announcement_type :: Maybe String, date :: Maybe Int, origin :: Maybe MessageForwardOrigin.MessageForwardOrigin }  deriving (Show, Eq)

instance T.ToJSON MessageForwardInfo where
 toJSON (MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, public_service_announcement_type = public_service_announcement_type, date = date, origin = origin }) =
  A.object [ "@type" A..= T.String "messageForwardInfo", "from_message_id" A..= from_message_id, "from_chat_id" A..= from_chat_id, "public_service_announcement_type" A..= public_service_announcement_type, "date" A..= date, "origin" A..= origin ]

instance T.FromJSON MessageForwardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageForwardInfo" -> parseMessageForwardInfo v
   _ -> mempty
  where
   parseMessageForwardInfo :: A.Value -> T.Parser MessageForwardInfo
   parseMessageForwardInfo = A.withObject "MessageForwardInfo" $ \o -> do
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_chat_id <- mconcat [ o A..:? "from_chat_id", readMaybe <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    public_service_announcement_type <- o A..:? "public_service_announcement_type"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    origin <- o A..:? "origin"
    return $ MessageForwardInfo { from_message_id = from_message_id, from_chat_id = from_chat_id, public_service_announcement_type = public_service_announcement_type, date = date, origin = origin }