{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NotificationSounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.NotificationSound as NotificationSound
import qualified Utils as U

data NotificationSounds = -- | Contains a list of notification sounds @notification_sounds A list of notification sounds
  NotificationSounds
  { -- |
    notification_sounds :: Maybe [NotificationSound.NotificationSound]
  }
  deriving (Eq)

instance Show NotificationSounds where
  show
    NotificationSounds
      { notification_sounds = notification_sounds
      } =
      "NotificationSounds"
        ++ U.cc
          [ U.p "notification_sounds" notification_sounds
          ]

instance T.FromJSON NotificationSounds where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationSounds" -> parseNotificationSounds v
      _ -> fail ""
    where
      parseNotificationSounds :: A.Value -> T.Parser NotificationSounds
      parseNotificationSounds = A.withObject "NotificationSounds" $ \o -> do
        notification_sounds_ <- o A..:? "notification_sounds"
        return $ NotificationSounds {notification_sounds = notification_sounds_}
  parseJSON _ = fail ""

instance T.ToJSON NotificationSounds where
  toJSON
    NotificationSounds
      { notification_sounds = notification_sounds
      } =
      A.object
        [ "@type" A..= T.String "notificationSounds",
          "notification_sounds" A..= notification_sounds
        ]
