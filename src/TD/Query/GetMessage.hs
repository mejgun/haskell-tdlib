module TD.Query.GetMessage
  (GetMessage(..)
  , defaultGetMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a message. Returns a 404 error if the message doesn't exist. Returns 'TD.Data.Message.Message'
data GetMessage
  = GetMessage
    { chat_id    :: Maybe Int -- ^ Identifier of the chat the message belongs to
    , message_id :: Maybe Int -- ^ Identifier of the message to get
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessage where
  shortShow
    GetMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessage where
  toJSON
    GetMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessage :: GetMessage
defaultGetMessage =
  GetMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

