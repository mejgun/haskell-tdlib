module TD.Data.SettingsSection
  (SettingsSection(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a section of the application settings
data SettingsSection
  = SettingsSectionAppearance -- ^ The appearance section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "themes", "themes/edit", "themes/create", "wallpapers", "wallpapers/edit", "wallpapers/set", "wallpapers/choose-photo", "your-color/profile", "your-color/profile/add-icons", "your-color/profile/use-gift", "your-color/profile/reset", "your-color/name", "your-color/name/add-icons", "your-color/name/use-gift", "night-mode", "auto-night-mode", "text-size", "text-size/use-system", "message-corners", "animations", "stickers-and-emoji", "stickers-and-emoji/edit", "stickers-and-emoji/trending", "stickers-and-emoji/archived", "stickers-and-emoji/archived/edit", "stickers-and-emoji/emoji", "stickers-and-emoji/emoji/edit", "stickers-and-emoji/emoji/archived", "stickers-and-emoji/emoji/archived/edit", "stickers-and-emoji/emoji/suggest", "stickers-and-emoji/emoji/quick-reaction", "stickers-and-emoji/emoji/quick-reaction/choose", "stickers-and-emoji/suggest-by-emoji", "stickers-and-emoji/large-emoji", "stickers-and-emoji/dynamic-order", "stickers-and-emoji/emoji/show-more", "app-icon", "tap-for-next-media"
    }
  | SettingsSectionAskQuestion -- ^ The "Ask a question" section
  | SettingsSectionBusiness -- ^ The "Telegram Business" section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "do-not-hide-ads"
    }
  | SettingsSectionChatFolders -- ^ The chat folder settings section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "edit", "create", "add-recommended", "show-tags", "tab-view"
    }
  | SettingsSectionDataAndStorage -- ^ The data and storage settings section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "storage", "storage/edit", "storage/auto-remove", "storage/clear-cache", "storage/max-cache", "usage", "usage/mobile", "usage/wifi", "usage/reset", "usage/roaming", "auto-download/mobile", "auto-download/mobile/enable", "auto-download/mobile/usage", "auto-download/mobile/photos", "auto-download/mobile/stories", "auto-download/mobile/videos", "auto-download/mobile/files", "auto-download/wifi", "auto-download/wifi/enable", "auto-download/wifi/usage", "auto-download/wifi/photos", "auto-download/wifi/stories", "auto-download/wifi/videos", "auto-download/wifi/files", "auto-download/roaming", "auto-download/roaming/enable", "auto-download/roaming/usage", "auto-download/roaming/photos", "auto-download/roaming/stories", "auto-download/roaming/videos", "auto-download/roaming/files", "auto-download/reset", "save-to-photos/chats", "save-to-photos/chats/max-video-size", "save-to-photos/chats/add-exception", "save-to-photos/chats/delete-all", "save-to-photos/groups", "save-to-photos/groups/max-video-size", "save-to-photos/groups/add-exception", "save-to-photos/groups/delete-all", "save-to-photos/channels", "save-to-photos/channels/max-video-size", "save-to-photos/channels/add-exception", "save-to-photos/channels/delete-all", "less-data-calls", "open-links", "share-sheet", "share-sheet/suggested-chats", "share-sheet/suggest-by", "share-sheet/reset", "saved-edited-photos", "pause-music", "raise-to-listen", "raise-to-speak", "show-18-content", "proxy", "proxy/edit", "proxy/use-proxy", "proxy/add-proxy", "proxy/share-list", "proxy/use-for-calls"
    }
  | SettingsSectionDevices -- ^ The Devices section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "edit", "link-desktop", "terminate-sessions", "auto-terminate"
    }
  | SettingsSectionEditProfile -- ^ The profile edit section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "set-photo", "first-name", "last-name", "emoji-status", "bio", "birthday", "change-number", "username", "your-color", "channel", "add-account", "log-out", "profile-color/profile", "profile-color/profile/add-icons", "profile-color/profile/use-gift", "profile-color/name", "profile-color/name/add-icons", "profile-color/name/use-gift", "profile-photo/use-emoji"
    }
  | SettingsSectionFaq -- ^ The FAQ section
  | SettingsSectionFeatures -- ^ The "Telegram Features" section
  | SettingsSectionInAppBrowser -- ^ The in-app browser settings section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "enable-browser", "clear-cookies", "clear-cache", "history", "clear-history", "never-open", "clear-list", "search"
    }
  | SettingsSectionLanguage -- ^ The application language section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "show-button" for Show Translate Button toggle, "translate-chats" for Translate Entire Chats toggle, "do-not-translate" - for Do Not Translate language list
    }
  | SettingsSectionMyStars -- ^ The Telegram Star balance and transaction section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "top-up", "stats", "gift", "earn"
    }
  | SettingsSectionMyToncoins -- ^ The Toncoin balance and transaction section
  | SettingsSectionNotifications -- ^ The notification settings section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "accounts", "private-chats", "private-chats/edit", "private-chats/show", "private-chats/preview", "private-chats/sound", "private-chats/add-exception", "private-chats/delete-exceptions", "private-chats/light-color", "private-chats/vibrate", "private-chats/priority", "groups", "groups/edit", "groups/show", "groups/preview", "groups/sound", "groups/add-exception", "groups/delete-exceptions", "groups/light-color", "groups/vibrate", "groups/priority", "channels", "channels/edit", "channels/show", "channels/preview", "channels/sound", "channels/add-exception", "channels/delete-exceptions", "channels/light-color", "channels/vibrate", "channels/priority", "stories", "stories/new", "stories/important", "stories/show-sender", "stories/sound", "stories/add-exception", "stories/delete-exceptions", "stories/light-color", "stories/vibrate", "stories/priority", "reactions", "reactions/messages", "reactions/stories", "reactions/show-sender", "reactions/sound", "reactions/light-color", "reactions/vibrate", "reactions/priority", "in-app-sounds", "in-app-vibrate", "in-app-preview", "in-chat-sounds", "in-app-popup", "lock-screen-names", "include-channels", "include-muted-chats", "count-unread-messages", "new-contacts", "pinned-messages", "reset", "web"
    }
  | SettingsSectionPowerSaving -- ^ The power saving settings section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "videos", "gifs", "stickers", "emoji", "effects", "preload", "background", "call-animations", "particles", "transitions"
    }
  | SettingsSectionPremium -- ^ The "Telegram Premium" section
  | SettingsSectionPrivacyAndSecurity -- ^ The privacy and security section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "blocked", "blocked/edit", "blocked/block-user", "blocked/block-user/chats", "blocked/block-user/contacts", "active-websites", "active-websites/edit", "active-websites/disconnect-all", "passcode", "passcode/disable", "passcode/change", "passcode/auto-lock", "passcode/face-id", "passcode/fingerprint", "2sv", "2sv/change", "2sv/disable", "2sv/change-email", "passkey", "passkey/create", "auto-delete", "auto-delete/set-custom", "login-email", "phone-number", "phone-number/never", "phone-number/always", "last-seen", "last-seen/never", "last-seen/always", "last-seen/hide-read-time", "profile-photos", "profile-photos/never", "profile-photos/always", "profile-photos/set-public", "profile-photos/update-public", "profile-photos/remove-public", "bio", "bio/never", "bio/always", "gifts", "gifts/show-icon", "gifts/never", "gifts/always", "gifts/accepted-types", "birthday", "birthday/add", "birthday/never", "birthday/always", "saved-music", "saved-music/never", "saved-music/always", "forwards", "forwards/never", "forwards/always", "calls", "calls/never", "calls/always", "calls/p2p", "calls/p2p/never", "calls/p2p/always", "calls/ios-integration", "voice", "voice/never", "voice/always", "messages", "messages/set-price", "messages/exceptions", "invites", "invites/never", "invites/always", "self-destruct", "data-settings", "data-settings/sync-contacts", "data-settings/delete-synced", "data-settings/suggest-contacts", "data-settings/delete-cloud-drafts", "data-settings/clear-payment-info", "data-settings/link-previews", "data-settings/bot-settings", "data-settings/map-provider", "archive-and-mute"
    }
  | SettingsSectionPrivacyPolicy -- ^ The "Privacy Policy" section
  | SettingsSectionQrCode -- ^ The current user's QR code section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "share", "scan"
    }
  | SettingsSectionSearch -- ^ Search in Settings
  | SettingsSectionSendGift -- ^ The "Send a gift" section
    { subsection :: Maybe T.Text -- ^ Subsection of the section; may be one of "", "self"
    }
  deriving (Eq, Show)

