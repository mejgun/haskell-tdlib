module TD.Data.AutosaveSettings
  (AutosaveSettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings
import qualified TD.Data.AutosaveSettingsException as AutosaveSettingsException

data AutosaveSettings
  = AutosaveSettings -- ^ Describes autosave settings
    { private_chat_settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings           -- ^ Default autosave settings for private chats
    , group_settings        :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings           -- ^ Default autosave settings for basic group and supergroup chats
    , channel_settings      :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings           -- ^ Default autosave settings for channel chats
    , exceptions            :: Maybe [AutosaveSettingsException.AutosaveSettingsException] -- ^ Autosave settings for specific chats
    }
  deriving (Eq, Show)

instance I.ShortShow AutosaveSettings where
  shortShow AutosaveSettings
    { private_chat_settings = private_chat_settings_
    , group_settings        = group_settings_
    , channel_settings      = channel_settings_
    , exceptions            = exceptions_
    }
      = "AutosaveSettings"
        ++ I.cc
        [ "private_chat_settings" `I.p` private_chat_settings_
        , "group_settings"        `I.p` group_settings_
        , "channel_settings"      `I.p` channel_settings_
        , "exceptions"            `I.p` exceptions_
        ]

instance AT.FromJSON AutosaveSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "autosaveSettings" -> parseAutosaveSettings v
      _                  -> mempty
    
    where
      parseAutosaveSettings :: A.Value -> AT.Parser AutosaveSettings
      parseAutosaveSettings = A.withObject "AutosaveSettings" $ \o -> do
        private_chat_settings_ <- o A..:?  "private_chat_settings"
        group_settings_        <- o A..:?  "group_settings"
        channel_settings_      <- o A..:?  "channel_settings"
        exceptions_            <- o A..:?  "exceptions"
        pure $ AutosaveSettings
          { private_chat_settings = private_chat_settings_
          , group_settings        = group_settings_
          , channel_settings      = channel_settings_
          , exceptions            = exceptions_
          }
  parseJSON _ = mempty

