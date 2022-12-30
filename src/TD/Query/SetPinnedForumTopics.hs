{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetPinnedForumTopics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the order of pinned forum topics @chat_id Chat identifier @message_thread_ids The new list of pinned forum topics
data SetPinnedForumTopics = SetPinnedForumTopics
  { -- |
    message_thread_ids :: Maybe [Int],
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetPinnedForumTopics where
  show
    SetPinnedForumTopics
      { message_thread_ids = message_thread_ids_,
        chat_id = chat_id_
      } =
      "SetPinnedForumTopics"
        ++ U.cc
          [ U.p "message_thread_ids" message_thread_ids_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetPinnedForumTopics where
  toJSON
    SetPinnedForumTopics
      { message_thread_ids = message_thread_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setPinnedForumTopics",
          "message_thread_ids" A..= message_thread_ids_,
          "chat_id" A..= chat_id_
        ]
