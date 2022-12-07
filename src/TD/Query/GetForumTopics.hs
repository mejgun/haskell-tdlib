{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetForumTopics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns found forum topics in a forum chat. This is a temporary method for getting information about topic list from the server
data GetForumTopics = GetForumTopics
  { -- | The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | The message thread identifier of the last found topic, or 0 for the first request
    offset_message_thread_id :: Maybe Int,
    -- | The message identifier of the last message in the last found topic, or 0 for the first request
    offset_message_id :: Maybe Int,
    -- | The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic
    offset_date :: Maybe Int,
    -- | Query to search for in the forum topic's name
    query :: Maybe String,
    -- | Identifier of the forum chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetForumTopics where
  show
    GetForumTopics
      { limit = limit_,
        offset_message_thread_id = offset_message_thread_id_,
        offset_message_id = offset_message_id_,
        offset_date = offset_date_,
        query = query_,
        chat_id = chat_id_
      } =
      "GetForumTopics"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_message_thread_id" offset_message_thread_id_,
            U.p "offset_message_id" offset_message_id_,
            U.p "offset_date" offset_date_,
            U.p "query" query_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetForumTopics where
  toJSON
    GetForumTopics
      { limit = limit_,
        offset_message_thread_id = offset_message_thread_id_,
        offset_message_id = offset_message_id_,
        offset_date = offset_date_,
        query = query_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getForumTopics",
          "limit" A..= limit_,
          "offset_message_thread_id" A..= offset_message_thread_id_,
          "offset_message_id" A..= offset_message_id_,
          "offset_date" A..= offset_date_,
          "query" A..= query_,
          "chat_id" A..= chat_id_
        ]
