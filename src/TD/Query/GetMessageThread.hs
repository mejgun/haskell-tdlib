module TD.Query.GetMessageThread
  (GetMessageThread(..)
  , defaultGetMessageThread
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a message thread. Can be used only if messageProperties.can_get_message_thread == true. Returns 'TD.Data.MessageThreadInfo.MessageThreadInfo'
data GetMessageThread
  = GetMessageThread
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageThread where
  shortShow
    GetMessageThread
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessageThread"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessageThread where
  toJSON
    GetMessageThread
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageThread"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessageThread :: GetMessageThread
defaultGetMessageThread =
  GetMessageThread
    { chat_id    = Nothing
    , message_id = Nothing
    }

