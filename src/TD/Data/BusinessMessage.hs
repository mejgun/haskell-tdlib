module TD.Data.BusinessMessage
  (BusinessMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message

data BusinessMessage
  = BusinessMessage -- ^ Describes a message from a business account as received by a bot
    { message          :: Maybe Message.Message -- ^ The message
    , reply_to_message :: Maybe Message.Message -- ^ Message that is replied by the message in the same chat; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessMessage where
  shortShow BusinessMessage
    { message          = message_
    , reply_to_message = reply_to_message_
    }
      = "BusinessMessage"
        ++ I.cc
        [ "message"          `I.p` message_
        , "reply_to_message" `I.p` reply_to_message_
        ]

instance AT.FromJSON BusinessMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessMessage" -> parseBusinessMessage v
      _                 -> mempty
    
    where
      parseBusinessMessage :: A.Value -> AT.Parser BusinessMessage
      parseBusinessMessage = A.withObject "BusinessMessage" $ \o -> do
        message_          <- o A..:?  "message"
        reply_to_message_ <- o A..:?  "reply_to_message"
        pure $ BusinessMessage
          { message          = message_
          , reply_to_message = reply_to_message_
          }
  parseJSON _ = mempty

