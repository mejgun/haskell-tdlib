-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InternalLinkType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatAdministratorRights as ChatAdministratorRights
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.ProxyType as ProxyType

-- |
-- 
-- Describes an internal https://t.me or tg: link, which must be processed by the app in a special way
data InternalLinkType = 
 -- |
 -- 
 -- The link is a link to the active sessions section of the app. Use getActiveSessions to handle the link
 InternalLinkTypeActiveSessions |
 -- |
 -- 
 -- The link is a link to an attachment menu bot to be opened in the specified chat. Process given chat_link to open corresponding chat.
 -- 
 -- -Then call searchPublicChat with the given bot username, check that the user is a bot and can be added to attachment menu. Then use getAttachmentMenuBot to receive information about the bot.
 -- 
 -- -If the bot isn't added to attachment menu, then user needs to confirm adding the bot to attachment menu. If user confirms adding, then use toggleBotIsAddedToAttachmentMenu to add it.
 -- 
 -- -If attachment menu bots can't be used in the current chat, show an error to the user. If the bot is added to attachment menu, then use openWebApp with the given URL
 -- 
 -- __chat_link__ An internal link pointing to a chat; may be null if the current chat needs to be kept
 -- 
 -- __bot_username__ Username of the bot
 -- 
 -- __url__ URL to be passed to openWebApp
 InternalLinkTypeAttachmentMenuBot { url :: Maybe String, bot_username :: Maybe String, chat_link :: Maybe InternalLinkType }  |
 -- |
 -- 
 -- The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode 
 -- 
 -- __code__ The authentication code
 InternalLinkTypeAuthenticationCode { code :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a background. Call searchBackground with the given background name to process the link 
 -- 
 -- __background_name__ Name of the background
 InternalLinkTypeBackground { background_name :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot,
 -- 
 -- -and then call sendBotStartMessage with the given start parameter after the button is pressed
 -- 
 -- __bot_username__ Username of the bot
 -- 
 -- __start_parameter__ The parameter to be passed to sendBotStartMessage
 InternalLinkTypeBotStart { start_parameter :: Maybe String, bot_username :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a Telegram bot, which is supposed to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups,
 -- 
 -- -ask the current user to select a basic group or a supergroup chat to add the bot to, taking into account that bots can be added to a public supergroup only by administrators of the supergroup.
 -- 
 -- -If administrator rights are provided by the link, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,
 -- 
 -- -check that the current user can edit its administrator rights, combine received rights with the requested administrator rights, show confirmation box to the user,
 -- 
 -- -and call setChatMemberStatus with the chosen chat and confirmed administrator rights. Before call to setChatMemberStatus it may be required to upgrade the chosen basic group chat to a supergroup chat.
 -- 
 -- -Then if start_parameter isn't empty, call sendBotStartMessage with the given start parameter and the chosen chat, otherwise just send /start message with bot's username added to the chat.
 -- 
 -- __bot_username__ Username of the bot
 -- 
 -- __start_parameter__ The parameter to be passed to sendBotStartMessage
 -- 
 -- __administrator_rights__ Expected administrator rights for the bot; may be null
 InternalLinkTypeBotStartInGroup { administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights, start_parameter :: Maybe String, bot_username :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a Telegram bot, which is supposed to be added to a channel chat as an administrator. Call searchPublicChat with the given bot username and check that the user is a bot,
 -- 
 -- -ask the current user to select a channel chat to add the bot to as an administrator. Then call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,
 -- 
 -- -check that the current user can edit its administrator rights and combine received rights with the requested administrator rights. Then show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed rights
 -- 
 -- __bot_username__ Username of the bot
 -- 
 -- __administrator_rights__ Expected administrator rights for the bot
 InternalLinkTypeBotAddToChannel { administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights, bot_username :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to the change phone number section of the app
 InternalLinkTypeChangePhoneNumber |
 -- |
 -- 
 -- The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link 
 -- 
 -- __invite_link__ Internal representation of the invite link
 InternalLinkTypeChatInvite { invite_link :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to the filter settings section of the app
 InternalLinkTypeFilterSettings |
 -- |
 -- 
 -- The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot, ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame
 -- 
 -- __bot_username__ Username of the bot that owns the game
 -- 
 -- __game_short_name__ Short name of the game
 InternalLinkTypeGame { game_short_name :: Maybe String, bot_username :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link 
 -- 
 -- __language_pack_id__ Language pack identifier
 InternalLinkTypeLanguagePack { language_pack_id :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to the language settings section of the app
 InternalLinkTypeLanguageSettings |
 -- |
 -- 
 -- The link is a link to a Telegram message. Call getMessageLinkInfo with the given URL to process the link 
 -- 
 -- __url__ URL to be passed to getMessageLinkInfo
 InternalLinkTypeMessage { url :: Maybe String }  |
 -- |
 -- 
 -- The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field
 -- 
 -- __text__ Message draft text
 -- 
 -- __contains_link__ True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
 InternalLinkTypeMessageDraft { contains_link :: Maybe Bool, text :: Maybe FormattedText.FormattedText }  |
 -- |
 -- 
 -- The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the app, otherwise ignore it
 -- 
 -- __bot_user_id__ User identifier of the service's bot
 -- 
 -- __scope__ Telegram Passport element types requested by the service
 -- 
 -- __public_key__ Service's public key
 -- 
 -- __nonce__ Unique request identifier provided by the service
 -- 
 -- __callback_url__ An HTTP URL to open once the request is finished or canceled with the parameter tg_passport=success or tg_passport=cancel respectively. If empty, then the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel needs to be opened instead
 InternalLinkTypePassportDataRequest { callback_url :: Maybe String, nonce :: Maybe String, public_key :: Maybe String, scope :: Maybe String, bot_user_id :: Maybe Int }  |
 -- |
 -- 
 -- The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberConfirmationCode with the given hash and phone number to process the link
 -- 
 -- __hash__ Hash value from the link
 -- 
 -- __phone_number__ Phone number value from the link
 InternalLinkTypePhoneNumberConfirmation { phone_number :: Maybe String, hash :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to the privacy and security settings section of the app
 InternalLinkTypePrivacyAndSecuritySettings |
 -- |
 -- 
 -- The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy
 -- 
 -- __server__ Proxy server IP address
 -- 
 -- __port__ Proxy server port
 -- 
 -- __type__ Type of the proxy
 InternalLinkTypeProxy { _type :: Maybe ProxyType.ProxyType, port :: Maybe Int, server :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link 
 -- 
 -- __chat_username__ Username of the chat
 InternalLinkTypePublicChat { chat_username :: Maybe String }  |
 -- |
 -- 
 -- The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to
 -- 
 -- -"This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings > Devices > Scan QR and scan the code" needs to be shown
 InternalLinkTypeQrCodeAuthentication |
 -- |
 -- 
 -- The link is a link to app settings
 InternalLinkTypeSettings |
 -- |
 -- 
 -- The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set 
 -- 
 -- __sticker_set_name__ Name of the sticker set
 InternalLinkTypeStickerSet { sticker_set_name :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a theme. TDLib has no theme support yet 
 -- 
 -- __theme_name__ Name of the theme
 InternalLinkTypeTheme { theme_name :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to the theme settings section of the app
 InternalLinkTypeThemeSettings |
 -- |
 -- 
 -- The link is an unknown tg: link. Call getDeepLinkInfo to process the link 
 -- 
 -- __link__ Link to be passed to getDeepLinkInfo
 InternalLinkTypeUnknownDeepLink { link :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to an unsupported proxy. An alert can be shown to the user
 InternalLinkTypeUnsupportedProxy |
 -- |
 -- 
 -- The link is a link to a user by its phone number. Call searchUserByPhoneNumber with the given phone number to process the link 
 -- 
 -- __phone_number__ Phone number of the user
 InternalLinkTypeUserPhoneNumber { phone_number :: Maybe String }  |
 -- |
 -- 
 -- The link is a link to a video chat. Call searchPublicChat with the given chat username, and then joinGroupCall with the given invite hash to process the link
 -- 
 -- __chat_username__ Username of the chat with the video chat
 -- 
 -- __invite_hash__ If non-empty, invite hash to be used to join the video chat without being muted by administrators
 -- 
 -- __is_live_stream__ True, if the video chat is expected to be a live stream in a channel or a broadcast group
 InternalLinkTypeVideoChat { is_live_stream :: Maybe Bool, invite_hash :: Maybe String, chat_username :: Maybe String }  deriving (Eq)

instance Show InternalLinkType where
 show InternalLinkTypeActiveSessions {  } =
  "InternalLinkTypeActiveSessions" ++ cc [ ]

 show InternalLinkTypeAttachmentMenuBot { url=url, bot_username=bot_username, chat_link=chat_link } =
  "InternalLinkTypeAttachmentMenuBot" ++ cc [p "url" url, p "bot_username" bot_username, p "chat_link" chat_link ]

 show InternalLinkTypeAuthenticationCode { code=code } =
  "InternalLinkTypeAuthenticationCode" ++ cc [p "code" code ]

 show InternalLinkTypeBackground { background_name=background_name } =
  "InternalLinkTypeBackground" ++ cc [p "background_name" background_name ]

 show InternalLinkTypeBotStart { start_parameter=start_parameter, bot_username=bot_username } =
  "InternalLinkTypeBotStart" ++ cc [p "start_parameter" start_parameter, p "bot_username" bot_username ]

 show InternalLinkTypeBotStartInGroup { administrator_rights=administrator_rights, start_parameter=start_parameter, bot_username=bot_username } =
  "InternalLinkTypeBotStartInGroup" ++ cc [p "administrator_rights" administrator_rights, p "start_parameter" start_parameter, p "bot_username" bot_username ]

 show InternalLinkTypeBotAddToChannel { administrator_rights=administrator_rights, bot_username=bot_username } =
  "InternalLinkTypeBotAddToChannel" ++ cc [p "administrator_rights" administrator_rights, p "bot_username" bot_username ]

 show InternalLinkTypeChangePhoneNumber {  } =
  "InternalLinkTypeChangePhoneNumber" ++ cc [ ]

 show InternalLinkTypeChatInvite { invite_link=invite_link } =
  "InternalLinkTypeChatInvite" ++ cc [p "invite_link" invite_link ]

 show InternalLinkTypeFilterSettings {  } =
  "InternalLinkTypeFilterSettings" ++ cc [ ]

 show InternalLinkTypeGame { game_short_name=game_short_name, bot_username=bot_username } =
  "InternalLinkTypeGame" ++ cc [p "game_short_name" game_short_name, p "bot_username" bot_username ]

 show InternalLinkTypeLanguagePack { language_pack_id=language_pack_id } =
  "InternalLinkTypeLanguagePack" ++ cc [p "language_pack_id" language_pack_id ]

 show InternalLinkTypeLanguageSettings {  } =
  "InternalLinkTypeLanguageSettings" ++ cc [ ]

 show InternalLinkTypeMessage { url=url } =
  "InternalLinkTypeMessage" ++ cc [p "url" url ]

 show InternalLinkTypeMessageDraft { contains_link=contains_link, text=text } =
  "InternalLinkTypeMessageDraft" ++ cc [p "contains_link" contains_link, p "text" text ]

 show InternalLinkTypePassportDataRequest { callback_url=callback_url, nonce=nonce, public_key=public_key, scope=scope, bot_user_id=bot_user_id } =
  "InternalLinkTypePassportDataRequest" ++ cc [p "callback_url" callback_url, p "nonce" nonce, p "public_key" public_key, p "scope" scope, p "bot_user_id" bot_user_id ]

 show InternalLinkTypePhoneNumberConfirmation { phone_number=phone_number, hash=hash } =
  "InternalLinkTypePhoneNumberConfirmation" ++ cc [p "phone_number" phone_number, p "hash" hash ]

 show InternalLinkTypePrivacyAndSecuritySettings {  } =
  "InternalLinkTypePrivacyAndSecuritySettings" ++ cc [ ]

 show InternalLinkTypeProxy { _type=_type, port=port, server=server } =
  "InternalLinkTypeProxy" ++ cc [p "_type" _type, p "port" port, p "server" server ]

 show InternalLinkTypePublicChat { chat_username=chat_username } =
  "InternalLinkTypePublicChat" ++ cc [p "chat_username" chat_username ]

 show InternalLinkTypeQrCodeAuthentication {  } =
  "InternalLinkTypeQrCodeAuthentication" ++ cc [ ]

 show InternalLinkTypeSettings {  } =
  "InternalLinkTypeSettings" ++ cc [ ]

 show InternalLinkTypeStickerSet { sticker_set_name=sticker_set_name } =
  "InternalLinkTypeStickerSet" ++ cc [p "sticker_set_name" sticker_set_name ]

 show InternalLinkTypeTheme { theme_name=theme_name } =
  "InternalLinkTypeTheme" ++ cc [p "theme_name" theme_name ]

 show InternalLinkTypeThemeSettings {  } =
  "InternalLinkTypeThemeSettings" ++ cc [ ]

 show InternalLinkTypeUnknownDeepLink { link=link } =
  "InternalLinkTypeUnknownDeepLink" ++ cc [p "link" link ]

 show InternalLinkTypeUnsupportedProxy {  } =
  "InternalLinkTypeUnsupportedProxy" ++ cc [ ]

 show InternalLinkTypeUserPhoneNumber { phone_number=phone_number } =
  "InternalLinkTypeUserPhoneNumber" ++ cc [p "phone_number" phone_number ]

 show InternalLinkTypeVideoChat { is_live_stream=is_live_stream, invite_hash=invite_hash, chat_username=chat_username } =
  "InternalLinkTypeVideoChat" ++ cc [p "is_live_stream" is_live_stream, p "invite_hash" invite_hash, p "chat_username" chat_username ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InternalLinkType where
 toJSON InternalLinkTypeActiveSessions {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeActiveSessions" ]

 toJSON InternalLinkTypeAttachmentMenuBot { url = url, bot_username = bot_username, chat_link = chat_link } =
  A.object [ "@type" A..= T.String "internalLinkTypeAttachmentMenuBot", "url" A..= url, "bot_username" A..= bot_username, "chat_link" A..= chat_link ]

 toJSON InternalLinkTypeAuthenticationCode { code = code } =
  A.object [ "@type" A..= T.String "internalLinkTypeAuthenticationCode", "code" A..= code ]

 toJSON InternalLinkTypeBackground { background_name = background_name } =
  A.object [ "@type" A..= T.String "internalLinkTypeBackground", "background_name" A..= background_name ]

 toJSON InternalLinkTypeBotStart { start_parameter = start_parameter, bot_username = bot_username } =
  A.object [ "@type" A..= T.String "internalLinkTypeBotStart", "start_parameter" A..= start_parameter, "bot_username" A..= bot_username ]

 toJSON InternalLinkTypeBotStartInGroup { administrator_rights = administrator_rights, start_parameter = start_parameter, bot_username = bot_username } =
  A.object [ "@type" A..= T.String "internalLinkTypeBotStartInGroup", "administrator_rights" A..= administrator_rights, "start_parameter" A..= start_parameter, "bot_username" A..= bot_username ]

 toJSON InternalLinkTypeBotAddToChannel { administrator_rights = administrator_rights, bot_username = bot_username } =
  A.object [ "@type" A..= T.String "internalLinkTypeBotAddToChannel", "administrator_rights" A..= administrator_rights, "bot_username" A..= bot_username ]

 toJSON InternalLinkTypeChangePhoneNumber {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeChangePhoneNumber" ]

 toJSON InternalLinkTypeChatInvite { invite_link = invite_link } =
  A.object [ "@type" A..= T.String "internalLinkTypeChatInvite", "invite_link" A..= invite_link ]

 toJSON InternalLinkTypeFilterSettings {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeFilterSettings" ]

 toJSON InternalLinkTypeGame { game_short_name = game_short_name, bot_username = bot_username } =
  A.object [ "@type" A..= T.String "internalLinkTypeGame", "game_short_name" A..= game_short_name, "bot_username" A..= bot_username ]

 toJSON InternalLinkTypeLanguagePack { language_pack_id = language_pack_id } =
  A.object [ "@type" A..= T.String "internalLinkTypeLanguagePack", "language_pack_id" A..= language_pack_id ]

 toJSON InternalLinkTypeLanguageSettings {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeLanguageSettings" ]

 toJSON InternalLinkTypeMessage { url = url } =
  A.object [ "@type" A..= T.String "internalLinkTypeMessage", "url" A..= url ]

 toJSON InternalLinkTypeMessageDraft { contains_link = contains_link, text = text } =
  A.object [ "@type" A..= T.String "internalLinkTypeMessageDraft", "contains_link" A..= contains_link, "text" A..= text ]

 toJSON InternalLinkTypePassportDataRequest { callback_url = callback_url, nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "internalLinkTypePassportDataRequest", "callback_url" A..= callback_url, "nonce" A..= nonce, "public_key" A..= public_key, "scope" A..= scope, "bot_user_id" A..= bot_user_id ]

 toJSON InternalLinkTypePhoneNumberConfirmation { phone_number = phone_number, hash = hash } =
  A.object [ "@type" A..= T.String "internalLinkTypePhoneNumberConfirmation", "phone_number" A..= phone_number, "hash" A..= hash ]

 toJSON InternalLinkTypePrivacyAndSecuritySettings {  } =
  A.object [ "@type" A..= T.String "internalLinkTypePrivacyAndSecuritySettings" ]

 toJSON InternalLinkTypeProxy { _type = _type, port = port, server = server } =
  A.object [ "@type" A..= T.String "internalLinkTypeProxy", "type" A..= _type, "port" A..= port, "server" A..= server ]

 toJSON InternalLinkTypePublicChat { chat_username = chat_username } =
  A.object [ "@type" A..= T.String "internalLinkTypePublicChat", "chat_username" A..= chat_username ]

 toJSON InternalLinkTypeQrCodeAuthentication {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeQrCodeAuthentication" ]

 toJSON InternalLinkTypeSettings {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeSettings" ]

 toJSON InternalLinkTypeStickerSet { sticker_set_name = sticker_set_name } =
  A.object [ "@type" A..= T.String "internalLinkTypeStickerSet", "sticker_set_name" A..= sticker_set_name ]

 toJSON InternalLinkTypeTheme { theme_name = theme_name } =
  A.object [ "@type" A..= T.String "internalLinkTypeTheme", "theme_name" A..= theme_name ]

 toJSON InternalLinkTypeThemeSettings {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeThemeSettings" ]

 toJSON InternalLinkTypeUnknownDeepLink { link = link } =
  A.object [ "@type" A..= T.String "internalLinkTypeUnknownDeepLink", "link" A..= link ]

 toJSON InternalLinkTypeUnsupportedProxy {  } =
  A.object [ "@type" A..= T.String "internalLinkTypeUnsupportedProxy" ]

 toJSON InternalLinkTypeUserPhoneNumber { phone_number = phone_number } =
  A.object [ "@type" A..= T.String "internalLinkTypeUserPhoneNumber", "phone_number" A..= phone_number ]

 toJSON InternalLinkTypeVideoChat { is_live_stream = is_live_stream, invite_hash = invite_hash, chat_username = chat_username } =
  A.object [ "@type" A..= T.String "internalLinkTypeVideoChat", "is_live_stream" A..= is_live_stream, "invite_hash" A..= invite_hash, "chat_username" A..= chat_username ]

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
   "internalLinkTypeLanguagePack" -> parseInternalLinkTypeLanguagePack v
   "internalLinkTypeLanguageSettings" -> parseInternalLinkTypeLanguageSettings v
   "internalLinkTypeMessage" -> parseInternalLinkTypeMessage v
   "internalLinkTypeMessageDraft" -> parseInternalLinkTypeMessageDraft v
   "internalLinkTypePassportDataRequest" -> parseInternalLinkTypePassportDataRequest v
   "internalLinkTypePhoneNumberConfirmation" -> parseInternalLinkTypePhoneNumberConfirmation v
   "internalLinkTypePrivacyAndSecuritySettings" -> parseInternalLinkTypePrivacyAndSecuritySettings v
   "internalLinkTypeProxy" -> parseInternalLinkTypeProxy v
   "internalLinkTypePublicChat" -> parseInternalLinkTypePublicChat v
   "internalLinkTypeQrCodeAuthentication" -> parseInternalLinkTypeQrCodeAuthentication v
   "internalLinkTypeSettings" -> parseInternalLinkTypeSettings v
   "internalLinkTypeStickerSet" -> parseInternalLinkTypeStickerSet v
   "internalLinkTypeTheme" -> parseInternalLinkTypeTheme v
   "internalLinkTypeThemeSettings" -> parseInternalLinkTypeThemeSettings v
   "internalLinkTypeUnknownDeepLink" -> parseInternalLinkTypeUnknownDeepLink v
   "internalLinkTypeUnsupportedProxy" -> parseInternalLinkTypeUnsupportedProxy v
   "internalLinkTypeUserPhoneNumber" -> parseInternalLinkTypeUserPhoneNumber v
   "internalLinkTypeVideoChat" -> parseInternalLinkTypeVideoChat v
   _ -> mempty
  where
   parseInternalLinkTypeActiveSessions :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeActiveSessions = A.withObject "InternalLinkTypeActiveSessions" $ \o -> do
    return $ InternalLinkTypeActiveSessions {  }

   parseInternalLinkTypeAttachmentMenuBot :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeAttachmentMenuBot = A.withObject "InternalLinkTypeAttachmentMenuBot" $ \o -> do
    url <- o A..:? "url"
    bot_username <- o A..:? "bot_username"
    chat_link <- o A..:? "chat_link"
    return $ InternalLinkTypeAttachmentMenuBot { url = url, bot_username = bot_username, chat_link = chat_link }

   parseInternalLinkTypeAuthenticationCode :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeAuthenticationCode = A.withObject "InternalLinkTypeAuthenticationCode" $ \o -> do
    code <- o A..:? "code"
    return $ InternalLinkTypeAuthenticationCode { code = code }

   parseInternalLinkTypeBackground :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeBackground = A.withObject "InternalLinkTypeBackground" $ \o -> do
    background_name <- o A..:? "background_name"
    return $ InternalLinkTypeBackground { background_name = background_name }

   parseInternalLinkTypeBotStart :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeBotStart = A.withObject "InternalLinkTypeBotStart" $ \o -> do
    start_parameter <- o A..:? "start_parameter"
    bot_username <- o A..:? "bot_username"
    return $ InternalLinkTypeBotStart { start_parameter = start_parameter, bot_username = bot_username }

   parseInternalLinkTypeBotStartInGroup :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeBotStartInGroup = A.withObject "InternalLinkTypeBotStartInGroup" $ \o -> do
    administrator_rights <- o A..:? "administrator_rights"
    start_parameter <- o A..:? "start_parameter"
    bot_username <- o A..:? "bot_username"
    return $ InternalLinkTypeBotStartInGroup { administrator_rights = administrator_rights, start_parameter = start_parameter, bot_username = bot_username }

   parseInternalLinkTypeBotAddToChannel :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeBotAddToChannel = A.withObject "InternalLinkTypeBotAddToChannel" $ \o -> do
    administrator_rights <- o A..:? "administrator_rights"
    bot_username <- o A..:? "bot_username"
    return $ InternalLinkTypeBotAddToChannel { administrator_rights = administrator_rights, bot_username = bot_username }

   parseInternalLinkTypeChangePhoneNumber :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeChangePhoneNumber = A.withObject "InternalLinkTypeChangePhoneNumber" $ \o -> do
    return $ InternalLinkTypeChangePhoneNumber {  }

   parseInternalLinkTypeChatInvite :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeChatInvite = A.withObject "InternalLinkTypeChatInvite" $ \o -> do
    invite_link <- o A..:? "invite_link"
    return $ InternalLinkTypeChatInvite { invite_link = invite_link }

   parseInternalLinkTypeFilterSettings :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeFilterSettings = A.withObject "InternalLinkTypeFilterSettings" $ \o -> do
    return $ InternalLinkTypeFilterSettings {  }

   parseInternalLinkTypeGame :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeGame = A.withObject "InternalLinkTypeGame" $ \o -> do
    game_short_name <- o A..:? "game_short_name"
    bot_username <- o A..:? "bot_username"
    return $ InternalLinkTypeGame { game_short_name = game_short_name, bot_username = bot_username }

   parseInternalLinkTypeLanguagePack :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeLanguagePack = A.withObject "InternalLinkTypeLanguagePack" $ \o -> do
    language_pack_id <- o A..:? "language_pack_id"
    return $ InternalLinkTypeLanguagePack { language_pack_id = language_pack_id }

   parseInternalLinkTypeLanguageSettings :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeLanguageSettings = A.withObject "InternalLinkTypeLanguageSettings" $ \o -> do
    return $ InternalLinkTypeLanguageSettings {  }

   parseInternalLinkTypeMessage :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeMessage = A.withObject "InternalLinkTypeMessage" $ \o -> do
    url <- o A..:? "url"
    return $ InternalLinkTypeMessage { url = url }

   parseInternalLinkTypeMessageDraft :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeMessageDraft = A.withObject "InternalLinkTypeMessageDraft" $ \o -> do
    contains_link <- o A..:? "contains_link"
    text <- o A..:? "text"
    return $ InternalLinkTypeMessageDraft { contains_link = contains_link, text = text }

   parseInternalLinkTypePassportDataRequest :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypePassportDataRequest = A.withObject "InternalLinkTypePassportDataRequest" $ \o -> do
    callback_url <- o A..:? "callback_url"
    nonce <- o A..:? "nonce"
    public_key <- o A..:? "public_key"
    scope <- o A..:? "scope"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InternalLinkTypePassportDataRequest { callback_url = callback_url, nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id }

   parseInternalLinkTypePhoneNumberConfirmation :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypePhoneNumberConfirmation = A.withObject "InternalLinkTypePhoneNumberConfirmation" $ \o -> do
    phone_number <- o A..:? "phone_number"
    hash <- o A..:? "hash"
    return $ InternalLinkTypePhoneNumberConfirmation { phone_number = phone_number, hash = hash }

   parseInternalLinkTypePrivacyAndSecuritySettings :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypePrivacyAndSecuritySettings = A.withObject "InternalLinkTypePrivacyAndSecuritySettings" $ \o -> do
    return $ InternalLinkTypePrivacyAndSecuritySettings {  }

   parseInternalLinkTypeProxy :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeProxy = A.withObject "InternalLinkTypeProxy" $ \o -> do
    _type <- o A..:? "type"
    port <- mconcat [ o A..:? "port", readMaybe <$> (o A..: "port" :: T.Parser String)] :: T.Parser (Maybe Int)
    server <- o A..:? "server"
    return $ InternalLinkTypeProxy { _type = _type, port = port, server = server }

   parseInternalLinkTypePublicChat :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypePublicChat = A.withObject "InternalLinkTypePublicChat" $ \o -> do
    chat_username <- o A..:? "chat_username"
    return $ InternalLinkTypePublicChat { chat_username = chat_username }

   parseInternalLinkTypeQrCodeAuthentication :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeQrCodeAuthentication = A.withObject "InternalLinkTypeQrCodeAuthentication" $ \o -> do
    return $ InternalLinkTypeQrCodeAuthentication {  }

   parseInternalLinkTypeSettings :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeSettings = A.withObject "InternalLinkTypeSettings" $ \o -> do
    return $ InternalLinkTypeSettings {  }

   parseInternalLinkTypeStickerSet :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeStickerSet = A.withObject "InternalLinkTypeStickerSet" $ \o -> do
    sticker_set_name <- o A..:? "sticker_set_name"
    return $ InternalLinkTypeStickerSet { sticker_set_name = sticker_set_name }

   parseInternalLinkTypeTheme :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeTheme = A.withObject "InternalLinkTypeTheme" $ \o -> do
    theme_name <- o A..:? "theme_name"
    return $ InternalLinkTypeTheme { theme_name = theme_name }

   parseInternalLinkTypeThemeSettings :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeThemeSettings = A.withObject "InternalLinkTypeThemeSettings" $ \o -> do
    return $ InternalLinkTypeThemeSettings {  }

   parseInternalLinkTypeUnknownDeepLink :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeUnknownDeepLink = A.withObject "InternalLinkTypeUnknownDeepLink" $ \o -> do
    link <- o A..:? "link"
    return $ InternalLinkTypeUnknownDeepLink { link = link }

   parseInternalLinkTypeUnsupportedProxy :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeUnsupportedProxy = A.withObject "InternalLinkTypeUnsupportedProxy" $ \o -> do
    return $ InternalLinkTypeUnsupportedProxy {  }

   parseInternalLinkTypeUserPhoneNumber :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeUserPhoneNumber = A.withObject "InternalLinkTypeUserPhoneNumber" $ \o -> do
    phone_number <- o A..:? "phone_number"
    return $ InternalLinkTypeUserPhoneNumber { phone_number = phone_number }

   parseInternalLinkTypeVideoChat :: A.Value -> T.Parser InternalLinkType
   parseInternalLinkTypeVideoChat = A.withObject "InternalLinkTypeVideoChat" $ \o -> do
    is_live_stream <- o A..:? "is_live_stream"
    invite_hash <- o A..:? "invite_hash"
    chat_username <- o A..:? "chat_username"
    return $ InternalLinkTypeVideoChat { is_live_stream = is_live_stream, invite_hash = invite_hash, chat_username = chat_username }
 parseJSON _ = mempty
