{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessagePublicForwards where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns forwarded copies of a channel message to different public channels. Can be used only if message.can_get_statistics == true. For optimal performance, the number of returned messages is chosen by TDLib
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
      { limit = limit_,
        offset = offset_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessagePublicForwards"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessagePublicForwards where
  toJSON
    GetMessagePublicForwards
      { limit = limit_,
        offset = offset_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessagePublicForwards",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
