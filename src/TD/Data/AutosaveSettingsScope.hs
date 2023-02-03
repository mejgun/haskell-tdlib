{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AutosaveSettingsScope where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes scope of autosave settings
data AutosaveSettingsScope
  = -- | Autosave settings applied to all private chats without chat-specific settings
    AutosaveSettingsScopePrivateChats
  | -- | Autosave settings applied to all basic group and supergroup chats without chat-specific settings
    AutosaveSettingsScopeGroupChats
  | -- | Autosave settings applied to all channel chats without chat-specific settings
    AutosaveSettingsScopeChannelChats
  | -- | Autosave settings applied to a chat @chat_id Chat identifier
    AutosaveSettingsScopeChat
      { -- |
        chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show AutosaveSettingsScope where
  show AutosaveSettingsScopePrivateChats =
    "AutosaveSettingsScopePrivateChats"
      ++ U.cc
        []
  show AutosaveSettingsScopeGroupChats =
    "AutosaveSettingsScopeGroupChats"
      ++ U.cc
        []
  show AutosaveSettingsScopeChannelChats =
    "AutosaveSettingsScopeChannelChats"
      ++ U.cc
        []
  show
    AutosaveSettingsScopeChat
      { chat_id = chat_id_
      } =
      "AutosaveSettingsScopeChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.FromJSON AutosaveSettingsScope where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "autosaveSettingsScopePrivateChats" -> parseAutosaveSettingsScopePrivateChats v
      "autosaveSettingsScopeGroupChats" -> parseAutosaveSettingsScopeGroupChats v
      "autosaveSettingsScopeChannelChats" -> parseAutosaveSettingsScopeChannelChats v
      "autosaveSettingsScopeChat" -> parseAutosaveSettingsScopeChat v
      _ -> mempty
    where
      parseAutosaveSettingsScopePrivateChats :: A.Value -> T.Parser AutosaveSettingsScope
      parseAutosaveSettingsScopePrivateChats = A.withObject "AutosaveSettingsScopePrivateChats" $ \_ -> return AutosaveSettingsScopePrivateChats

      parseAutosaveSettingsScopeGroupChats :: A.Value -> T.Parser AutosaveSettingsScope
      parseAutosaveSettingsScopeGroupChats = A.withObject "AutosaveSettingsScopeGroupChats" $ \_ -> return AutosaveSettingsScopeGroupChats

      parseAutosaveSettingsScopeChannelChats :: A.Value -> T.Parser AutosaveSettingsScope
      parseAutosaveSettingsScopeChannelChats = A.withObject "AutosaveSettingsScopeChannelChats" $ \_ -> return AutosaveSettingsScopeChannelChats

      parseAutosaveSettingsScopeChat :: A.Value -> T.Parser AutosaveSettingsScope
      parseAutosaveSettingsScopeChat = A.withObject "AutosaveSettingsScopeChat" $ \o -> do
        chat_id_ <- o A..:? "chat_id"
        return $ AutosaveSettingsScopeChat {chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON AutosaveSettingsScope where
  toJSON AutosaveSettingsScopePrivateChats =
    A.object
      [ "@type" A..= T.String "autosaveSettingsScopePrivateChats"
      ]
  toJSON AutosaveSettingsScopeGroupChats =
    A.object
      [ "@type" A..= T.String "autosaveSettingsScopeGroupChats"
      ]
  toJSON AutosaveSettingsScopeChannelChats =
    A.object
      [ "@type" A..= T.String "autosaveSettingsScopeChannelChats"
      ]
  toJSON
    AutosaveSettingsScopeChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "autosaveSettingsScopeChat",
          "chat_id" A..= chat_id_
        ]
