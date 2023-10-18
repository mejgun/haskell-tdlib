module TD.Query.AddSavedNotificationSound
  (AddSavedNotificationSound(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Adds a new notification sound to the list of saved notification sounds. The new notification sound is added to the top of the list. If it is already in the list, its position isn't changed. Returns 'TD.Data.NotificationSound.NotificationSound'
data AddSavedNotificationSound
  = AddSavedNotificationSound
    { sound :: Maybe InputFile.InputFile -- ^ Notification sound file to add
    }
  deriving (Eq, Show)

instance I.ShortShow AddSavedNotificationSound where
  shortShow
    AddSavedNotificationSound
      { sound = sound_
      }
        = "AddSavedNotificationSound"
          ++ I.cc
          [ "sound" `I.p` sound_
          ]

instance AT.ToJSON AddSavedNotificationSound where
  toJSON
    AddSavedNotificationSound
      { sound = sound_
      }
        = A.object
          [ "@type" A..= AT.String "addSavedNotificationSound"
          , "sound" A..= sound_
          ]

