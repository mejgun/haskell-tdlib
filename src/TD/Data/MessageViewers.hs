module TD.Data.MessageViewers
  (MessageViewers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageViewer as MessageViewer

data MessageViewers
  = MessageViewers -- ^ Represents a list of message viewers
    { viewers :: Maybe [MessageViewer.MessageViewer] -- ^ List of message viewers
    }
  deriving (Eq, Show)

instance I.ShortShow MessageViewers where
  shortShow MessageViewers
    { viewers = viewers_
    }
      = "MessageViewers"
        ++ I.cc
        [ "viewers" `I.p` viewers_
        ]

instance AT.FromJSON MessageViewers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageViewers" -> parseMessageViewers v
      _                -> mempty
    
    where
      parseMessageViewers :: A.Value -> AT.Parser MessageViewers
      parseMessageViewers = A.withObject "MessageViewers" $ \o -> do
        viewers_ <- o A..:?  "viewers"
        pure $ MessageViewers
          { viewers = viewers_
          }
  parseJSON _ = mempty

