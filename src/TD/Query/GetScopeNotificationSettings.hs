{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope
import qualified Utils as U

-- |
-- Returns the notification settings for chats of a given type @scope Types of chats for which to return the notification settings information
data GetScopeNotificationSettings = GetScopeNotificationSettings
  { -- |
    scope :: Maybe NotificationSettingsScope.NotificationSettingsScope
  }
  deriving (Eq)

instance Show GetScopeNotificationSettings where
  show
    GetScopeNotificationSettings
      { scope = scope
      } =
      "GetScopeNotificationSettings"
        ++ U.cc
          [ U.p "scope" scope
          ]

instance T.ToJSON GetScopeNotificationSettings where
  toJSON
    GetScopeNotificationSettings
      { scope = scope
      } =
      A.object
        [ "@type" A..= T.String "getScopeNotificationSettings",
          "scope" A..= scope
        ]
