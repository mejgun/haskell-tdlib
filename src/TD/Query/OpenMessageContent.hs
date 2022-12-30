{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.OpenMessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message).
-- An updateMessageContentOpened update will be generated if something has changed
data OpenMessageContent = OpenMessageContent
  { -- | Identifier of the message with the opened content
    message_id :: Maybe Int,
    -- | Chat identifier of the message
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show OpenMessageContent where
  show
    OpenMessageContent
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "OpenMessageContent"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON OpenMessageContent where
  toJSON
    OpenMessageContent
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "openMessageContent",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
