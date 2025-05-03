module TD.Data.InputGroupCall
  (InputGroupCall(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a non-joined group call that isn't bound to a chat
data InputGroupCall
  = InputGroupCallLink -- ^ The group call is accessible through a link
    { link :: Maybe T.Text -- ^ The link for the group call
    }
  | InputGroupCallMessage -- ^ The group call is accessible through a message of the type messageGroupCall
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int -- ^ Identifier of the message of the type messageGroupCall
    }
  deriving (Eq, Show)

instance I.ShortShow InputGroupCall where
  shortShow InputGroupCallLink
    { link = link_
    }
      = "InputGroupCallLink"
        ++ I.cc
        [ "link" `I.p` link_
        ]
  shortShow InputGroupCallMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "InputGroupCallMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]

instance AT.FromJSON InputGroupCall where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputGroupCallLink"    -> parseInputGroupCallLink v
      "inputGroupCallMessage" -> parseInputGroupCallMessage v
      _                       -> mempty
    
    where
      parseInputGroupCallLink :: A.Value -> AT.Parser InputGroupCall
      parseInputGroupCallLink = A.withObject "InputGroupCallLink" $ \o -> do
        link_ <- o A..:?  "link"
        pure $ InputGroupCallLink
          { link = link_
          }
      parseInputGroupCallMessage :: A.Value -> AT.Parser InputGroupCall
      parseInputGroupCallMessage = A.withObject "InputGroupCallMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ InputGroupCallMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputGroupCall where
  toJSON InputGroupCallLink
    { link = link_
    }
      = A.object
        [ "@type" A..= AT.String "inputGroupCallLink"
        , "link"  A..= link_
        ]
  toJSON InputGroupCallMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "inputGroupCallMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]

