module TD.Query.RateSpeechRecognition
  (RateSpeechRecognition(..)
  , defaultRateSpeechRecognition
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Rates recognized speech in a video note or a voice note message. Returns 'TD.Data.Ok.Ok'
data RateSpeechRecognition
  = RateSpeechRecognition
    { chat_id    :: Maybe Int  -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int  -- ^ Identifier of the message
    , is_good    :: Maybe Bool -- ^ Pass true if the speech recognition is good
    }
  deriving (Eq, Show)

instance I.ShortShow RateSpeechRecognition where
  shortShow
    RateSpeechRecognition
      { chat_id    = chat_id_
      , message_id = message_id_
      , is_good    = is_good_
      }
        = "RateSpeechRecognition"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "is_good"    `I.p` is_good_
          ]

instance AT.ToJSON RateSpeechRecognition where
  toJSON
    RateSpeechRecognition
      { chat_id    = chat_id_
      , message_id = message_id_
      , is_good    = is_good_
      }
        = A.object
          [ "@type"      A..= AT.String "rateSpeechRecognition"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "is_good"    A..= is_good_
          ]

defaultRateSpeechRecognition :: RateSpeechRecognition
defaultRateSpeechRecognition =
  RateSpeechRecognition
    { chat_id    = Nothing
    , message_id = Nothing
    , is_good    = Nothing
    }

