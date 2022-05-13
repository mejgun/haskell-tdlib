{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResetAllNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resets all notification settings to their default values. By default, all chats are unmuted and message previews are shown
data ResetAllNotificationSettings = ResetAllNotificationSettings
  {
  }
  deriving (Eq)

instance Show ResetAllNotificationSettings where
  show ResetAllNotificationSettings =
    "ResetAllNotificationSettings"
      ++ U.cc
        []

instance T.ToJSON ResetAllNotificationSettings where
  toJSON ResetAllNotificationSettings =
    A.object
      [ "@type" A..= T.String "resetAllNotificationSettings"
      ]
