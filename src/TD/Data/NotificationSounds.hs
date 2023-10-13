module TD.Data.NotificationSounds
  ( NotificationSounds(..)    
  , defaultNotificationSounds 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NotificationSound as NotificationSound

data NotificationSounds
  = NotificationSounds -- ^ Contains a list of notification sounds
    { notification_sounds :: Maybe [NotificationSound.NotificationSound] -- ^ A list of notification sounds
    }
  deriving (Eq)

instance Show NotificationSounds where
  show NotificationSounds
    { notification_sounds = notification_sounds_
    }
      = "NotificationSounds"
        ++ I.cc
        [ "notification_sounds" `I.p` notification_sounds_
        ]

instance AT.FromJSON NotificationSounds where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationSounds" -> parseNotificationSounds v
      _                    -> mempty
    
    where
      parseNotificationSounds :: A.Value -> AT.Parser NotificationSounds
      parseNotificationSounds = A.withObject "NotificationSounds" $ \o -> do
        notification_sounds_ <- o A..:?  "notification_sounds"
        pure $ NotificationSounds
          { notification_sounds = notification_sounds_
          }
  parseJSON _ = mempty

instance AT.ToJSON NotificationSounds where
  toJSON NotificationSounds
    { notification_sounds = notification_sounds_
    }
      = A.object
        [ "@type"               A..= AT.String "notificationSounds"
        , "notification_sounds" A..= notification_sounds_
        ]

defaultNotificationSounds :: NotificationSounds
defaultNotificationSounds =
  NotificationSounds
    { notification_sounds = Nothing
    }

