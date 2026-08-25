module TD.Query.DeleteMessageEphemeralContent
  (DeleteMessageEphemeralContent(..)
  , defaultDeleteMessageEphemeralContent
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes message ephemeral content and reverts message state to the original. Returns 'TD.Data.Ok.Ok'
data DeleteMessageEphemeralContent
  = DeleteMessageEphemeralContent
    { chat_id    :: Maybe Int -- ^ The chat the message belongs to
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteMessageEphemeralContent where
  shortShow
    DeleteMessageEphemeralContent
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "DeleteMessageEphemeralContent"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON DeleteMessageEphemeralContent where
  toJSON
    DeleteMessageEphemeralContent
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "deleteMessageEphemeralContent"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultDeleteMessageEphemeralContent :: DeleteMessageEphemeralContent
defaultDeleteMessageEphemeralContent =
  DeleteMessageEphemeralContent
    { chat_id    = Nothing
    , message_id = Nothing
    }

