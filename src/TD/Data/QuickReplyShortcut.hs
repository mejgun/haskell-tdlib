module TD.Data.QuickReplyShortcut
  (QuickReplyShortcut(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.QuickReplyMessage as QuickReplyMessage

data QuickReplyShortcut
  = QuickReplyShortcut -- ^ Describes a shortcut that can be used for a quick reply
    { _id           :: Maybe Int                                 -- ^ Unique shortcut identifier
    , name          :: Maybe T.Text                              -- ^ The name of the shortcut that can be used to use the shortcut
    , first_message :: Maybe QuickReplyMessage.QuickReplyMessage -- ^ The first shortcut message
    , message_count :: Maybe Int                                 -- ^ The total number of messages in the shortcut
    }
  deriving (Eq, Show)

instance I.ShortShow QuickReplyShortcut where
  shortShow QuickReplyShortcut
    { _id           = _id_
    , name          = name_
    , first_message = first_message_
    , message_count = message_count_
    }
      = "QuickReplyShortcut"
        ++ I.cc
        [ "_id"           `I.p` _id_
        , "name"          `I.p` name_
        , "first_message" `I.p` first_message_
        , "message_count" `I.p` message_count_
        ]

instance AT.FromJSON QuickReplyShortcut where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "quickReplyShortcut" -> parseQuickReplyShortcut v
      _                    -> mempty
    
    where
      parseQuickReplyShortcut :: A.Value -> AT.Parser QuickReplyShortcut
      parseQuickReplyShortcut = A.withObject "QuickReplyShortcut" $ \o -> do
        _id_           <- o A..:?  "id"
        name_          <- o A..:?  "name"
        first_message_ <- o A..:?  "first_message"
        message_count_ <- o A..:?  "message_count"
        pure $ QuickReplyShortcut
          { _id           = _id_
          , name          = name_
          , first_message = first_message_
          , message_count = message_count_
          }
  parseJSON _ = mempty

