-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsMarkedAsUnread where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ToggleChatIsMarkedAsUnread = 
 ToggleChatIsMarkedAsUnread { is_marked_as_unread :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show)

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
    is_marked_as_unread <- optional $ o A..: "is_marked_as_unread"
    chat_id <- optional $ o A..: "chat_id"
    return $ ToggleChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }