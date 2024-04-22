module TD.Data.SavedMessagesTopicType
  (SavedMessagesTopicType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of Saved Messages topic
data SavedMessagesTopicType
  = SavedMessagesTopicTypeMyNotes -- ^ Topic containing messages sent by the current user of forwarded from an unknown chat
  | SavedMessagesTopicTypeAuthorHidden -- ^ Topic containing messages forwarded from a user with hidden privacy
  | SavedMessagesTopicTypeSavedFromChat -- ^ Topic containing messages forwarded from a specific chat
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow SavedMessagesTopicType where
  shortShow SavedMessagesTopicTypeMyNotes
      = "SavedMessagesTopicTypeMyNotes"
  shortShow SavedMessagesTopicTypeAuthorHidden
      = "SavedMessagesTopicTypeAuthorHidden"
  shortShow SavedMessagesTopicTypeSavedFromChat
    { chat_id = chat_id_
    }
      = "SavedMessagesTopicTypeSavedFromChat"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]

instance AT.FromJSON SavedMessagesTopicType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "savedMessagesTopicTypeMyNotes"       -> pure SavedMessagesTopicTypeMyNotes
      "savedMessagesTopicTypeAuthorHidden"  -> pure SavedMessagesTopicTypeAuthorHidden
      "savedMessagesTopicTypeSavedFromChat" -> parseSavedMessagesTopicTypeSavedFromChat v
      _                                     -> mempty
    
    where
      parseSavedMessagesTopicTypeSavedFromChat :: A.Value -> AT.Parser SavedMessagesTopicType
      parseSavedMessagesTopicTypeSavedFromChat = A.withObject "SavedMessagesTopicTypeSavedFromChat" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ SavedMessagesTopicTypeSavedFromChat
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

