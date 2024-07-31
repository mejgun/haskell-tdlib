module TD.Query.GetMessageProperties
  (GetMessageProperties(..)
  , defaultGetMessageProperties
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns properties of a message; this is an offline request. Returns 'TD.Data.MessageProperties.MessageProperties'
data GetMessageProperties
  = GetMessageProperties
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageProperties where
  shortShow
    GetMessageProperties
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessageProperties"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessageProperties where
  toJSON
    GetMessageProperties
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageProperties"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessageProperties :: GetMessageProperties
defaultGetMessageProperties =
  GetMessageProperties
    { chat_id    = Nothing
    , message_id = Nothing
    }

