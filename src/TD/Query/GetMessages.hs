module TD.Query.GetMessages
  (GetMessages(..)
  , defaultGetMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about messages. If a message is not found, returns null on the corresponding position of the result. Returns 'TD.Data.Messages.Messages'
data GetMessages
  = GetMessages
    { chat_id     :: Maybe Int   -- ^ Identifier of the chat the messages belong to
    , message_ids :: Maybe [Int] -- ^ Identifiers of the messages to get
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessages where
  shortShow
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

defaultGetMessages :: GetMessages
defaultGetMessages =
  GetMessages
    { chat_id     = Nothing
    , message_ids = Nothing
    }

