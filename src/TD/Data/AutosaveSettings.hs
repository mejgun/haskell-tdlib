{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AutosaveSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AutosaveSettingsException as AutosaveSettingsException
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings
import qualified Utils as U

-- |
data AutosaveSettings = -- | Describes autosave settings
  AutosaveSettings
  { -- | Autosave settings for specific chats
    exceptions :: Maybe [AutosaveSettingsException.AutosaveSettingsException],
    -- | Default autosave settings for channel chats
    channel_settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings,
    -- | Default autosave settings for basic group and supergroup chats
    group_settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings,
    -- | Default autosave settings for private chats
    private_chat_settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings
  }
  deriving (Eq)

instance Show AutosaveSettings where
  show
    AutosaveSettings
      { exceptions = exceptions_,
        channel_settings = channel_settings_,
        group_settings = group_settings_,
        private_chat_settings = private_chat_settings_
      } =
      "AutosaveSettings"
        ++ U.cc
          [ U.p "exceptions" exceptions_,
            U.p "channel_settings" channel_settings_,
            U.p "group_settings" group_settings_,
            U.p "private_chat_settings" private_chat_settings_
          ]

instance T.FromJSON AutosaveSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "autosaveSettings" -> parseAutosaveSettings v
      _ -> mempty
    where
      parseAutosaveSettings :: A.Value -> T.Parser AutosaveSettings
      parseAutosaveSettings = A.withObject "AutosaveSettings" $ \o -> do
        exceptions_ <- o A..:? "exceptions"
        channel_settings_ <- o A..:? "channel_settings"
        group_settings_ <- o A..:? "group_settings"
        private_chat_settings_ <- o A..:? "private_chat_settings"
        return $ AutosaveSettings {exceptions = exceptions_, channel_settings = channel_settings_, group_settings = group_settings_, private_chat_settings = private_chat_settings_}
  parseJSON _ = mempty

instance T.ToJSON AutosaveSettings where
  toJSON
    AutosaveSettings
      { exceptions = exceptions_,
        channel_settings = channel_settings_,
        group_settings = group_settings_,
        private_chat_settings = private_chat_settings_
      } =
      A.object
        [ "@type" A..= T.String "autosaveSettings",
          "exceptions" A..= exceptions_,
          "channel_settings" A..= channel_settings_,
          "group_settings" A..= group_settings_,
          "private_chat_settings" A..= private_chat_settings_
        ]
