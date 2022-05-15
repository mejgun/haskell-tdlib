{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSavedNotificationSound where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier @notification_sound_id Identifier of the notification sound
data GetSavedNotificationSound = GetSavedNotificationSound
  { -- |
    notification_sound_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetSavedNotificationSound where
  show
    GetSavedNotificationSound
      { notification_sound_id = notification_sound_id_
      } =
      "GetSavedNotificationSound"
        ++ U.cc
          [ U.p "notification_sound_id" notification_sound_id_
          ]

instance T.ToJSON GetSavedNotificationSound where
  toJSON
    GetSavedNotificationSound
      { notification_sound_id = notification_sound_id_
      } =
      A.object
        [ "@type" A..= T.String "getSavedNotificationSound",
          "notification_sound_id" A..= U.toS notification_sound_id_
        ]
