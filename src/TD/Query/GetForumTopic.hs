{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a forum topic @chat_id Identifier of the chat @message_thread_id Message thread identifier of the forum topic
data GetForumTopic = GetForumTopic
  { -- |
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetForumTopic where
  show
    GetForumTopic
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "GetForumTopic"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetForumTopic where
  toJSON
    GetForumTopic
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getForumTopic",
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
