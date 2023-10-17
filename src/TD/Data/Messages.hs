module TD.Data.Messages
  (Messages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message

data Messages
  = Messages -- ^ Contains a list of messages
    { total_count :: Maybe Int               -- ^ Approximate total number of messages found
    , messages    :: Maybe [Message.Message] -- ^ List of messages; messages may be null
    }
  deriving (Eq, Show)

instance I.ShortShow Messages where
  shortShow Messages
    { total_count = total_count_
    , messages    = messages_
    }
      = "Messages"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "messages"    `I.p` messages_
        ]

instance AT.FromJSON Messages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messages" -> parseMessages v
      _          -> mempty
    
    where
      parseMessages :: A.Value -> AT.Parser Messages
      parseMessages = A.withObject "Messages" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        messages_    <- o A..:?  "messages"
        pure $ Messages
          { total_count = total_count_
          , messages    = messages_
          }
  parseJSON _ = mempty

