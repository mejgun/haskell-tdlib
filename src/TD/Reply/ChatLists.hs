{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatLists where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatList as ChatList
import qualified Utils as U

data ChatLists = -- | Contains a list of chat lists @chat_lists List of chat lists
  ChatLists
  { -- |
    chat_lists :: Maybe [ChatList.ChatList]
  }
  deriving (Eq)

instance Show ChatLists where
  show
    ChatLists
      { chat_lists = chat_lists
      } =
      "ChatLists"
        ++ U.cc
          [ U.p "chat_lists" chat_lists
          ]

instance T.FromJSON ChatLists where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatLists" -> parseChatLists v
      _ -> fail ""
    where
      parseChatLists :: A.Value -> T.Parser ChatLists
      parseChatLists = A.withObject "ChatLists" $ \o -> do
        chat_lists_ <- o A..:? "chat_lists"
        return $ ChatLists {chat_lists = chat_lists_}
  parseJSON _ = fail ""

instance T.ToJSON ChatLists where
  toJSON
    ChatLists
      { chat_lists = chat_lists
      } =
      A.object
        [ "@type" A..= T.String "chatLists",
          "chat_lists" A..= chat_lists
        ]
