module TD.Query.GetMessageReadDate
  (GetMessageReadDate(..)
  , defaultGetMessageReadDate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns read date of a recent outgoing message in a private chat. The method can be called if messageProperties.can_get_read_date == true. Returns 'TD.Data.MessageReadDate.MessageReadDate'
data GetMessageReadDate
  = GetMessageReadDate
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageReadDate where
  shortShow
    GetMessageReadDate
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessageReadDate"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessageReadDate where
  toJSON
    GetMessageReadDate
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageReadDate"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessageReadDate :: GetMessageReadDate
defaultGetMessageReadDate =
  GetMessageReadDate
    { chat_id    = Nothing
    , message_id = Nothing
    }

