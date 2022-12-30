{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatHistory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id).
-- For optimal performance, the number of returned messages is chosen by TDLib. This is an offline request if only_local is true
data GetChatHistory = GetChatHistory
  { -- | Pass true to get only messages that are available without sending network requests
    only_local :: Maybe Bool,
    -- | The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset.
    -- For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
    offset :: Maybe Int,
    -- | Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    from_message_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatHistory where
  show
    GetChatHistory
      { only_local = only_local_,
        limit = limit_,
        offset = offset_,
        from_message_id = from_message_id_,
        chat_id = chat_id_
      } =
      "GetChatHistory"
        ++ U.cc
          [ U.p "only_local" only_local_,
            U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "from_message_id" from_message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatHistory where
  toJSON
    GetChatHistory
      { only_local = only_local_,
        limit = limit_,
        offset = offset_,
        from_message_id = from_message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatHistory",
          "only_local" A..= only_local_,
          "limit" A..= limit_,
          "offset" A..= offset_,
          "from_message_id" A..= from_message_id_,
          "chat_id" A..= chat_id_
        ]
