module TD.Data.MessageFileType
  (MessageFileType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about a file with messages exported from another app
data MessageFileType
  = MessageFileTypePrivate -- ^ The messages were exported from a private chat
    { name :: Maybe T.Text -- ^ Name of the other party; may be empty if unrecognized
    }
  | MessageFileTypeGroup -- ^ The messages were exported from a group chat
    { title :: Maybe T.Text -- ^ Title of the group chat; may be empty if unrecognized
    }
  | MessageFileTypeUnknown -- ^ The messages were exported from a chat of unknown type
  deriving (Eq, Show)

instance I.ShortShow MessageFileType where
  shortShow MessageFileTypePrivate
    { name = name_
    }
      = "MessageFileTypePrivate"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow MessageFileTypeGroup
    { title = title_
    }
      = "MessageFileTypeGroup"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  shortShow MessageFileTypeUnknown
      = "MessageFileTypeUnknown"

instance AT.FromJSON MessageFileType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageFileTypePrivate" -> parseMessageFileTypePrivate v
      "messageFileTypeGroup"   -> parseMessageFileTypeGroup v
      "messageFileTypeUnknown" -> pure MessageFileTypeUnknown
      _                        -> mempty
    
    where
      parseMessageFileTypePrivate :: A.Value -> AT.Parser MessageFileType
      parseMessageFileTypePrivate = A.withObject "MessageFileTypePrivate" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ MessageFileTypePrivate
          { name = name_
          }
      parseMessageFileTypeGroup :: A.Value -> AT.Parser MessageFileType
      parseMessageFileTypeGroup = A.withObject "MessageFileTypeGroup" $ \o -> do
        title_ <- o A..:?  "title"
        pure $ MessageFileTypeGroup
          { title = title_
          }
  parseJSON _ = mempty

