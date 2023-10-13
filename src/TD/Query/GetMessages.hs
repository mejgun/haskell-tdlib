module TD.Query.GetMessages(GetMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetMessages -- ^ Returns information about messages. If a message is not found, returns null on the corresponding position of the result
  = GetMessages
    { chat_id     :: Maybe Int   -- ^ Identifier of the chat the messages belong to
    , message_ids :: Maybe [Int] -- ^ Identifiers of the messages to get
    }
  deriving (Eq)

instance Show GetMessages where
  show
    GetMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      }
        = "GetMessages"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "message_ids" `I.p` message_ids_
          ]

instance AT.ToJSON GetMessages where
  toJSON
    GetMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      }
        = A.object
          [ "@type"       A..= AT.String "getMessages"
          , "chat_id"     A..= chat_id_
          , "message_ids" A..= message_ids_
          ]
