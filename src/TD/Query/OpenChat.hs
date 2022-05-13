{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.OpenChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats) @chat_id Chat identifier
data OpenChat = OpenChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show OpenChat where
  show
    OpenChat
      { chat_id = chat_id_
      } =
      "OpenChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON OpenChat where
  toJSON
    OpenChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "openChat",
          "chat_id" A..= chat_id_
        ]
