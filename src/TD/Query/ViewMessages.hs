module TD.Query.ViewMessages
  (ViewMessages(..)
  , defaultViewMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSource as MessageSource

-- | Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button). Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels). Returns 'TD.Data.Ok.Ok'
data ViewMessages
  = ViewMessages
    { chat_id     :: Maybe Int                         -- ^ Chat identifier
    , message_ids :: Maybe [Int]                       -- ^ The identifiers of the messages being viewed
    , source      :: Maybe MessageSource.MessageSource -- ^ Source of the message view; pass null to guess the source based on chat open state
    , force_read  :: Maybe Bool                        -- ^ Pass true to mark as read the specified messages even the chat is closed
    }
  deriving (Eq, Show)

instance I.ShortShow ViewMessages where
  shortShow
    ViewMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      , source      = source_
      , force_read  = force_read_
      }
        = "ViewMessages"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "message_ids" `I.p` message_ids_
          , "source"      `I.p` source_
          , "force_read"  `I.p` force_read_
          ]

instance AT.ToJSON ViewMessages where
  toJSON
    ViewMessages
      { chat_id     = chat_id_
      , message_ids = message_ids_
      , source      = source_
      , force_read  = force_read_
      }
        = A.object
          [ "@type"       A..= AT.String "viewMessages"
          , "chat_id"     A..= chat_id_
          , "message_ids" A..= message_ids_
          , "source"      A..= source_
          , "force_read"  A..= force_read_
          ]

defaultViewMessages :: ViewMessages
defaultViewMessages =
  ViewMessages
    { chat_id     = Nothing
    , message_ids = Nothing
    , source      = Nothing
    , force_read  = Nothing
    }

