{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetForumTopicLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTPS link to a topic in a forum chat. This is an offline request @chat_id Identifier of the chat @message_thread_id Message thread identifier of the forum topic
data GetForumTopicLink = GetForumTopicLink
  { -- |
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetForumTopicLink where
  show
    GetForumTopicLink
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "GetForumTopicLink"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetForumTopicLink where
  toJSON
    GetForumTopicLink
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getForumTopicLink",
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
