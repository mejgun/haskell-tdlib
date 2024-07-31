module TD.Query.GetMessageViewers
  (GetMessageViewers(..)
  , defaultGetMessageViewers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users, opened content of the message, are returned. The method can be called if messageProperties.can_get_viewers == true. Returns 'TD.Data.MessageViewers.MessageViewers'
data GetMessageViewers
  = GetMessageViewers
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageViewers where
  shortShow
    GetMessageViewers
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessageViewers"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessageViewers where
  toJSON
    GetMessageViewers
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageViewers"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessageViewers :: GetMessageViewers
defaultGetMessageViewers =
  GetMessageViewers
    { chat_id    = Nothing
    , message_id = Nothing
    }

