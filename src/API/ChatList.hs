-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatList where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes a list of chats
data ChatList = 
 -- |
 -- 
 -- A main list of chats
 ChatListMain |
 -- |
 -- 
 -- A list of chats usually located at the top of the main chat list. Unmuted chats are automatically moved from the Archive to the Main chat list when a new message arrives
 ChatListArchive |
 -- |
 -- 
 -- A list of chats belonging to a chat filter 
 -- 
 -- __chat_filter_id__ Chat filter identifier
 ChatListFilter { chat_filter_id :: Maybe Int }  deriving (Eq)

instance Show ChatList where
 show ChatListMain {  } =
  "ChatListMain" ++ U.cc [ ]

 show ChatListArchive {  } =
  "ChatListArchive" ++ U.cc [ ]

 show ChatListFilter { chat_filter_id=chat_filter_id } =
  "ChatListFilter" ++ U.cc [U.p "chat_filter_id" chat_filter_id ]

instance T.ToJSON ChatList where
 toJSON ChatListMain {  } =
  A.object [ "@type" A..= T.String "chatListMain" ]

 toJSON ChatListArchive {  } =
  A.object [ "@type" A..= T.String "chatListArchive" ]

 toJSON ChatListFilter { chat_filter_id = chat_filter_id } =
  A.object [ "@type" A..= T.String "chatListFilter", "chat_filter_id" A..= chat_filter_id ]

instance T.FromJSON ChatList where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatListMain" -> parseChatListMain v
   "chatListArchive" -> parseChatListArchive v
   "chatListFilter" -> parseChatListFilter v
   _ -> mempty
  where
   parseChatListMain :: A.Value -> T.Parser ChatList
   parseChatListMain = A.withObject "ChatListMain" $ \o -> do
    return $ ChatListMain {  }

   parseChatListArchive :: A.Value -> T.Parser ChatList
   parseChatListArchive = A.withObject "ChatListArchive" $ \o -> do
    return $ ChatListArchive {  }

   parseChatListFilter :: A.Value -> T.Parser ChatList
   parseChatListFilter = A.withObject "ChatListFilter" $ \o -> do
    chat_filter_id <- mconcat [ o A..:? "chat_filter_id", readMaybe <$> (o A..: "chat_filter_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatListFilter { chat_filter_id = chat_filter_id }
 parseJSON _ = mempty
