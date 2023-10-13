module TD.Query.GetCallbackQueryAnswer(GetCallbackQueryAnswer(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CallbackQueryPayload as CallbackQueryPayload

data GetCallbackQueryAnswer -- ^ Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
  = GetCallbackQueryAnswer
    { chat_id    :: Maybe Int                                       -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int                                       -- ^ Identifier of the message from which the query originated
    , payload    :: Maybe CallbackQueryPayload.CallbackQueryPayload -- ^ Query payload
    }
  deriving (Eq)

instance Show GetCallbackQueryAnswer where
  show
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
