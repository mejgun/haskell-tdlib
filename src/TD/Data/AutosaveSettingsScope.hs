module TD.Data.AutosaveSettingsScope
  (AutosaveSettingsScope(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes scope of autosave settings
data AutosaveSettingsScope
  = AutosaveSettingsScopePrivateChats -- ^ Autosave settings applied to all private chats without chat-specific settings
  | AutosaveSettingsScopeGroupChats -- ^ Autosave settings applied to all basic group and supergroup chats without chat-specific settings
  | AutosaveSettingsScopeChannelChats -- ^ Autosave settings applied to all channel chats without chat-specific settings
  | AutosaveSettingsScopeChat -- ^ Autosave settings applied to a chat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow AutosaveSettingsScope where
  shortShow AutosaveSettingsScopePrivateChats
      = "AutosaveSettingsScopePrivateChats"
  shortShow AutosaveSettingsScopeGroupChats
      = "AutosaveSettingsScopeGroupChats"
  shortShow AutosaveSettingsScopeChannelChats
      = "AutosaveSettingsScopeChannelChats"
  shortShow AutosaveSettingsScopeChat
    { chat_id = chat_id_
    }
      = "AutosaveSettingsScopeChat"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]

instance AT.FromJSON AutosaveSettingsScope where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "autosaveSettingsScopePrivateChats" -> pure AutosaveSettingsScopePrivateChats
      "autosaveSettingsScopeGroupChats"   -> pure AutosaveSettingsScopeGroupChats
      "autosaveSettingsScopeChannelChats" -> pure AutosaveSettingsScopeChannelChats
      "autosaveSettingsScopeChat"         -> parseAutosaveSettingsScopeChat v
      _                                   -> mempty
    
    where
      parseAutosaveSettingsScopeChat :: A.Value -> AT.Parser AutosaveSettingsScope
      parseAutosaveSettingsScopeChat = A.withObject "AutosaveSettingsScopeChat" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ AutosaveSettingsScopeChat
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON AutosaveSettingsScope where
  toJSON AutosaveSettingsScopePrivateChats
      = A.object
        [ "@type" A..= AT.String "autosaveSettingsScopePrivateChats"
        ]
  toJSON AutosaveSettingsScopeGroupChats
      = A.object
        [ "@type" A..= AT.String "autosaveSettingsScopeGroupChats"
        ]
  toJSON AutosaveSettingsScopeChannelChats
      = A.object
        [ "@type" A..= AT.String "autosaveSettingsScopeChannelChats"
        ]
  toJSON AutosaveSettingsScopeChat
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "autosaveSettingsScopeChat"
        , "chat_id" A..= chat_id_
        ]