instance I.ShortShow SettingsSection where
  shortShow SettingsSectionAppearance
    { subsection = subsection_
    }
      = "SettingsSectionAppearance"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionAskQuestion
      = "SettingsSectionAskQuestion"
  shortShow SettingsSectionBusiness
    { subsection = subsection_
    }
      = "SettingsSectionBusiness"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionChatFolders
    { subsection = subsection_
    }
      = "SettingsSectionChatFolders"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionDataAndStorage
    { subsection = subsection_
    }
      = "SettingsSectionDataAndStorage"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionDevices
    { subsection = subsection_
    }
      = "SettingsSectionDevices"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionEditProfile
    { subsection = subsection_
    }
      = "SettingsSectionEditProfile"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionFaq
      = "SettingsSectionFaq"
  shortShow SettingsSectionFeatures
      = "SettingsSectionFeatures"
  shortShow SettingsSectionInAppBrowser
    { subsection = subsection_
    }
      = "SettingsSectionInAppBrowser"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionLanguage
    { subsection = subsection_
    }
      = "SettingsSectionLanguage"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionMyStars
    { subsection = subsection_
    }
      = "SettingsSectionMyStars"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionMyToncoins
      = "SettingsSectionMyToncoins"
  shortShow SettingsSectionNotifications
    { subsection = subsection_
    }
      = "SettingsSectionNotifications"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionPowerSaving
    { subsection = subsection_
    }
      = "SettingsSectionPowerSaving"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionPremium
      = "SettingsSectionPremium"
  shortShow SettingsSectionPrivacyAndSecurity
    { subsection = subsection_
    }
      = "SettingsSectionPrivacyAndSecurity"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionPrivacyPolicy
      = "SettingsSectionPrivacyPolicy"
  shortShow SettingsSectionQrCode
    { subsection = subsection_
    }
      = "SettingsSectionQrCode"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]
  shortShow SettingsSectionSearch
      = "SettingsSectionSearch"
  shortShow SettingsSectionSendGift
    { subsection = subsection_
    }
      = "SettingsSectionSendGift"
        ++ I.cc
        [ "subsection" `I.p` subsection_
        ]

