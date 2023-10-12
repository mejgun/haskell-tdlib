module TD.Query.GetCallbackQueryMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetCallbackQueryMessage -- ^ Returns information about a message with the callback button that originated a callback query; for bots only
  = GetCallbackQueryMessage
    { chat_id           :: Maybe Int -- ^ Identifier of the chat the message belongs to
    , message_id        :: Maybe Int -- ^ Message identifier
    , callback_query_id :: Maybe Int -- ^ Identifier of the callback query
    }
  deriving (Eq)

instance Show GetCallbackQueryMessage where
  show
    GetCallbackQueryMessage
      { chat_id           = chat_id_
      , message_id        = message_id_
      , callback_query_id = callback_query_id_
      }
        = "GetCallbackQueryMessage"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_id"        `I.p` message_id_
          , "callback_query_id" `I.p` callback_query_id_
          ]

instance AT.ToJSON GetCallbackQueryMessage where
  toJSON
    GetCallbackQueryMessage
      { chat_id           = chat_id_
      , message_id        = message_id_
      , callback_query_id = callback_query_id_
      }
        = A.object
          [ "@type"             A..= AT.String "getCallbackQueryMessage"
          , "chat_id"           A..= chat_id_
          , "message_id"        A..= message_id_
          , "callback_query_id" A..= I.toS callback_query_id_
          ]
