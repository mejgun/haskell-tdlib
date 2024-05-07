module TD.Data.ReactionNotificationSource
  (ReactionNotificationSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes sources of reactions for which notifications will be shown
data ReactionNotificationSource
  = ReactionNotificationSourceNone -- ^ Notifications for reactions are disabled
  | ReactionNotificationSourceContacts -- ^ Notifications for reactions are shown only for reactions from contacts
  | ReactionNotificationSourceAll -- ^ Notifications for reactions are shown for all reactions
  deriving (Eq, Show)

instance I.ShortShow ReactionNotificationSource where
  shortShow ReactionNotificationSourceNone
      = "ReactionNotificationSourceNone"
  shortShow ReactionNotificationSourceContacts
      = "ReactionNotificationSourceContacts"
  shortShow ReactionNotificationSourceAll
      = "ReactionNotificationSourceAll"

instance AT.FromJSON ReactionNotificationSource where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "reactionNotificationSourceNone"     -> pure ReactionNotificationSourceNone
      "reactionNotificationSourceContacts" -> pure ReactionNotificationSourceContacts
      "reactionNotificationSourceAll"      -> pure ReactionNotificationSourceAll
      _                                    -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON ReactionNotificationSource where
  toJSON ReactionNotificationSourceNone
      = A.object
        [ "@type" A..= AT.String "reactionNotificationSourceNone"
        ]
  toJSON ReactionNotificationSourceContacts
      = A.object
        [ "@type" A..= AT.String "reactionNotificationSourceContacts"
        ]
  toJSON ReactionNotificationSourceAll
      = A.object
        [ "@type" A..= AT.String "reactionNotificationSourceAll"
        ]

