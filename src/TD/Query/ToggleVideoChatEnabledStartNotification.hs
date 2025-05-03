module TD.Query.ToggleVideoChatEnabledStartNotification
  (ToggleVideoChatEnabledStartNotification(..)
  , defaultToggleVideoChatEnabledStartNotification
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether the current user will receive a notification when the video chat starts; for scheduled video chats only. Returns 'TD.Data.Ok.Ok'
data ToggleVideoChatEnabledStartNotification
  = ToggleVideoChatEnabledStartNotification
    { group_call_id              :: Maybe Int  -- ^ Group call identifier
    , enabled_start_notification :: Maybe Bool -- ^ New value of the enabled_start_notification setting
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleVideoChatEnabledStartNotification where
  shortShow
    ToggleVideoChatEnabledStartNotification
      { group_call_id              = group_call_id_
      , enabled_start_notification = enabled_start_notification_
      }
        = "ToggleVideoChatEnabledStartNotification"
          ++ I.cc
          [ "group_call_id"              `I.p` group_call_id_
          , "enabled_start_notification" `I.p` enabled_start_notification_
          ]

instance AT.ToJSON ToggleVideoChatEnabledStartNotification where
  toJSON
    ToggleVideoChatEnabledStartNotification
      { group_call_id              = group_call_id_
      , enabled_start_notification = enabled_start_notification_
      }
        = A.object
          [ "@type"                      A..= AT.String "toggleVideoChatEnabledStartNotification"
          , "group_call_id"              A..= group_call_id_
          , "enabled_start_notification" A..= enabled_start_notification_
          ]

defaultToggleVideoChatEnabledStartNotification :: ToggleVideoChatEnabledStartNotification
defaultToggleVideoChatEnabledStartNotification =
  ToggleVideoChatEnabledStartNotification
    { group_call_id              = Nothing
    , enabled_start_notification = Nothing
    }

