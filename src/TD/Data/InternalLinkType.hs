{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InternalLinkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.ProxyType as ProxyType
import {-# SOURCE #-} qualified TD.Data.TargetChat as TargetChat
import qualified Utils as U

-- | Describes an internal https://t.me or tg: link, which must be processed by the application in a special way
data InternalLinkType
  = -- | The link is a link to the active sessions section of the application. Use getActiveSessions to handle the link
    InternalLinkTypeActiveSessions
  | -- | The link is a link to an attachment menu bot to be opened in the specified or a chosen chat. Process given target_chat to open the chat.
    -- Then call searchPublicChat with the given bot username, check that the user is a bot and can be added to attachment menu. Then use getAttachmentMenuBot to receive information about the bot.
    -- If the bot isn't added to attachment menu, then user needs to confirm adding the bot to attachment menu. If user confirms adding, then use toggleBotIsAddedToAttachmentMenu to add it.
    -- If the attachment menu bot can't be used in the opened chat, show an error to the user. If the bot is added to attachment menu and can be used in the chat, then use openWebApp with the given URL
    InternalLinkTypeAttachmentMenuBot
      { -- |
        url :: Maybe String,
        -- |
        bot_username :: Maybe String,
        -- | Target chat to be opened @bot_username Username of the bot @url URL to be passed to openWebApp
        target_chat :: Maybe TargetChat.TargetChat
      }
  | -- | The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode @code The authentication code
    InternalLinkTypeAuthenticationCode
      { -- |
        code :: Maybe String
      }
  | -- | The link is a link to a background. Call searchBackground with the given background name to process the link @background_name Name of the background
    InternalLinkTypeBackground
      { -- |
        background_name :: Maybe String
      }
  | -- | The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot,
    -- and then call sendBotStartMessage with the given start parameter after the button is pressed
    InternalLinkTypeBotStart
      { -- | True, if sendBotStartMessage must be called automatically without showing the START button
        autostart :: Maybe Bool,
        -- |
        start_parameter :: Maybe String,
        -- | Username of the bot @start_parameter The parameter to be passed to sendBotStartMessage
        bot_username :: Maybe String
      }
  | -- | The link is a link to a Telegram bot, which is supposed to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups,
    -- ask the current user to select a basic group or a supergroup chat to add the bot to, taking into account that bots can be added to a public supergroup only by administrators of the supergroup.
    -- If administrator rights are provided by the link, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,
    -- check that the current user can edit its administrator rights, combine received rights with the requested administrator rights, show confirmation box to the user,
    -- and call setChatMemberStatus with the chosen chat and confirmed administrator rights. Before call to setChatMemberStatus it may be required to upgrade the chosen basic group chat to a supergroup chat.
    -- Then if start_parameter isn't empty, call sendBotStartMessage with the given start parameter and the chosen chat, otherwise just send /start message with bot's username added to the chat.
    InternalLinkTypeBotStartInGroup
      { -- |
        administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
        -- |
        start_parameter :: Maybe String,
        -- | Username of the bot @start_parameter The parameter to be passed to sendBotStartMessage @administrator_rights Expected administrator rights for the bot; may be null
        bot_username :: Maybe String
      }
  | -- | The link is a link to a Telegram bot, which is supposed to be added to a channel chat as an administrator. Call searchPublicChat with the given bot username and check that the user is a bot,
    -- ask the current user to select a channel chat to add the bot to as an administrator. Then call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,
    -- check that the current user can edit its administrator rights and combine received rights with the requested administrator rights. Then show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed rights
    InternalLinkTypeBotAddToChannel
      { -- |
        administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
        -- | Username of the bot @administrator_rights Expected administrator rights for the bot
        bot_username :: Maybe String
      }
  | -- | The link is a link to the change phone number section of the app
    InternalLinkTypeChangePhoneNumber
  | -- | The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link @invite_link Internal representation of the invite link
    InternalLinkTypeChatInvite
      { -- |
        invite_link :: Maybe String
      }
  | -- | The link is a link to the filter settings section of the app
    InternalLinkTypeFilterSettings
  | -- | The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot, ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame
    InternalLinkTypeGame
      { -- |
        game_short_name :: Maybe String,
        -- | Username of the bot that owns the game @game_short_name Short name of the game
        bot_username :: Maybe String
      }
  | -- | The link must be opened in an Instant View. Call getWebPageInstantView with the given URL to process the link @url URL to be passed to getWebPageInstantView @fallback_url An URL to open if getWebPageInstantView fails
    InternalLinkTypeInstantView
      { -- |
        fallback_url :: Maybe String,
        -- |
        url :: Maybe String
      }
  | -- | The link is a link to an invoice. Call getPaymentForm with the given invoice name to process the link @invoice_name Name of the invoice
    InternalLinkTypeInvoice
      { -- |
        invoice_name :: Maybe String
      }
  | -- | The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link @language_pack_id Language pack identifier
    InternalLinkTypeLanguagePack
      { -- |
        language_pack_id :: Maybe String
      }
  | -- | The link is a link to the language settings section of the app
    InternalLinkTypeLanguageSettings
  | -- | The link is a link to a Telegram message or a forum topic. Call getMessageLinkInfo with the given URL to process the link @url URL to be passed to getMessageLinkInfo
    InternalLinkTypeMessage
      { -- |
        url :: Maybe String
      }
  | -- | The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field
    InternalLinkTypeMessageDraft
      { -- |
        contains_link :: Maybe Bool,
        -- | Message draft text @contains_link True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
        text :: Maybe FormattedText.FormattedText
      }
  | -- | The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the application, otherwise ignore it
    InternalLinkTypePassportDataRequest
      { -- | An HTTP URL to open once the request is finished or canceled with the parameter tg_passport=success or tg_passport=cancel respectively. If empty, then the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel needs to be opened instead
        callback_url :: Maybe String,
        -- |
        nonce :: Maybe String,
        -- |
        public_key :: Maybe String,
        -- |
        scope :: Maybe String,
        -- | User identifier of the service's bot @scope Telegram Passport element types requested by the service @public_key Service's public key @nonce Unique request identifier provided by the service
        bot_user_id :: Maybe Int
      }
  | -- | The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberConfirmationCode with the given hash and phone number to process the link
    InternalLinkTypePhoneNumberConfirmation
      { -- |
        phone_number :: Maybe String,
        -- | Hash value from the link @phone_number Phone number value from the link
        hash :: Maybe String
      }
  | -- | The link is a link to the Premium features screen of the applcation from which the user can subscribe to Telegram Premium. Call getPremiumFeatures with the given referrer to process the link @referrer Referrer specified in the link
    InternalLinkTypePremiumFeatures
      { -- |
        referrer :: Maybe String
      }
  | -- | The link is a link to the privacy and security settings section of the app
    InternalLinkTypePrivacyAndSecuritySettings
  | -- | The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy
    InternalLinkTypeProxy
      { -- |
        _type :: Maybe ProxyType.ProxyType,
        -- |
        port :: Maybe Int,
        -- | Proxy server IP address @port Proxy server port @type Type of the proxy
        server :: Maybe String
      }
  | -- | The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link @chat_username Username of the chat
    InternalLinkTypePublicChat
      { -- |
        chat_username :: Maybe String
      }
  | -- | The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to
    -- "This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings > Devices > Scan QR and scan the code" needs to be shown
    InternalLinkTypeQrCodeAuthentication
  | -- | The link forces restore of App Store purchases when opened. For official iOS application only
    InternalLinkTypeRestorePurchases
  | -- | The link is a link to application settings
    InternalLinkTypeSettings
  | -- | The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set @sticker_set_name Name of the sticker set
    InternalLinkTypeStickerSet
      { -- |
        sticker_set_name :: Maybe String
      }
  | -- | The link is a link to a theme. TDLib has no theme support yet @theme_name Name of the theme
    InternalLinkTypeTheme
      { -- |
        theme_name :: Maybe String
      }
  | -- | The link is a link to the theme settings section of the app
    InternalLinkTypeThemeSettings
  | -- | The link is an unknown tg: link. Call getDeepLinkInfo to process the link @link Link to be passed to getDeepLinkInfo
    InternalLinkTypeUnknownDeepLink
      { -- |
        link :: Maybe String
      }
  | -- | The link is a link to an unsupported proxy. An alert can be shown to the user
    InternalLinkTypeUnsupportedProxy
  | -- | The link is a link to a user by its phone number. Call searchUserByPhoneNumber with the given phone number to process the link @phone_number Phone number of the user
    InternalLinkTypeUserPhoneNumber
      { -- |
        phone_number :: Maybe String
      }
  | -- | The link is a link to a user by a temporary token. Call searchUserByToken with the given token to process the link @token The token
    InternalLinkTypeUserToken
      { -- |
        token :: Maybe String
      }
  | -- | The link is a link to a video chat. Call searchPublicChat with the given chat username, and then joinGroupCall with the given invite hash to process the link
    InternalLinkTypeVideoChat
      { -- | True, if the video chat is expected to be a live stream in a channel or a broadcast group
        is_live_stream :: Maybe Bool,
        -- |
        invite_hash :: Maybe String,
        -- | Username of the chat with the video chat @invite_hash If non-empty, invite hash to be used to join the video chat without being muted by administrators
        chat_username :: Maybe String
      }
  deriving (Eq)

instance Show InternalLinkType where
  show InternalLinkTypeActiveSessions =
    "InternalLinkTypeActiveSessions"
      ++ U.cc
        []
  show
    InternalLinkTypeAttachmentMenuBot
      { url = url_,
        bot_username = bot_username_,
        target_chat = target_chat_
      } =
      "InternalLinkTypeAttachmentMenuBot"
        ++ U.cc
          [ U.p "url" url_,
            U.p "bot_username" bot_username_,
            U.p "target_chat" target_chat_
          ]
  show
    InternalLinkTypeAuthenticationCode
      { code = code_
      } =
      "InternalLinkTypeAuthenticationCode"
        ++ U.cc
          [ U.p "code" code_
          ]
  show
    InternalLinkTypeBackground
      { background_name = background_name_
      } =
      "InternalLinkTypeBackground"
        ++ U.cc
          [ U.p "background_name" background_name_
          ]
  show
    InternalLinkTypeBotStart
      { autostart = autostart_,
        start_parameter = start_parameter_,
        bot_username = bot_username_
      } =
      "InternalLinkTypeBotStart"
        ++ U.cc
          [ U.p "autostart" autostart_,
            U.p "start_parameter" start_parameter_,
            U.p "bot_username" bot_username_
          ]
  show
    InternalLinkTypeBotStartInGroup
      { administrator_rights = administrator_rights_,
        start_parameter = start_parameter_,
        bot_username = bot_username_
      } =
      "InternalLinkTypeBotStartInGroup"
        ++ U.cc
          [ U.p "administrator_rights" administrator_rights_,
            U.p "start_parameter" start_parameter_,
            U.p "bot_username" bot_username_
          ]
  show
    InternalLinkTypeBotAddToChannel
      { administrator_rights = administrator_rights_,
        bot_username = bot_username_
      } =
      "InternalLinkTypeBotAddToChannel"
        ++ U.cc
          [ U.p "administrator_rights" administrator_rights_,
            U.p "bot_username" bot_username_
          ]
  show InternalLinkTypeChangePhoneNumber =
    "InternalLinkTypeChangePhoneNumber"
      ++ U.cc
        []
  show
    InternalLinkTypeChatInvite
      { invite_link = invite_link_
      } =
      "InternalLinkTypeChatInvite"
        ++ U.cc
          [ U.p "invite_link" invite_link_
          ]
  show InternalLinkTypeFilterSettings =
    "InternalLinkTypeFilterSettings"
      ++ U.cc
        []
  show
    InternalLinkTypeGame
      { game_short_name = game_short_name_,
        bot_username = bot_username_
      } =
      "InternalLinkTypeGame"
        ++ U.cc
          [ U.p "game_short_name" game_short_name_,
            U.p "bot_username" bot_username_
          ]
  show
    InternalLinkTypeInstantView
      { fallback_url = fallback_url_,
        url = url_
      } =
      "InternalLinkTypeInstantView"
        ++ U.cc
          [ U.p "fallback_url" fallback_url_,
            U.p "url" url_
          ]
  show
    InternalLinkTypeInvoice
      { invoice_name = invoice_name_
      } =
      "InternalLinkTypeInvoice"
        ++ U.cc
          [ U.p "invoice_name" invoice_name_
          ]
  show
    InternalLinkTypeLanguagePack
      { language_pack_id = language_pack_id_
      } =
      "InternalLinkTypeLanguagePack"
        ++ U.cc
          [ U.p "language_pack_id" language_pack_id_
          ]
  show InternalLinkTypeLanguageSettings =
    "InternalLinkTypeLanguageSettings"
      ++ U.cc
        []
  show
    InternalLinkTypeMessage
      { url = url_
      } =
      "InternalLinkTypeMessage"
        ++ U.cc
          [ U.p "url" url_
          ]
  show
    InternalLinkTypeMessageDraft
      { contains_link = contains_link_,
        text = text_
      } =
      "InternalLinkTypeMessageDraft"
        ++ U.cc
          [ U.p "contains_link" contains_link_,
            U.p "text" text_
          ]
  show
    InternalLinkTypePassportDataRequest
      { callback_url = callback_url_,
        nonce = nonce_,
        public_key = public_key_,
        scope = scope_,
        bot_user_id = bot_user_id_
      } =
      "InternalLinkTypePassportDataRequest"
        ++ U.cc
          [ U.p "callback_url" callback_url_,
            U.p "nonce" nonce_,
            U.p "public_key" public_key_,
            U.p "scope" scope_,
            U.p "bot_user_id" bot_user_id_
          ]
  show
    InternalLinkTypePhoneNumberConfirmation
      { phone_number = phone_number_,
        hash = hash_
      } =
      "InternalLinkTypePhoneNumberConfirmation"
        ++ U.cc
          [ U.p "phone_number" phone_number_,
            U.p "hash" hash_
          ]
  show
    InternalLinkTypePremiumFeatures
      { referrer = referrer_
      } =
      "InternalLinkTypePremiumFeatures"
        ++ U.cc
          [ U.p "referrer" referrer_
          ]
  show InternalLinkTypePrivacyAndSecuritySettings =
    "InternalLinkTypePrivacyAndSecuritySettings"
      ++ U.cc
        []
  show
    InternalLinkTypeProxy
      { _type = _type_,
        port = port_,
        server = server_
      } =
      "InternalLinkTypeProxy"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "port" port_,
            U.p "server" server_
          ]
  show
    InternalLinkTypePublicChat
      { chat_username = chat_username_
      } =
      "InternalLinkTypePublicChat"
        ++ U.cc
          [ U.p "chat_username" chat_username_
          ]
  show InternalLinkTypeQrCodeAuthentication =
    "InternalLinkTypeQrCodeAuthentication"
      ++ U.cc
        []
  show InternalLinkTypeRestorePurchases =
    "InternalLinkTypeRestorePurchases"
      ++ U.cc
        []
  show InternalLinkTypeSettings =
    "InternalLinkTypeSettings"
      ++ U.cc
        []
  show
    InternalLinkTypeStickerSet
      { sticker_set_name = sticker_set_name_
      } =
      "InternalLinkTypeStickerSet"
        ++ U.cc
          [ U.p "sticker_set_name" sticker_set_name_
          ]
  show
    InternalLinkTypeTheme
      { theme_name = theme_name_
      } =
      "InternalLinkTypeTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name_
          ]
  show InternalLinkTypeThemeSettings =
    "InternalLinkTypeThemeSettings"
      ++ U.cc
        []
  show
    InternalLinkTypeUnknownDeepLink
      { link = link_
      } =
      "InternalLinkTypeUnknownDeepLink"
        ++ U.cc
          [ U.p "link" link_
          ]
  show InternalLinkTypeUnsupportedProxy =
    "InternalLinkTypeUnsupportedProxy"
      ++ U.cc
        []
  show
    InternalLinkTypeUserPhoneNumber
      { phone_number = phone_number_
      } =
      "InternalLinkTypeUserPhoneNumber"
        ++ U.cc
          [ U.p "phone_number" phone_number_
          ]
  show
    InternalLinkTypeUserToken
      { token = token_
      } =
      "InternalLinkTypeUserToken"
        ++ U.cc
          [ U.p "token" token_
          ]
  show
    InternalLinkTypeVideoChat
      { is_live_stream = is_live_stream_,
        invite_hash = invite_hash_,
        chat_username = chat_username_
      } =
      "InternalLinkTypeVideoChat"
        ++ U.cc
          [ U.p "is_live_stream" is_live_stream_,
            U.p "invite_hash" invite_hash_,
            U.p "chat_username" chat_username_
          ]

