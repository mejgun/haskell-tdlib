-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatIsPinned where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatList as ChatList

-- |
-- 
-- Changes the pinned state of a chat. There can be up to GetOption("pinned_chat_count_max")/GetOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/archive chat list
-- 
-- __chat_list__ Chat list in which to change the pinned state of the chat
-- 
-- __chat_id__ Chat identifier
-- 
-- __is_pinned__ Pass true to pin the chat; pass false to unpin it
data ToggleChatIsPinned = 

 ToggleChatIsPinned { is_pinned :: Maybe Bool, chat_id :: Maybe Int, chat_list :: Maybe ChatList.ChatList }  deriving (Eq)

instance Show ToggleChatIsPinned where
 show ToggleChatIsPinned { is_pinned=is_pinned, chat_id=chat_id, chat_list=chat_list } =
  "ToggleChatIsPinned" ++ U.cc [U.p "is_pinned" is_pinned, U.p "chat_id" chat_id, U.p "chat_list" chat_list ]

instance T.ToJSON ToggleChatIsPinned where
 toJSON ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id, chat_list = chat_list } =
  A.object [ "@type" A..= T.String "toggleChatIsPinned", "is_pinned" A..= is_pinned, "chat_id" A..= chat_id, "chat_list" A..= chat_list ]

instance T.FromJSON ToggleChatIsPinned where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatIsPinned" -> parseToggleChatIsPinned v
   _ -> mempty
  where
   parseToggleChatIsPinned :: A.Value -> T.Parser ToggleChatIsPinned
   parseToggleChatIsPinned = A.withObject "ToggleChatIsPinned" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_list <- o A..:? "chat_list"
    return $ ToggleChatIsPinned { is_pinned = is_pinned, chat_id = chat_id, chat_list = chat_list }
 parseJSON _ = mempty
