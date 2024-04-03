module TD.Query.SetNewChatPrivacySettings
  (SetNewChatPrivacySettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NewChatPrivacySettings as NewChatPrivacySettings

-- | Changes privacy settings for new chat creation; can be used only if getOption("can_set_new_chat_privacy_settings"). Returns 'TD.Data.Ok.Ok'
data SetNewChatPrivacySettings
  = SetNewChatPrivacySettings
    { settings :: Maybe NewChatPrivacySettings.NewChatPrivacySettings -- ^ New settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetNewChatPrivacySettings where
  shortShow
    SetNewChatPrivacySettings
      { settings = settings_
      }
        = "SetNewChatPrivacySettings"
          ++ I.cc
          [ "settings" `I.p` settings_
          ]

instance AT.ToJSON SetNewChatPrivacySettings where
  toJSON
    SetNewChatPrivacySettings
      { settings = settings_
      }
        = A.object
          [ "@type"    A..= AT.String "setNewChatPrivacySettings"
          , "settings" A..= settings_
          ]

