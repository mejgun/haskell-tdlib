module TD.Query.RemoveSavedNotificationSound
  (RemoveSavedNotificationSound(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a notification sound from the list of saved notification sounds. Returns 'TD.Data.Ok.Ok'
data RemoveSavedNotificationSound
  = RemoveSavedNotificationSound
    { notification_sound_id :: Maybe Int -- ^ Identifier of the notification sound
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveSavedNotificationSound where
  shortShow
    RemoveSavedNotificationSound
      { notification_sound_id = notification_sound_id_
      }
        = "RemoveSavedNotificationSound"
          ++ I.cc
          [ "notification_sound_id" `I.p` notification_sound_id_
          ]

instance AT.ToJSON RemoveSavedNotificationSound where
  toJSON
    RemoveSavedNotificationSound
      { notification_sound_id = notification_sound_id_
      }
        = A.object
          [ "@type"                 A..= AT.String "removeSavedNotificationSound"
          , "notification_sound_id" A..= fmap I.writeInt64  notification_sound_id_
          ]

