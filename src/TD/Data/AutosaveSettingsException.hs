module TD.Data.AutosaveSettingsException
  (AutosaveSettingsException(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ScopeAutosaveSettings as ScopeAutosaveSettings

data AutosaveSettingsException
  = AutosaveSettingsException -- ^ Contains autosave settings for a chat, which overrides default settings for the corresponding scope
    { chat_id  :: Maybe Int                                         -- ^ Chat identifier
    , settings :: Maybe ScopeAutosaveSettings.ScopeAutosaveSettings -- ^ Autosave settings for the chat
    }
  deriving (Eq, Show)

instance I.ShortShow AutosaveSettingsException where
  shortShow AutosaveSettingsException
    { chat_id  = chat_id_
    , settings = settings_
    }
      = "AutosaveSettingsException"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "settings" `I.p` settings_
        ]

instance AT.FromJSON AutosaveSettingsException where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "autosaveSettingsException" -> parseAutosaveSettingsException v
      _                           -> mempty
    
    where
      parseAutosaveSettingsException :: A.Value -> AT.Parser AutosaveSettingsException
      parseAutosaveSettingsException = A.withObject "AutosaveSettingsException" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        settings_ <- o A..:?  "settings"
        pure $ AutosaveSettingsException
          { chat_id  = chat_id_
          , settings = settings_
          }
  parseJSON _ = mempty

