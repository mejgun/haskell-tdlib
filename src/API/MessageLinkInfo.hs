-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

-- |
-- 
-- Contains information about a link to a message in a chat
-- 
-- __is_public__ True, if the link is a public link for a message in a chat
-- 
-- __chat_id__ If found, identifier of the chat to which the message belongs, 0 otherwise
-- 
-- __message__ If found, the linked message; may be null
-- 
-- __media_timestamp__ Timestamp from which the video/audio/video note/voice note playing should start, in seconds; 0 if not specified. The media can be in the message content or in its web page preview
-- 
-- __for_album__ True, if the whole media album to which the message belongs is linked
-- 
-- __for_comment__ True, if the message is linked as a channel post comment or from a message thread
data MessageLinkInfo = 

 MessageLinkInfo { for_comment :: Maybe Bool, for_album :: Maybe Bool, media_timestamp :: Maybe Int, message :: Maybe Message.Message, chat_id :: Maybe Int, is_public :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON MessageLinkInfo where
 toJSON (MessageLinkInfo { for_comment = for_comment, for_album = for_album, media_timestamp = media_timestamp, message = message, chat_id = chat_id, is_public = is_public }) =
  A.object [ "@type" A..= T.String "messageLinkInfo", "for_comment" A..= for_comment, "for_album" A..= for_album, "media_timestamp" A..= media_timestamp, "message" A..= message, "chat_id" A..= chat_id, "is_public" A..= is_public ]

instance T.FromJSON MessageLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageLinkInfo" -> parseMessageLinkInfo v
   _ -> mempty
  where
   parseMessageLinkInfo :: A.Value -> T.Parser MessageLinkInfo
   parseMessageLinkInfo = A.withObject "MessageLinkInfo" $ \o -> do
    for_comment <- o A..:? "for_comment"
    for_album <- o A..:? "for_album"
    media_timestamp <- mconcat [ o A..:? "media_timestamp", readMaybe <$> (o A..: "media_timestamp" :: T.Parser String)] :: T.Parser (Maybe Int)
    message <- o A..:? "message"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_public <- o A..:? "is_public"
    return $ MessageLinkInfo { for_comment = for_comment, for_album = for_album, media_timestamp = media_timestamp, message = message, chat_id = chat_id, is_public = is_public }