instance T.FromJSON InternalLinkType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "internalLinkTypeActiveSessions" -> parseInternalLinkTypeActiveSessions v
      "internalLinkTypeAttachmentMenuBot" -> parseInternalLinkTypeAttachmentMenuBot v
      "internalLinkTypeAuthenticationCode" -> parseInternalLinkTypeAuthenticationCode v
      "internalLinkTypeBackground" -> parseInternalLinkTypeBackground v
      "internalLinkTypeBotStart" -> parseInternalLinkTypeBotStart v
      "internalLinkTypeBotStartInGroup" -> parseInternalLinkTypeBotStartInGroup v
      "internalLinkTypeBotAddToChannel" -> parseInternalLinkTypeBotAddToChannel v
      "internalLinkTypeChangePhoneNumber" -> parseInternalLinkTypeChangePhoneNumber v
      "internalLinkTypeChatInvite" -> parseInternalLinkTypeChatInvite v
      "internalLinkTypeFilterSettings" -> parseInternalLinkTypeFilterSettings v
      "internalLinkTypeGame" -> parseInternalLinkTypeGame v
      "internalLinkTypeInstantView" -> parseInternalLinkTypeInstantView v
      "internalLinkTypeInvoice" -> parseInternalLinkTypeInvoice v
      "internalLinkTypeLanguagePack" -> parseInternalLinkTypeLanguagePack v
      "internalLinkTypeLanguageSettings" -> parseInternalLinkTypeLanguageSettings v
      "internalLinkTypeMessage" -> parseInternalLinkTypeMessage v
      "internalLinkTypeMessageDraft" -> parseInternalLinkTypeMessageDraft v
      "internalLinkTypePassportDataRequest" -> parseInternalLinkTypePassportDataRequest v
      "internalLinkTypePhoneNumberConfirmation" -> parseInternalLinkTypePhoneNumberConfirmation v
      "internalLinkTypePremiumFeatures" -> parseInternalLinkTypePremiumFeatures v
      "internalLinkTypePrivacyAndSecuritySettings" -> parseInternalLinkTypePrivacyAndSecuritySettings v
      "internalLinkTypeProxy" -> parseInternalLinkTypeProxy v
      "internalLinkTypePublicChat" -> parseInternalLinkTypePublicChat v
      "internalLinkTypeQrCodeAuthentication" -> parseInternalLinkTypeQrCodeAuthentication v
      "internalLinkTypeRestorePurchases" -> parseInternalLinkTypeRestorePurchases v
      "internalLinkTypeSettings" -> parseInternalLinkTypeSettings v
      "internalLinkTypeStickerSet" -> parseInternalLinkTypeStickerSet v
      "internalLinkTypeTheme" -> parseInternalLinkTypeTheme v
      "internalLinkTypeThemeSettings" -> parseInternalLinkTypeThemeSettings v
      "internalLinkTypeUnknownDeepLink" -> parseInternalLinkTypeUnknownDeepLink v
      "internalLinkTypeUnsupportedProxy" -> parseInternalLinkTypeUnsupportedProxy v
      "internalLinkTypeUserPhoneNumber" -> parseInternalLinkTypeUserPhoneNumber v
      "internalLinkTypeUserToken" -> parseInternalLinkTypeUserToken v
      "internalLinkTypeVideoChat" -> parseInternalLinkTypeVideoChat v
      _ -> mempty
    where
      parseInternalLinkTypeActiveSessions :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeActiveSessions = A.withObject "InternalLinkTypeActiveSessions" $ \_ -> return InternalLinkTypeActiveSessions

      parseInternalLinkTypeAttachmentMenuBot :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeAttachmentMenuBot = A.withObject "InternalLinkTypeAttachmentMenuBot" $ \o -> do
        url_ <- o A..:? "url"
        bot_username_ <- o A..:? "bot_username"
        target_chat_ <- o A..:? "target_chat"
        return $ InternalLinkTypeAttachmentMenuBot {url = url_, bot_username = bot_username_, target_chat = target_chat_}

      parseInternalLinkTypeAuthenticationCode :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeAuthenticationCode = A.withObject "InternalLinkTypeAuthenticationCode" $ \o -> do
        code_ <- o A..:? "code"
        return $ InternalLinkTypeAuthenticationCode {code = code_}

      parseInternalLinkTypeBackground :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeBackground = A.withObject "InternalLinkTypeBackground" $ \o -> do
        background_name_ <- o A..:? "background_name"
        return $ InternalLinkTypeBackground {background_name = background_name_}

      parseInternalLinkTypeBotStart :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeBotStart = A.withObject "InternalLinkTypeBotStart" $ \o -> do
        autostart_ <- o A..:? "autostart"
        start_parameter_ <- o A..:? "start_parameter"
        bot_username_ <- o A..:? "bot_username"
        return $ InternalLinkTypeBotStart {autostart = autostart_, start_parameter = start_parameter_, bot_username = bot_username_}

      parseInternalLinkTypeBotStartInGroup :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeBotStartInGroup = A.withObject "InternalLinkTypeBotStartInGroup" $ \o -> do
        administrator_rights_ <- o A..:? "administrator_rights"
        start_parameter_ <- o A..:? "start_parameter"
        bot_username_ <- o A..:? "bot_username"
        return $ InternalLinkTypeBotStartInGroup {administrator_rights = administrator_rights_, start_parameter = start_parameter_, bot_username = bot_username_}

      parseInternalLinkTypeBotAddToChannel :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeBotAddToChannel = A.withObject "InternalLinkTypeBotAddToChannel" $ \o -> do
        administrator_rights_ <- o A..:? "administrator_rights"
        bot_username_ <- o A..:? "bot_username"
        return $ InternalLinkTypeBotAddToChannel {administrator_rights = administrator_rights_, bot_username = bot_username_}

      parseInternalLinkTypeChangePhoneNumber :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeChangePhoneNumber = A.withObject "InternalLinkTypeChangePhoneNumber" $ \_ -> return InternalLinkTypeChangePhoneNumber

      parseInternalLinkTypeChatInvite :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeChatInvite = A.withObject "InternalLinkTypeChatInvite" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        return $ InternalLinkTypeChatInvite {invite_link = invite_link_}

      parseInternalLinkTypeFilterSettings :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeFilterSettings = A.withObject "InternalLinkTypeFilterSettings" $ \_ -> return InternalLinkTypeFilterSettings

      parseInternalLinkTypeGame :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeGame = A.withObject "InternalLinkTypeGame" $ \o -> do
        game_short_name_ <- o A..:? "game_short_name"
        bot_username_ <- o A..:? "bot_username"
        return $ InternalLinkTypeGame {game_short_name = game_short_name_, bot_username = bot_username_}

      parseInternalLinkTypeInstantView :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeInstantView = A.withObject "InternalLinkTypeInstantView" $ \o -> do
        fallback_url_ <- o A..:? "fallback_url"
        url_ <- o A..:? "url"
        return $ InternalLinkTypeInstantView {fallback_url = fallback_url_, url = url_}

      parseInternalLinkTypeInvoice :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeInvoice = A.withObject "InternalLinkTypeInvoice" $ \o -> do
        invoice_name_ <- o A..:? "invoice_name"
        return $ InternalLinkTypeInvoice {invoice_name = invoice_name_}

      parseInternalLinkTypeLanguagePack :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeLanguagePack = A.withObject "InternalLinkTypeLanguagePack" $ \o -> do
        language_pack_id_ <- o A..:? "language_pack_id"
        return $ InternalLinkTypeLanguagePack {language_pack_id = language_pack_id_}

      parseInternalLinkTypeLanguageSettings :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeLanguageSettings = A.withObject "InternalLinkTypeLanguageSettings" $ \_ -> return InternalLinkTypeLanguageSettings

      parseInternalLinkTypeMessage :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeMessage = A.withObject "InternalLinkTypeMessage" $ \o -> do
        url_ <- o A..:? "url"
        return $ InternalLinkTypeMessage {url = url_}

      parseInternalLinkTypeMessageDraft :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeMessageDraft = A.withObject "InternalLinkTypeMessageDraft" $ \o -> do
        contains_link_ <- o A..:? "contains_link"
        text_ <- o A..:? "text"
        return $ InternalLinkTypeMessageDraft {contains_link = contains_link_, text = text_}

      parseInternalLinkTypePassportDataRequest :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypePassportDataRequest = A.withObject "InternalLinkTypePassportDataRequest" $ \o -> do
        callback_url_ <- o A..:? "callback_url"
        nonce_ <- o A..:? "nonce"
        public_key_ <- o A..:? "public_key"
        scope_ <- o A..:? "scope"
        bot_user_id_ <- o A..:? "bot_user_id"
        return $ InternalLinkTypePassportDataRequest {callback_url = callback_url_, nonce = nonce_, public_key = public_key_, scope = scope_, bot_user_id = bot_user_id_}

      parseInternalLinkTypePhoneNumberConfirmation :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypePhoneNumberConfirmation = A.withObject "InternalLinkTypePhoneNumberConfirmation" $ \o -> do
        phone_number_ <- o A..:? "phone_number"
        hash_ <- o A..:? "hash"
        return $ InternalLinkTypePhoneNumberConfirmation {phone_number = phone_number_, hash = hash_}

      parseInternalLinkTypePremiumFeatures :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypePremiumFeatures = A.withObject "InternalLinkTypePremiumFeatures" $ \o -> do
        referrer_ <- o A..:? "referrer"
        return $ InternalLinkTypePremiumFeatures {referrer = referrer_}

      parseInternalLinkTypePrivacyAndSecuritySettings :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypePrivacyAndSecuritySettings = A.withObject "InternalLinkTypePrivacyAndSecuritySettings" $ \_ -> return InternalLinkTypePrivacyAndSecuritySettings

      parseInternalLinkTypeProxy :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeProxy = A.withObject "InternalLinkTypeProxy" $ \o -> do
        _type_ <- o A..:? "type"
        port_ <- o A..:? "port"
        server_ <- o A..:? "server"
        return $ InternalLinkTypeProxy {_type = _type_, port = port_, server = server_}

      parseInternalLinkTypePublicChat :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypePublicChat = A.withObject "InternalLinkTypePublicChat" $ \o -> do
        chat_username_ <- o A..:? "chat_username"
        return $ InternalLinkTypePublicChat {chat_username = chat_username_}

      parseInternalLinkTypeQrCodeAuthentication :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeQrCodeAuthentication = A.withObject "InternalLinkTypeQrCodeAuthentication" $ \_ -> return InternalLinkTypeQrCodeAuthentication

      parseInternalLinkTypeRestorePurchases :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeRestorePurchases = A.withObject "InternalLinkTypeRestorePurchases" $ \_ -> return InternalLinkTypeRestorePurchases

      parseInternalLinkTypeSettings :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeSettings = A.withObject "InternalLinkTypeSettings" $ \_ -> return InternalLinkTypeSettings

      parseInternalLinkTypeStickerSet :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeStickerSet = A.withObject "InternalLinkTypeStickerSet" $ \o -> do
        sticker_set_name_ <- o A..:? "sticker_set_name"
        return $ InternalLinkTypeStickerSet {sticker_set_name = sticker_set_name_}

      parseInternalLinkTypeTheme :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeTheme = A.withObject "InternalLinkTypeTheme" $ \o -> do
        theme_name_ <- o A..:? "theme_name"
        return $ InternalLinkTypeTheme {theme_name = theme_name_}

      parseInternalLinkTypeThemeSettings :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeThemeSettings = A.withObject "InternalLinkTypeThemeSettings" $ \_ -> return InternalLinkTypeThemeSettings

      parseInternalLinkTypeUnknownDeepLink :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeUnknownDeepLink = A.withObject "InternalLinkTypeUnknownDeepLink" $ \o -> do
        link_ <- o A..:? "link"
        return $ InternalLinkTypeUnknownDeepLink {link = link_}

      parseInternalLinkTypeUnsupportedProxy :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeUnsupportedProxy = A.withObject "InternalLinkTypeUnsupportedProxy" $ \_ -> return InternalLinkTypeUnsupportedProxy

      parseInternalLinkTypeUserPhoneNumber :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeUserPhoneNumber = A.withObject "InternalLinkTypeUserPhoneNumber" $ \o -> do
        phone_number_ <- o A..:? "phone_number"
        return $ InternalLinkTypeUserPhoneNumber {phone_number = phone_number_}

      parseInternalLinkTypeUserToken :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeUserToken = A.withObject "InternalLinkTypeUserToken" $ \o -> do
        token_ <- o A..:? "token"
        return $ InternalLinkTypeUserToken {token = token_}

      parseInternalLinkTypeVideoChat :: A.Value -> T.Parser InternalLinkType
      parseInternalLinkTypeVideoChat = A.withObject "InternalLinkTypeVideoChat" $ \o -> do
        is_live_stream_ <- o A..:? "is_live_stream"
        invite_hash_ <- o A..:? "invite_hash"
        chat_username_ <- o A..:? "chat_username"
        return $ InternalLinkTypeVideoChat {is_live_stream = is_live_stream_, invite_hash = invite_hash_, chat_username = chat_username_}
  parseJSON _ = mempty

