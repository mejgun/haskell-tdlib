module TD.Query.GetCallbackQueryMessage
  (GetCallbackQueryMessage(..)
  , defaultGetCallbackQueryMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a message with the callback button that originated a callback query; for bots only. Returns 'TD.Data.Message.Message'
data GetCallbackQueryMessage
  = GetCallbackQueryMessage
    { chat_id           :: Maybe Int -- ^ Identifier of the chat the message belongs to
    , message_id        :: Maybe Int -- ^ Message identifier
    , callback_query_id :: Maybe Int -- ^ Identifier of the callback query
    }
  deriving (Eq, Show)

instance I.ShortShow GetCallbackQueryMessage where
  shortShow
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
          , "callback_query_id" A..= fmap I.writeInt64  callback_query_id_
          ]

defaultGetCallbackQueryMessage :: GetCallbackQueryMessage
defaultGetCallbackQueryMessage =
  GetCallbackQueryMessage
    { chat_id           = Nothing
    , message_id        = Nothing
    , callback_query_id = Nothing
    }

