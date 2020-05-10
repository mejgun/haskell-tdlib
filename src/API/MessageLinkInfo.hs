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
-- __for_album__ True, if the whole media album to which the message belongs is linked
data MessageLinkInfo = 

 MessageLinkInfo { for_album :: Maybe Bool, message :: Maybe Message.Message, chat_id :: Maybe Int, is_public :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON MessageLinkInfo where
 toJSON (MessageLinkInfo { for_album = for_album, message = message, chat_id = chat_id, is_public = is_public }) =
  A.object [ "@type" A..= T.String "messageLinkInfo", "for_album" A..= for_album, "message" A..= message, "chat_id" A..= chat_id, "is_public" A..= is_public ]

instance T.FromJSON MessageLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageLinkInfo" -> parseMessageLinkInfo v
   _ -> mempty
  where
   parseMessageLinkInfo :: A.Value -> T.Parser MessageLinkInfo
   parseMessageLinkInfo = A.withObject "MessageLinkInfo" $ \o -> do
    for_album <- o A..:? "for_album"
    message <- o A..:? "message"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_public <- o A..:? "is_public"
    return $ MessageLinkInfo { for_album = for_album, message = message, chat_id = chat_id, is_public = is_public }