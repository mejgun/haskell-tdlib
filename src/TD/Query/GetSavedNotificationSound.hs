module TD.Query.GetSavedNotificationSound(GetSavedNotificationSound(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetSavedNotificationSound -- ^ Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier
  = GetSavedNotificationSound
    { notification_sound_id :: Maybe Int -- ^ Identifier of the notification sound
    }
  deriving (Eq)

instance Show GetSavedNotificationSound where
  show
    GetSavedNotificationSound
      { notification_sound_id = notification_sound_id_
      }
        = "GetSavedNotificationSound"
          ++ I.cc
          [ "notification_sound_id" `I.p` notification_sound_id_
          ]

instance AT.ToJSON GetSavedNotificationSound where
  toJSON
    GetSavedNotificationSound
      { notification_sound_id = notification_sound_id_
      }
        = A.object
          [ "@type"                 A..= AT.String "getSavedNotificationSound"
          , "notification_sound_id" A..= fmap I.writeInt64  notification_sound_id_
          ]
