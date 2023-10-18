module TD.Query.SetPollAnswer
  (SetPollAnswer(..)
  , defaultSetPollAnswer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the user answer to a poll. A poll in quiz mode can be answered only once. Returns 'TD.Data.Ok.Ok'
data SetPollAnswer
  = SetPollAnswer
    { chat_id    :: Maybe Int   -- ^ Identifier of the chat to which the poll belongs
    , message_id :: Maybe Int   -- ^ Identifier of the message containing the poll
    , option_ids :: Maybe [Int] -- ^ 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only is the poll allows multiple answers
    }
  deriving (Eq, Show)

instance I.ShortShow SetPollAnswer where
  shortShow
    SetPollAnswer
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_ids = option_ids_
      }
        = "SetPollAnswer"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "option_ids" `I.p` option_ids_
          ]

instance AT.ToJSON SetPollAnswer where
  toJSON
    SetPollAnswer
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_ids = option_ids_
      }
        = A.object
          [ "@type"      A..= AT.String "setPollAnswer"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "option_ids" A..= option_ids_
          ]

defaultSetPollAnswer :: SetPollAnswer
defaultSetPollAnswer =
  SetPollAnswer
    { chat_id    = Nothing
    , message_id = Nothing
    , option_ids = Nothing
    }

