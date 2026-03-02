module TD.Data.InputCall
  (InputCall(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a call
data InputCall
  = InputCallDiscarded -- ^ A just ended call
    { call_id :: Maybe Int -- ^ Identifier of the call
    }
  | InputCallFromMessage -- ^ A call from a message of the type messageCall with non-zero messageCall.unique_id
    { chat_id    :: Maybe Int -- ^ Chat identifier of the message
    , message_id :: Maybe Int -- ^ Message identifier
    }
  deriving (Eq, Show)

instance I.ShortShow InputCall where
  shortShow InputCallDiscarded
    { call_id = call_id_
    }
      = "InputCallDiscarded"
        ++ I.cc
        [ "call_id" `I.p` call_id_
        ]
  shortShow InputCallFromMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "InputCallFromMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]

instance AT.FromJSON InputCall where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputCallDiscarded"   -> parseInputCallDiscarded v
      "inputCallFromMessage" -> parseInputCallFromMessage v
      _                      -> mempty
    
    where
      parseInputCallDiscarded :: A.Value -> AT.Parser InputCall
      parseInputCallDiscarded = A.withObject "InputCallDiscarded" $ \o -> do
        call_id_ <- o A..:?  "call_id"
        pure $ InputCallDiscarded
          { call_id = call_id_
          }
      parseInputCallFromMessage :: A.Value -> AT.Parser InputCall
      parseInputCallFromMessage = A.withObject "InputCallFromMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ InputCallFromMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputCall where
  toJSON InputCallDiscarded
    { call_id = call_id_
    }
      = A.object
        [ "@type"   A..= AT.String "inputCallDiscarded"
        , "call_id" A..= call_id_
        ]
  toJSON InputCallFromMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "inputCallFromMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]

