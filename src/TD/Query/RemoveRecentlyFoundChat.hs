{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveRecentlyFoundChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a chat from the list of recently found chats @chat_id Identifier of the chat to be removed
data RemoveRecentlyFoundChat = RemoveRecentlyFoundChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveRecentlyFoundChat where
  show
    RemoveRecentlyFoundChat
      { chat_id = chat_id_
      } =
      "RemoveRecentlyFoundChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON RemoveRecentlyFoundChat where
  toJSON
    RemoveRecentlyFoundChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "removeRecentlyFoundChat",
          "chat_id" A..= chat_id_
        ]
