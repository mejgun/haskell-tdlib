{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RateSpeechRecognition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Rates recognized speech in a video note or a voice note message @chat_id Identifier of the chat to which the message belongs @message_id Identifier of the message @is_good Pass true if the speech recognition is good
data RateSpeechRecognition = RateSpeechRecognition
  { -- |
    is_good :: Maybe Bool,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show RateSpeechRecognition where
  show
    RateSpeechRecognition
      { is_good = is_good_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "RateSpeechRecognition"
        ++ U.cc
          [ U.p "is_good" is_good_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON RateSpeechRecognition where
  toJSON
    RateSpeechRecognition
      { is_good = is_good_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "rateSpeechRecognition",
          "is_good" A..= is_good_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
