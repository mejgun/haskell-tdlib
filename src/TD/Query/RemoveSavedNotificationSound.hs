{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveSavedNotificationSound where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes a notification sound from the list of saved notification sounds @notification_sound_id Identifier of the notification sound
data RemoveSavedNotificationSound = RemoveSavedNotificationSound
  { -- |
    notification_sound_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveSavedNotificationSound where
  show
    RemoveSavedNotificationSound
      { notification_sound_id = notification_sound_id
      } =
      "RemoveSavedNotificationSound"
        ++ U.cc
          [ U.p "notification_sound_id" notification_sound_id
          ]

instance T.ToJSON RemoveSavedNotificationSound where
  toJSON
    RemoveSavedNotificationSound
      { notification_sound_id = notification_sound_id
      } =
      A.object
        [ "@type" A..= T.String "removeSavedNotificationSound",
          "notification_sound_id" A..= notification_sound_id
        ]