instance AT.FromJSON SettingsSection where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "settingsSectionAppearance"         -> parseSettingsSectionAppearance v
      "settingsSectionAskQuestion"        -> pure SettingsSectionAskQuestion
      "settingsSectionBusiness"           -> parseSettingsSectionBusiness v
      "settingsSectionChatFolders"        -> parseSettingsSectionChatFolders v
      "settingsSectionDataAndStorage"     -> parseSettingsSectionDataAndStorage v
      "settingsSectionDevices"            -> parseSettingsSectionDevices v
      "settingsSectionEditProfile"        -> parseSettingsSectionEditProfile v
      "settingsSectionFaq"                -> pure SettingsSectionFaq
      "settingsSectionFeatures"           -> pure SettingsSectionFeatures
      "settingsSectionInAppBrowser"       -> parseSettingsSectionInAppBrowser v
      "settingsSectionLanguage"           -> parseSettingsSectionLanguage v
      "settingsSectionMyStars"            -> parseSettingsSectionMyStars v
      "settingsSectionMyToncoins"         -> pure SettingsSectionMyToncoins
      "settingsSectionNotifications"      -> parseSettingsSectionNotifications v
      "settingsSectionPowerSaving"        -> parseSettingsSectionPowerSaving v
      "settingsSectionPremium"            -> pure SettingsSectionPremium
      "settingsSectionPrivacyAndSecurity" -> parseSettingsSectionPrivacyAndSecurity v
      "settingsSectionPrivacyPolicy"      -> pure SettingsSectionPrivacyPolicy
      "settingsSectionQrCode"             -> parseSettingsSectionQrCode v
      "settingsSectionSearch"             -> pure SettingsSectionSearch
      "settingsSectionSendGift"           -> parseSettingsSectionSendGift v
      _                                   -> mempty
    
    where
      parseSettingsSectionAppearance :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionAppearance = A.withObject "SettingsSectionAppearance" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionAppearance
          { subsection = subsection_
          }
      parseSettingsSectionBusiness :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionBusiness = A.withObject "SettingsSectionBusiness" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionBusiness
          { subsection = subsection_
          }
      parseSettingsSectionChatFolders :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionChatFolders = A.withObject "SettingsSectionChatFolders" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionChatFolders
          { subsection = subsection_
          }
      parseSettingsSectionDataAndStorage :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionDataAndStorage = A.withObject "SettingsSectionDataAndStorage" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionDataAndStorage
          { subsection = subsection_
          }
      parseSettingsSectionDevices :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionDevices = A.withObject "SettingsSectionDevices" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionDevices
          { subsection = subsection_
          }
      parseSettingsSectionEditProfile :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionEditProfile = A.withObject "SettingsSectionEditProfile" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionEditProfile
          { subsection = subsection_
          }
      parseSettingsSectionInAppBrowser :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionInAppBrowser = A.withObject "SettingsSectionInAppBrowser" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionInAppBrowser
          { subsection = subsection_
          }
      parseSettingsSectionLanguage :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionLanguage = A.withObject "SettingsSectionLanguage" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionLanguage
          { subsection = subsection_
          }
      parseSettingsSectionMyStars :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionMyStars = A.withObject "SettingsSectionMyStars" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionMyStars
          { subsection = subsection_
          }
      parseSettingsSectionNotifications :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionNotifications = A.withObject "SettingsSectionNotifications" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionNotifications
          { subsection = subsection_
          }
      parseSettingsSectionPowerSaving :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionPowerSaving = A.withObject "SettingsSectionPowerSaving" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionPowerSaving
          { subsection = subsection_
          }
      parseSettingsSectionPrivacyAndSecurity :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionPrivacyAndSecurity = A.withObject "SettingsSectionPrivacyAndSecurity" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionPrivacyAndSecurity
          { subsection = subsection_
          }
      parseSettingsSectionQrCode :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionQrCode = A.withObject "SettingsSectionQrCode" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionQrCode
          { subsection = subsection_
          }
      parseSettingsSectionSendGift :: A.Value -> AT.Parser SettingsSection
      parseSettingsSectionSendGift = A.withObject "SettingsSectionSendGift" $ \o -> do
        subsection_ <- o A..:?  "subsection"
        pure $ SettingsSectionSendGift
          { subsection = subsection_
          }
  parseJSON _ = mempty

