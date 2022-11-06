{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReadAllMessageThreadMentions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Marks all mentions in a forum topic as read @chat_id Chat identifier @message_thread_id Message thread identifier in which mentions are marked as read
data ReadAllMessageThreadMentions = ReadAllMessageThreadMentions
  { -- |
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReadAllMessageThreadMentions where
  show
    ReadAllMessageThreadMentions
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "ReadAllMessageThreadMentions"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ReadAllMessageThreadMentions where
  toJSON
    ReadAllMessageThreadMentions
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "readAllMessageThreadMentions",
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
