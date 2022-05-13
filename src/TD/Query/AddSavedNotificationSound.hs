{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddSavedNotificationSound where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Adds a new notification sound to the list of saved notification sounds. The new notification sound is added to the top of the list. If it is already in the list, its position isn't changed @sound Notification sound file to add
data AddSavedNotificationSound = AddSavedNotificationSound
  { -- |
    sound :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show AddSavedNotificationSound where
  show
    AddSavedNotificationSound
      { sound = sound_
      } =
      "AddSavedNotificationSound"
        ++ U.cc
          [ U.p "sound" sound_
          ]

instance T.ToJSON AddSavedNotificationSound where
  toJSON
    AddSavedNotificationSound
      { sound = sound_
      } =
      A.object
        [ "@type" A..= T.String "addSavedNotificationSound",
          "sound" A..= sound_
        ]
