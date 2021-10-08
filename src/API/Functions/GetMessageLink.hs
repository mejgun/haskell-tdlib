-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels, or if message.can_get_media_timestamp_links and a media timestamp link is generated. This is an offline request
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
-- 
-- __media_timestamp__ If not 0, timestamp from which the video/audio/video note/voice note playing must start, in seconds. The media can be in the message content or in its web page preview
-- 
-- __for_album__ Pass true to create a link for the whole media album
-- 
-- __for_comment__ Pass true to create a link to the message as a channel post comment, or from a message thread
data GetMessageLink = 

 GetMessageLink { for_comment :: Maybe Bool, for_album :: Maybe Bool, media_timestamp :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageLink where
 show GetMessageLink { for_comment=for_comment, for_album=for_album, media_timestamp=media_timestamp, message_id=message_id, chat_id=chat_id } =
  "GetMessageLink" ++ cc [p "for_comment" for_comment, p "for_album" for_album, p "media_timestamp" media_timestamp, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessageLink where
 toJSON GetMessageLink { for_comment = for_comment, for_album = for_album, media_timestamp = media_timestamp, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageLink", "for_comment" A..= for_comment, "for_album" A..= for_album, "media_timestamp" A..= media_timestamp, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageLink" -> parseGetMessageLink v
   _ -> mempty
  where
   parseGetMessageLink :: A.Value -> T.Parser GetMessageLink
   parseGetMessageLink = A.withObject "GetMessageLink" $ \o -> do
    for_comment <- o A..:? "for_comment"
    for_album <- o A..:? "for_album"
    media_timestamp <- mconcat [ o A..:? "media_timestamp", readMaybe <$> (o A..: "media_timestamp" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageLink { for_comment = for_comment, for_album = for_album, media_timestamp = media_timestamp, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
