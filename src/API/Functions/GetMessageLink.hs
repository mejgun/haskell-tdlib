-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a private HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels. The link will work only for members of the chat
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
data GetMessageLink = 
 GetMessageLink { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetMessageLink where
 toJSON (GetMessageLink { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageLink", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageLink" -> parseGetMessageLink v
   _ -> mempty
  where
   parseGetMessageLink :: A.Value -> T.Parser GetMessageLink
   parseGetMessageLink = A.withObject "GetMessageLink" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageLink { message_id = message_id, chat_id = chat_id }