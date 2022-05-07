{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessageThreadHistory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns messages in a message thread of a message. Can be used only if message.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup.
-- The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
data GetMessageThreadHistory = GetMessageThreadHistory
  { -- | The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
    offset :: Maybe Int,
    -- | Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    from_message_id :: Maybe Int,
    -- | Message identifier, which thread history needs to be returned
    message_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageThreadHistory where
  show
    GetMessageThreadHistory
      { limit = limit,
        offset = offset,
        from_message_id = from_message_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessageThreadHistory"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "from_message_id" from_message_id,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessageThreadHistory where
  toJSON
    GetMessageThreadHistory
      { limit = limit,
        offset = offset,
        from_message_id = from_message_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessageThreadHistory",
          "limit" A..= limit,
          "offset" A..= offset,
          "from_message_id" A..= from_message_id,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
