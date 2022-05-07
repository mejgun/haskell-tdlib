{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessagePublicForwards where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns forwarded copies of a channel message to different public channels. For optimal performance, the number of returned messages is chosen by TDLib
data GetMessagePublicForwards = GetMessagePublicForwards
  { -- | The maximum number of messages to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Message identifier
    message_id :: Maybe Int,
    -- | Chat identifier of the message
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessagePublicForwards where
  show
    GetMessagePublicForwards
      { limit = limit,
        offset = offset,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessagePublicForwards"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessagePublicForwards where
  toJSON
    GetMessagePublicForwards
      { limit = limit,
        offset = offset,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessagePublicForwards",
          "limit" A..= limit,
          "offset" A..= offset,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