instance T.ToJSON InternalLinkType where
  toJSON InternalLinkTypeActiveSessions =
    A.object
      [ "@type" A..= T.String "internalLinkTypeActiveSessions"
      ]
  toJSON
    InternalLinkTypeAttachmentMenuBot
      { url = url_,
        bot_username = bot_username_,
        target_chat = target_chat_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeAttachmentMenuBot",
          "url" A..= url_,
          "bot_username" A..= bot_username_,
          "target_chat" A..= target_chat_
        ]
  toJSON
    InternalLinkTypeAuthenticationCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeAuthenticationCode",
          "code" A..= code_
        ]
  toJSON
    InternalLinkTypeBackground
      { background_name = background_name_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeBackground",
          "background_name" A..= background_name_
        ]
  toJSON
    InternalLinkTypeBotStart
      { autostart = autostart_,
        start_parameter = start_parameter_,
        bot_username = bot_username_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeBotStart",
          "autostart" A..= autostart_,
          "start_parameter" A..= start_parameter_,
          "bot_username" A..= bot_username_
        ]
  toJSON
    InternalLinkTypeBotStartInGroup
      { administrator_rights = administrator_rights_,
        start_parameter = start_parameter_,
        bot_username = bot_username_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeBotStartInGroup",
          "administrator_rights" A..= administrator_rights_,
          "start_parameter" A..= start_parameter_,
          "bot_username" A..= bot_username_
        ]
  toJSON
    InternalLinkTypeBotAddToChannel
      { administrator_rights = administrator_rights_,
        bot_username = bot_username_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeBotAddToChannel",
          "administrator_rights" A..= administrator_rights_,
          "bot_username" A..= bot_username_
        ]
  toJSON InternalLinkTypeChangePhoneNumber =
    A.object
      [ "@type" A..= T.String "internalLinkTypeChangePhoneNumber"
      ]
  toJSON
    InternalLinkTypeChatInvite
      { invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeChatInvite",
          "invite_link" A..= invite_link_
        ]
  toJSON InternalLinkTypeFilterSettings =
    A.object
      [ "@type" A..= T.String "internalLinkTypeFilterSettings"
      ]
  toJSON
    InternalLinkTypeGame
      { game_short_name = game_short_name_,
        bot_username = bot_username_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeGame",
          "game_short_name" A..= game_short_name_,
          "bot_username" A..= bot_username_
        ]
  toJSON
    InternalLinkTypeInstantView
      { fallback_url = fallback_url_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeInstantView",
          "fallback_url" A..= fallback_url_,
          "url" A..= url_
        ]
  toJSON
    InternalLinkTypeInvoice
      { invoice_name = invoice_name_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeInvoice",
          "invoice_name" A..= invoice_name_
        ]
  toJSON
    InternalLinkTypeLanguagePack
      { language_pack_id = language_pack_id_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeLanguagePack",
          "language_pack_id" A..= language_pack_id_
        ]
  toJSON InternalLinkTypeLanguageSettings =
    A.object
      [ "@type" A..= T.String "internalLinkTypeLanguageSettings"
      ]
  toJSON
    InternalLinkTypeMessage
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeMessage",
          "url" A..= url_
        ]
  toJSON
    InternalLinkTypeMessageDraft
      { contains_link = contains_link_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeMessageDraft",
          "contains_link" A..= contains_link_,
          "text" A..= text_
        ]
  toJSON
    InternalLinkTypePassportDataRequest
      { callback_url = callback_url_,
        nonce = nonce_,
        public_key = public_key_,
        scope = scope_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypePassportDataRequest",
          "callback_url" A..= callback_url_,
          "nonce" A..= nonce_,
          "public_key" A..= public_key_,
          "scope" A..= scope_,
          "bot_user_id" A..= bot_user_id_
        ]
  toJSON
    InternalLinkTypePhoneNumberConfirmation
      { phone_number = phone_number_,
        hash = hash_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypePhoneNumberConfirmation",
          "phone_number" A..= phone_number_,
          "hash" A..= hash_
        ]
  toJSON
    InternalLinkTypePremiumFeatures
      { referrer = referrer_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypePremiumFeatures",
          "referrer" A..= referrer_
        ]
  toJSON InternalLinkTypePrivacyAndSecuritySettings =
    A.object
      [ "@type" A..= T.String "internalLinkTypePrivacyAndSecuritySettings"
      ]
  toJSON
    InternalLinkTypeProxy
      { _type = _type_,
        port = port_,
        server = server_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeProxy",
          "type" A..= _type_,
          "port" A..= port_,
          "server" A..= server_
        ]
  toJSON
    InternalLinkTypePublicChat
      { chat_username = chat_username_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypePublicChat",
          "chat_username" A..= chat_username_
        ]
  toJSON InternalLinkTypeQrCodeAuthentication =
    A.object
      [ "@type" A..= T.String "internalLinkTypeQrCodeAuthentication"
      ]
  toJSON InternalLinkTypeRestorePurchases =
    A.object
      [ "@type" A..= T.String "internalLinkTypeRestorePurchases"
      ]
  toJSON InternalLinkTypeSettings =
    A.object
      [ "@type" A..= T.String "internalLinkTypeSettings"
      ]
  toJSON
    InternalLinkTypeStickerSet
      { sticker_set_name = sticker_set_name_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeStickerSet",
          "sticker_set_name" A..= sticker_set_name_
        ]
  toJSON
    InternalLinkTypeTheme
      { theme_name = theme_name_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeTheme",
          "theme_name" A..= theme_name_
        ]
  toJSON InternalLinkTypeThemeSettings =
    A.object
      [ "@type" A..= T.String "internalLinkTypeThemeSettings"
      ]
  toJSON
    InternalLinkTypeUnknownDeepLink
      { link = link_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeUnknownDeepLink",
          "link" A..= link_
        ]
  toJSON InternalLinkTypeUnsupportedProxy =
    A.object
      [ "@type" A..= T.String "internalLinkTypeUnsupportedProxy"
      ]
  toJSON
    InternalLinkTypeUserPhoneNumber
      { phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeUserPhoneNumber",
          "phone_number" A..= phone_number_
        ]
  toJSON
    InternalLinkTypeUserToken
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeUserToken",
          "token" A..= token_
        ]
  toJSON
    InternalLinkTypeVideoChat
      { is_live_stream = is_live_stream_,
        invite_hash = invite_hash_,
        chat_username = chat_username_
      } =
      A.object
        [ "@type" A..= T.String "internalLinkTypeVideoChat",
          "is_live_stream" A..= is_live_stream_,
          "invite_hash" A..= invite_hash_,
          "chat_username" A..= chat_username_
        ]
