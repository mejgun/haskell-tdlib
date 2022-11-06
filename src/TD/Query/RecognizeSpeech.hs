{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RecognizeSpeech where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Recognizes speech in a video note or a voice note message. The message must be successfully sent and must not be scheduled. May return an error with a message "MSG_VOICE_TOO_LONG" if media duration is too big to be recognized
data RecognizeSpeech = RecognizeSpeech
  { -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show RecognizeSpeech where
  show
    RecognizeSpeech
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "RecognizeSpeech"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON RecognizeSpeech where
  toJSON
    RecognizeSpeech
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "recognizeSpeech",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
