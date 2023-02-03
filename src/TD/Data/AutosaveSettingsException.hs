{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AutosaveSettingsException where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings
import qualified Utils as U

-- |
data AutosaveSettingsException = -- | Contains autosave settings for a chat, which overrides default settings for the corresponding scope
  AutosaveSettingsException
  { -- | Autosave settings for the chat
    settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AutosaveSettingsException where
  show
    AutosaveSettingsException
      { settings = settings_,
        chat_id = chat_id_
      } =
      "AutosaveSettingsException"
        ++ U.cc
          [ U.p "settings" settings_,
            U.p "chat_id" chat_id_
          ]

instance T.FromJSON AutosaveSettingsException where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "autosaveSettingsException" -> parseAutosaveSettingsException v
      _ -> mempty
    where
      parseAutosaveSettingsException :: A.Value -> T.Parser AutosaveSettingsException
      parseAutosaveSettingsException = A.withObject "AutosaveSettingsException" $ \o -> do
        settings_ <- o A..:? "settings"
        chat_id_ <- o A..:? "chat_id"
        return $ AutosaveSettingsException {settings = settings_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON AutosaveSettingsException where
  toJSON
    AutosaveSettingsException
      { settings = settings_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "autosaveSettingsException",
          "settings" A..= settings_,
          "chat_id" A..= chat_id_
        ]