instance AT.ToJSON SettingsSection where
  toJSON SettingsSectionAppearance
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionAppearance"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionAskQuestion
      = A.object
        [ "@type" A..= AT.String "settingsSectionAskQuestion"
        ]
  toJSON SettingsSectionBusiness
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionBusiness"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionChatFolders
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionChatFolders"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionDataAndStorage
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionDataAndStorage"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionDevices
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionDevices"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionEditProfile
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionEditProfile"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionFaq
      = A.object
        [ "@type" A..= AT.String "settingsSectionFaq"
        ]
  toJSON SettingsSectionFeatures
      = A.object
        [ "@type" A..= AT.String "settingsSectionFeatures"
        ]
  toJSON SettingsSectionInAppBrowser
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionInAppBrowser"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionLanguage
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionLanguage"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionMyStars
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionMyStars"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionMyToncoins
      = A.object
        [ "@type" A..= AT.String "settingsSectionMyToncoins"
        ]
  toJSON SettingsSectionNotifications
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionNotifications"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionPowerSaving
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionPowerSaving"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionPremium
      = A.object
        [ "@type" A..= AT.String "settingsSectionPremium"
        ]
  toJSON SettingsSectionPrivacyAndSecurity
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionPrivacyAndSecurity"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionPrivacyPolicy
      = A.object
        [ "@type" A..= AT.String "settingsSectionPrivacyPolicy"
        ]
  toJSON SettingsSectionQrCode
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionQrCode"
        , "subsection" A..= subsection_
        ]
  toJSON SettingsSectionSearch
      = A.object
        [ "@type" A..= AT.String "settingsSectionSearch"
        ]
  toJSON SettingsSectionSendGift
    { subsection = subsection_
    }
      = A.object
        [ "@type"      A..= AT.String "settingsSectionSendGift"
        , "subsection" A..= subsection_
        ]

