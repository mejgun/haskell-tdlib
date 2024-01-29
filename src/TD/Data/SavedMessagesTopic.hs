module TD.Data.SavedMessagesTopic
  (SavedMessagesTopic(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains information about a Saved Messages topic
data SavedMessagesTopic
  = SavedMessagesTopicMyNotes -- ^ Topic containing messages sent by the current user of forwarded from an unknown chat
  | SavedMessagesTopicAuthorHidden -- ^ Topic containing messages forwarded from a user with hidden privacy
  | SavedMessagesTopicSavedFromChat -- ^ Topic containing messages forwarded from a specific chat
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow SavedMessagesTopic where
  shortShow SavedMessagesTopicMyNotes
      = "SavedMessagesTopicMyNotes"
  shortShow SavedMessagesTopicAuthorHidden
      = "SavedMessagesTopicAuthorHidden"
  shortShow SavedMessagesTopicSavedFromChat
    { chat_id = chat_id_
    }
      = "SavedMessagesTopicSavedFromChat"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]

instance AT.FromJSON SavedMessagesTopic where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "savedMessagesTopicMyNotes"       -> pure SavedMessagesTopicMyNotes
      "savedMessagesTopicAuthorHidden"  -> pure SavedMessagesTopicAuthorHidden
      "savedMessagesTopicSavedFromChat" -> parseSavedMessagesTopicSavedFromChat v
      _                                 -> mempty
    
    where
      parseSavedMessagesTopicSavedFromChat :: A.Value -> AT.Parser SavedMessagesTopic
      parseSavedMessagesTopicSavedFromChat = A.withObject "SavedMessagesTopicSavedFromChat" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ SavedMessagesTopicSavedFromChat
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON SavedMessagesTopic where
  toJSON SavedMessagesTopicMyNotes
      = A.object
        [ "@type" A..= AT.String "savedMessagesTopicMyNotes"
        ]
  toJSON SavedMessagesTopicAuthorHidden
      = A.object
        [ "@type" A..= AT.String "savedMessagesTopicAuthorHidden"
        ]
  toJSON SavedMessagesTopicSavedFromChat
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "savedMessagesTopicSavedFromChat"
        , "chat_id" A..= chat_id_
        ]

