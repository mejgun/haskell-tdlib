module TD.Query.GetPollOptionProperties
  (GetPollOptionProperties(..)
  , defaultGetPollOptionProperties
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns properties of a poll option. This is an offline method. Returns 'TD.Data.PollOptionProperties.PollOptionProperties'
data GetPollOptionProperties
  = GetPollOptionProperties
    { chat_id        :: Maybe Int    -- ^ Chat identifier
    , message_id     :: Maybe Int    -- ^ Identifier of the message
    , poll_option_id :: Maybe T.Text -- ^ Unique identifier of the answer option, which properties will be returned
    }
  deriving (Eq, Show)

instance I.ShortShow GetPollOptionProperties where
  shortShow
    GetPollOptionProperties
      { chat_id        = chat_id_
      , message_id     = message_id_
      , poll_option_id = poll_option_id_
      }
        = "GetPollOptionProperties"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "message_id"     `I.p` message_id_
          , "poll_option_id" `I.p` poll_option_id_
          ]

instance AT.ToJSON GetPollOptionProperties where
  toJSON
    GetPollOptionProperties
      { chat_id        = chat_id_
      , message_id     = message_id_
      , poll_option_id = poll_option_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getPollOptionProperties"
          , "chat_id"        A..= chat_id_
          , "message_id"     A..= message_id_
          , "poll_option_id" A..= poll_option_id_
          ]

defaultGetPollOptionProperties :: GetPollOptionProperties
defaultGetPollOptionProperties =
  GetPollOptionProperties
    { chat_id        = Nothing
    , message_id     = Nothing
    , poll_option_id = Nothing
    }

