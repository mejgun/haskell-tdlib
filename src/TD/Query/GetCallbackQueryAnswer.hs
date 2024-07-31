module TD.Query.GetCallbackQueryAnswer
  (GetCallbackQueryAnswer(..)
  , defaultGetCallbackQueryAnswer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload

-- | Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires. Returns 'TD.Data.CallbackQueryAnswer.CallbackQueryAnswer'
data GetCallbackQueryAnswer
  = GetCallbackQueryAnswer
    { chat_id    :: Maybe Int                                       -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int                                       -- ^ Identifier of the message from which the query originated. The message must not be scheduled
    , payload    :: Maybe CallbackQueryPayload.CallbackQueryPayload -- ^ Query payload
    }
  deriving (Eq, Show)

instance I.ShortShow GetCallbackQueryAnswer where
  shortShow
    GetCallbackQueryAnswer
      { chat_id    = chat_id_
      , message_id = message_id_
      , payload    = payload_
      }
        = "GetCallbackQueryAnswer"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "payload"    `I.p` payload_
          ]

instance AT.ToJSON GetCallbackQueryAnswer where
  toJSON
    GetCallbackQueryAnswer
      { chat_id    = chat_id_
      , message_id = message_id_
      , payload    = payload_
      }
        = A.object
          [ "@type"      A..= AT.String "getCallbackQueryAnswer"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "payload"    A..= payload_
          ]

defaultGetCallbackQueryAnswer :: GetCallbackQueryAnswer
defaultGetCallbackQueryAnswer =
  GetCallbackQueryAnswer
    { chat_id    = Nothing
    , message_id = Nothing
    , payload    = Nothing
    }

