{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReadAllMessageThreadReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Marks all reactions in a forum topic as read @chat_id Chat identifier @message_thread_id Message thread identifier in which reactions are marked as read
data ReadAllMessageThreadReactions = ReadAllMessageThreadReactions
  { -- |
    message_thread_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReadAllMessageThreadReactions where
  show
    ReadAllMessageThreadReactions
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "ReadAllMessageThreadReactions"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ReadAllMessageThreadReactions where
  toJSON
    ReadAllMessageThreadReactions
      { message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "readAllMessageThreadReactions",
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
