module TD.Query.GetMessageLocally
  (GetMessageLocally(..)
  , defaultGetMessageLocally
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetMessageLocally -- ^ Returns information about a message, if it is available without sending network request. This is an offline request
  = GetMessageLocally
    { chat_id    :: Maybe Int -- ^ Identifier of the chat the message belongs to
    , message_id :: Maybe Int -- ^ Identifier of the message to get
    }
  deriving (Eq)

instance Show GetMessageLocally where
  show
    GetMessageLocally
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessageLocally"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessageLocally where
  toJSON
    GetMessageLocally
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageLocally"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessageLocally :: GetMessageLocally
defaultGetMessageLocally =
  GetMessageLocally
    { chat_id    = Nothing
    , message_id = Nothing
    }

