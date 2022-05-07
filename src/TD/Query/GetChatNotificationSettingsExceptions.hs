{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatNotificationSettingsExceptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.NotificationSettingsScope as NotificationSettingsScope
import qualified Utils as U

-- |
-- Returns list of chats with non-default notification settings
data GetChatNotificationSettingsExceptions = GetChatNotificationSettingsExceptions
  { -- | Pass true to include in the response chats with only non-default sound
    compare_sound :: Maybe Bool,
    -- | If specified, only chats from the scope will be returned; pass null to return chats from all scopes
    scope :: Maybe NotificationSettingsScope.NotificationSettingsScope
  }
  deriving (Eq)

instance Show GetChatNotificationSettingsExceptions where
  show
    GetChatNotificationSettingsExceptions
      { compare_sound = compare_sound,
        scope = scope
      } =
      "GetChatNotificationSettingsExceptions"
        ++ U.cc
          [ U.p "compare_sound" compare_sound,
            U.p "scope" scope
          ]

instance T.ToJSON GetChatNotificationSettingsExceptions where
  toJSON
    GetChatNotificationSettingsExceptions
      { compare_sound = compare_sound,
        scope = scope
      } =
      A.object
        [ "@type" A..= T.String "getChatNotificationSettingsExceptions",
          "compare_sound" A..= compare_sound,
          "scope" A..= scope
        ]
