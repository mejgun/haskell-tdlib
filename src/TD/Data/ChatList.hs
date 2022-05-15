{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a list of chats
data ChatList
  = -- | A main list of chats
    ChatListMain
  | -- | A list of chats usually located at the top of the main chat list. Unmuted chats are automatically moved from the Archive to the Main chat list when a new message arrives
    ChatListArchive
  | -- | A list of chats belonging to a chat filter @chat_filter_id Chat filter identifier
    ChatListFilter
      { -- |
        chat_filter_id :: Maybe Int
      }
  deriving (Eq)

instance Show ChatList where
  show ChatListMain =
    "ChatListMain"
      ++ U.cc
        []
  show ChatListArchive =
    "ChatListArchive"
      ++ U.cc
        []
  show
    ChatListFilter
      { chat_filter_id = chat_filter_id_
      } =
      "ChatListFilter"
        ++ U.cc
          [ U.p "chat_filter_id" chat_filter_id_
          ]

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
      parseChatListMain = A.withObject "ChatListMain" $ \_ -> return ChatListMain

      parseChatListArchive :: A.Value -> T.Parser ChatList
      parseChatListArchive = A.withObject "ChatListArchive" $ \_ -> return ChatListArchive

      parseChatListFilter :: A.Value -> T.Parser ChatList
      parseChatListFilter = A.withObject "ChatListFilter" $ \o -> do
        chat_filter_id_ <- o A..:? "chat_filter_id"
        return $ ChatListFilter {chat_filter_id = chat_filter_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatList where
  toJSON ChatListMain =
    A.object
      [ "@type" A..= T.String "chatListMain"
      ]
  toJSON ChatListArchive =
    A.object
      [ "@type" A..= T.String "chatListArchive"
      ]
  toJSON
    ChatListFilter
      { chat_filter_id = chat_filter_id_
      } =
      A.object
        [ "@type" A..= T.String "chatListFilter",
          "chat_filter_id" A..= chat_filter_id_
        ]
