-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsMarkedAsUnread where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ToggleChatIsMarkedAsUnread = 
 ToggleChatIsMarkedAsUnread { is_marked_as_unread :: Bool, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ToggleChatIsMarkedAsUnread where
 toJSON (ToggleChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatIsMarkedAsUnread", "is_marked_as_unread" A..= is_marked_as_unread, "chat_id" A..= chat_id ]
-- toggleChatIsMarkedAsUnread ToggleChatIsMarkedAsUnread  { is_marked_as_unread :: Bool, chat_id :: Int } 



instance T.FromJSON ToggleChatIsMarkedAsUnread where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatIsMarkedAsUnread" -> parseToggleChatIsMarkedAsUnread v
  where
   parseToggleChatIsMarkedAsUnread :: A.Value -> T.Parser ToggleChatIsMarkedAsUnread
   parseToggleChatIsMarkedAsUnread = A.withObject "ToggleChatIsMarkedAsUnread" $ \o -> do
    is_marked_as_unread <- o A..: "is_marked_as_unread"
    chat_id <- o A..: "chat_id"
    return $ ToggleChatIsMarkedAsUnread { is_marked_as_unread = is_marked_as_unread, chat_id = chat_id }