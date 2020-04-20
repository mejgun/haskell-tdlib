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

