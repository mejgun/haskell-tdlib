-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsMarkedAsUnread where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the marked as unread state of a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __is_marked_as_unread__ New value of is_marked_as_unread
data ToggleChatIsMarkedAsUnread = 
 ToggleChatIsMarkedAsUnread { is_marked_as_unread :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ToggleChatIsMarkedAsUnread where
 toJSON (ToggleChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatIsMarkedAsUnread", "is_marked_as_unread" A..= is_marked_as_unread, "chat_id" A..= chat_id ]

instance T.FromJSON ToggleChatIsMarkedAsUnread where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatIsMarkedAsUnread" -> parseToggleChatIsMarkedAsUnread v
   _ -> mempty
  where
   parseToggleChatIsMarkedAsUnread :: A.Value -> T.Parser ToggleChatIsMarkedAsUnread
   parseToggleChatIsMarkedAsUnread = A.withObject "ToggleChatIsMarkedAsUnread" $ \o -> do
    is_marked_as_unread <- o A..:? "is_marked_as_unread"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }