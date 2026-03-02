module TD.Data.InternalLinkType
  (InternalLinkType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import {-# SOURCE #-} qualified TD.Data.TargetChat as TargetChat
import qualified Data.Text as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified TD.Data.WebAppOpenMode as WebAppOpenMode
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.StoryContentType as StoryContentType
import qualified TD.Data.Proxy as Proxy
import qualified TD.Data.SettingsSection as SettingsSection

-- | Describes an internal https://t.me or tg: link, which must be processed by the application in a special way
data InternalLinkType
  = InternalLinkTypeAttachmentMenuBot -- ^ The link is a link to an attachment menu bot to be opened in the specified or a chosen chat. Process given target_chat to open the chat. Then, call searchPublicChat with the given bot username, check that the user is a bot and can be added to attachment menu. Then, use getAttachmentMenuBot to receive information about the bot. If the bot isn't added to attachment menu, then show a disclaimer about Mini Apps being third-party applications, ask the user to accept their Terms of service and confirm adding the bot to side and attachment menu. If the user accept the terms and confirms adding, then use toggleBotIsAddedToAttachmentMenu to add the bot. If the attachment menu bot can't be used in the opened chat, show an error to the user. If the bot is added to attachment menu and can be used in the chat, then use openWebApp with the given URL
    { target_chat  :: Maybe TargetChat.TargetChat -- ^ Target chat to be opened
    , bot_username :: Maybe T.Text                -- ^ Username of the bot
    , url          :: Maybe T.Text                -- ^ URL to be passed to openWebApp
    }
  | InternalLinkTypeAuthenticationCode -- ^ The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode
    { code :: Maybe T.Text -- ^ The authentication code
    }
  | InternalLinkTypeBackground -- ^ The link is a link to a background. Call searchBackground with the given background name to process the link. If background is found and the user wants to apply it, then call setDefaultBackground
    { background_name :: Maybe T.Text -- ^ Name of the background
    }
  | InternalLinkTypeBotAddToChannel -- ^ The link is a link to a Telegram bot, which is expected to be added to a channel chat as an administrator. Call searchPublicChat with the given bot username and check that the user is a bot, ask the current user to select a channel chat to add the bot to as an administrator. Then, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator, check that the current user can edit its administrator rights and combine received rights with the requested administrator rights. Then, show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed rights
    { bot_username         :: Maybe T.Text                                          -- ^ Username of the bot
    , administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Expected administrator rights for the bot
    }
  | InternalLinkTypeBotStart -- ^ The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot, and then call sendBotStartMessage with the given start parameter after the button is pressed
    { bot_username    :: Maybe T.Text -- ^ Username of the bot
    , start_parameter :: Maybe T.Text -- ^ The parameter to be passed to sendBotStartMessage
    , autostart       :: Maybe Bool   -- ^ True, if sendBotStartMessage must be called automatically without showing the START button
    }
  | InternalLinkTypeBotStartInGroup -- ^ The link is a link to a Telegram bot, which is expected to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups, ask the current user to select a basic group or a supergroup chat to add the bot to, taking into account that bots can be added to a public supergroup only by administrators of the supergroup. If administrator rights are provided by the link, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator, check that the current user can edit its administrator rights, combine received rights with the requested administrator rights, show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed administrator rights. Before call to setChatMemberStatus it may be required to upgrade the chosen basic group chat to a supergroup chat. Then, if start_parameter isn't empty, call sendBotStartMessage with the given start parameter and the chosen chat; otherwise, just send /start message with bot's username added to the chat
    { bot_username         :: Maybe T.Text                                          -- ^ Username of the bot
    , start_parameter      :: Maybe T.Text                                          -- ^ The parameter to be passed to sendBotStartMessage
    , administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Expected administrator rights for the bot; may be null
    }
  | InternalLinkTypeBusinessChat -- ^ The link is a link to a business chat. Use getBusinessChatLinkInfo with the provided link name to get information about the link, then open received private chat and replace chat draft with the provided text
    { link_name :: Maybe T.Text -- ^ Name of the link
    }
  | InternalLinkTypeCallsPage -- ^ The link is a link to the Call tab or page
    { section :: Maybe T.Text -- ^ Section of the page; may be one of "", "all", "missed", "edit", "show-tab", "start-call"
    }
  | InternalLinkTypeChatAffiliateProgram -- ^ The link is an affiliate program link. Call searchChatAffiliateProgram with the given username and referrer to process the link
    { username :: Maybe T.Text -- ^ Username to be passed to searchChatAffiliateProgram
    , referrer :: Maybe T.Text -- ^ Referrer to be passed to searchChatAffiliateProgram
    }
  | InternalLinkTypeChatBoost -- ^ The link is a link to boost a Telegram chat. Call getChatBoostLinkInfo with the given URL to process the link. If the chat is found, then call getChatBoostStatus and getAvailableChatBoostSlots to get the current boost status and check whether the chat can be boosted. If the user wants to boost the chat and the chat can be boosted, then call boostChat
    { url :: Maybe T.Text -- ^ URL to be passed to getChatBoostLinkInfo
    }
  | InternalLinkTypeChatFolderInvite -- ^ The link is an invite link to a chat folder. Call checkChatFolderInviteLink with the given invite link to process the link. If the link is valid and the user wants to join the chat folder, then call addChatFolderByInviteLink
    { invite_link :: Maybe T.Text -- ^ Internal representation of the invite link
    }
  | InternalLinkTypeChatInvite -- ^ The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link. If the link is valid and the user wants to join the chat, then call joinChatByInviteLink
    { invite_link :: Maybe T.Text -- ^ Internal representation of the invite link
    }
  | InternalLinkTypeChatSelection -- ^ The link is a link that allows to select some chats
  | InternalLinkTypeContactsPage -- ^ The link is a link to the Contacts tab or page
    { section :: Maybe T.Text -- ^ Section of the page; may be one of "", "search", "sort", "new", "invite", "manage"
    }
  | InternalLinkTypeDirectMessagesChat -- ^ The link is a link to a channel direct messages chat by username of the channel. Call searchPublicChat with the given chat username to process the link. If the chat is found and is channel, open the direct messages chat of the channel
    { channel_username :: Maybe T.Text -- ^ Username of the channel
    }
  | InternalLinkTypeGame -- ^ The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot, ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame
    { bot_username    :: Maybe T.Text -- ^ Username of the bot that owns the game
    , game_short_name :: Maybe T.Text -- ^ Short name of the game
    }
  | InternalLinkTypeGiftAuction -- ^ The link is a link to a gift auction. Call getGiftAuctionState with the given auction identifier to process the link
    { auction_id :: Maybe T.Text -- ^ Unique identifier of the auction
    }
  | InternalLinkTypeGiftCollection -- ^ The link is a link to a gift collection. Call searchPublicChat with the given username, then call getReceivedGifts with the received gift owner identifier and the given collection identifier, then show the collection if received
    { gift_owner_username :: Maybe T.Text -- ^ Username of the owner of the gift collection
    , collection_id       :: Maybe Int    -- ^ Gift collection identifier
    }
  | InternalLinkTypeGroupCall -- ^ The link is a link to a group call that isn't bound to a chat. Use getGroupCallParticipants to get the list of group call participants and show them on the join group call screen. Call joinGroupCall with the given invite_link to join the call
    { invite_link :: Maybe T.Text -- ^ Internal representation of the invite link
    }
  | InternalLinkTypeInstantView -- ^ The link must be opened in an Instant View. Call getWebPageInstantView with the given URL to process the link. If Instant View is found, then show it, otherwise, open the fallback URL in an external browser
    { url          :: Maybe T.Text -- ^ URL to be passed to getWebPageInstantView
    , fallback_url :: Maybe T.Text -- ^ An URL to open if getWebPageInstantView fails
    }
  | InternalLinkTypeInvoice -- ^ The link is a link to an invoice. Call getPaymentForm with the given invoice name to process the link
    { invoice_name :: Maybe T.Text -- ^ Name of the invoice
    }
  | InternalLinkTypeLanguagePack -- ^ The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link. If the language pack is found and the user wants to apply it, then call setOption for the option "language_pack_id"
    { language_pack_id :: Maybe T.Text -- ^ Language pack identifier
    }
  | InternalLinkTypeLiveStory -- ^ The link is a link to a live story. Call searchPublicChat with the given chat username, then getChatActiveStories to get active stories in the chat, then find a live story among active stories of the chat, and then joinLiveStory to join the live story
    { story_poster_username :: Maybe T.Text -- ^ Username of the poster of the story
    }
  | InternalLinkTypeMainWebApp -- ^ The link is a link to the main Web App of a bot. Call searchPublicChat with the given bot username, check that the user is a bot and has the main Web App. If the bot can be added to attachment menu, then use getAttachmentMenuBot to receive information about the bot, then if the bot isn't added to side menu, show a disclaimer about Mini Apps being third-party applications, ask the user to accept their Terms of service and confirm adding the bot to side and attachment menu, then if the user accepts the terms and confirms adding, use toggleBotIsAddedToAttachmentMenu to add the bot. Then, use getMainWebApp with the given start parameter and mode and open the returned URL as a Web App
    { bot_username    :: Maybe T.Text                        -- ^ Username of the bot
    , start_parameter :: Maybe T.Text                        -- ^ Start parameter to be passed to getMainWebApp
    , mode            :: Maybe WebAppOpenMode.WebAppOpenMode -- ^ The mode to be passed to getMainWebApp
    }
  | InternalLinkTypeMessage -- ^ The link is a link to a Telegram message or a forum topic. Call getMessageLinkInfo with the given URL to process the link, and then open received forum topic or chat and show the message there
    { url :: Maybe T.Text -- ^ URL to be passed to getMessageLinkInfo
    }
  | InternalLinkTypeMessageDraft -- ^ The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field
    { text          :: Maybe FormattedText.FormattedText -- ^ Message draft text
    , contains_link :: Maybe Bool                        -- ^ True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
    }
  | InternalLinkTypeMyProfilePage -- ^ The link is a link to the My Profile application page
    { section :: Maybe T.Text -- ^ Section of the page; may be one of "", "posts", "posts/all-stories", "posts/add-album", "gifts", "archived-posts"
    }
  | InternalLinkTypeNewChannelChat -- ^ The link is a link to the screen for creating a new channel chat
  | InternalLinkTypeNewGroupChat -- ^ The link is a link to the screen for creating a new group chat
  | InternalLinkTypeNewPrivateChat -- ^ The link is a link to the screen for creating a new private chat with a contact
  | InternalLinkTypeNewStory -- ^ The link is a link to open the story posting interface
    { content_type :: Maybe StoryContentType.StoryContentType -- ^ The type of the content of the story to post; may be null if unspecified
    }
  | InternalLinkTypeOauth -- ^ The link is an OAuth link. Call getOauthLinkInfo with the given URL to process the link if the link was received from outside of the application; otherwise, ignore it. After getOauthLinkInfo, show the user confirmation dialog and process it with checkOauthRequestMatchCode, acceptOauthRequest or declineOauthRequest
    { url :: Maybe T.Text -- ^ URL to be passed to getOauthLinkInfo
    }
  | InternalLinkTypePassportDataRequest -- ^ The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the application; otherwise, ignore it
    { bot_user_id  :: Maybe Int    -- ^ User identifier of the service's bot; the corresponding user may be unknown yet
    , scope        :: Maybe T.Text -- ^ Telegram Passport element types requested by the service
    , public_key   :: Maybe T.Text -- ^ Service's public key
    , nonce        :: Maybe T.Text -- ^ Unique request identifier provided by the service
    , callback_url :: Maybe T.Text -- ^ An HTTP URL to open once the request is finished, canceled, or failed with the parameters tg_passport=success, tg_passport=cancel, or tg_passport=error&error=... respectively. If empty, then onActivityResult method must be used to return response on Android, or the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel must be opened otherwise
    }
  | InternalLinkTypePhoneNumberConfirmation -- ^ The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberCode with the given phone number and with phoneNumberCodeTypeConfirmOwnership with the given hash to process the link. If succeeded, call checkPhoneNumberCode to check entered by the user code, or resendPhoneNumberCode to resend it
    { hash         :: Maybe T.Text -- ^ Hash value from the link
    , phone_number :: Maybe T.Text -- ^ Phone number value from the link
    }
  | InternalLinkTypePremiumFeaturesPage -- ^ The link is a link to the Premium features screen of the application from which the user can subscribe to Telegram Premium. Call getPremiumFeatures with the given referrer to process the link
    { referrer :: Maybe T.Text -- ^ Referrer specified in the link
    }
  | InternalLinkTypePremiumGiftCode -- ^ The link is a link with a Telegram Premium gift code. Call checkPremiumGiftCode with the given code to process the link. If the code is valid and the user wants to apply it, then call applyPremiumGiftCode
    { code :: Maybe T.Text -- ^ The Telegram Premium gift code
    }
  | InternalLinkTypePremiumGiftPurchase -- ^ The link is a link to the screen for gifting Telegram Premium subscriptions to friends via inputInvoiceTelegram with telegramPaymentPurposePremiumGift payments or in-store purchases
    { referrer :: Maybe T.Text -- ^ Referrer specified in the link
    }
  | InternalLinkTypeProxy -- ^ The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy
    { proxy :: Maybe Proxy.Proxy -- ^ The proxy; may be null if the proxy is unsupported, in which case an alert can be shown to the user
    }
  | InternalLinkTypePublicChat -- ^ The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link. If the chat is found, open its profile information screen or the chat itself. If draft text isn't empty and the chat is a private chat with a regular user, then put the draft text in the input field
    { chat_username :: Maybe T.Text -- ^ Username of the chat
    , draft_text    :: Maybe T.Text -- ^ Draft text for message to send in the chat
    , open_profile  :: Maybe Bool   -- ^ True, if chat profile information screen must be opened; otherwise, the chat itself must be opened
    }
  | InternalLinkTypeQrCodeAuthentication -- ^ The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to "This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings > Devices > Scan QR and scan the code" needs to be shown
  | InternalLinkTypeRestorePurchases -- ^ The link forces restore of App Store purchases when opened. For official iOS application only
  | InternalLinkTypeSavedMessages -- ^ The link is a link to the Saved Messages chat. Call createPrivateChat with getOption("my_id") and open the chat
  | InternalLinkTypeSearch -- ^ The link is a link to the global chat and messages search field
  | InternalLinkTypeSettings -- ^ The link is a link to application settings
    { _section :: Maybe SettingsSection.SettingsSection -- ^ Section of the application settings to open; may be null if none
    }
  | InternalLinkTypeStarPurchase -- ^ The link is a link to the Telegram Star purchase section of the application
    { star_count :: Maybe Int    -- ^ The number of Telegram Stars that must be owned by the user
    , purpose    :: Maybe T.Text -- ^ Purpose of Telegram Star purchase. Arbitrary string specified by the server, for example, "subs" if the Telegram Stars are required to extend channel subscriptions
    }
  | InternalLinkTypeStickerSet -- ^ The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set. If the sticker set is found and the user wants to add it, then call changeStickerSet
    { sticker_set_name    :: Maybe T.Text -- ^ Name of the sticker set
    , expect_custom_emoji :: Maybe Bool   -- ^ True, if the sticker set is expected to contain custom emoji
    }
  | InternalLinkTypeStory -- ^ The link is a link to a story. Call searchPublicChat with the given poster username, then call getStory with the received chat identifier and the given story identifier, then show the story if received
    { story_poster_username :: Maybe T.Text -- ^ Username of the poster of the story
    , story_id              :: Maybe Int    -- ^ Story identifier
    }
  | InternalLinkTypeStoryAlbum -- ^ The link is a link to an album of stories. Call searchPublicChat with the given username, then call getStoryAlbumStories with the received chat identifier and the given story album identifier, then show the story album if received
    { story_album_owner_username :: Maybe T.Text -- ^ Username of the owner of the story album
    , story_album_id             :: Maybe Int    -- ^ Story album identifier
    }
  | InternalLinkTypeTheme -- ^ The link is a link to a cloud theme. TDLib has no theme support yet
    { theme_name :: Maybe T.Text -- ^ Name of the theme
    }
  | InternalLinkTypeUnknownDeepLink -- ^ The link is an unknown tg: link. Call getDeepLinkInfo to process the link
    { link :: Maybe T.Text -- ^ Link to be passed to getDeepLinkInfo
    }
  | InternalLinkTypeUpgradedGift -- ^ The link is a link to an upgraded gift. Call getUpgradedGift with the given name to process the link
    { name :: Maybe T.Text -- ^ Name of the unique gift
    }
  | InternalLinkTypeUserPhoneNumber -- ^ The link is a link to a user by its phone number. Call searchUserByPhoneNumber with the given phone number to process the link. If the user is found, then call createPrivateChat and open user's profile information screen or the chat itself. If draft text isn't empty, then put the draft text in the input field
    { phone_number :: Maybe T.Text -- ^ Phone number of the user
    , draft_text   :: Maybe T.Text -- ^ Draft text for message to send in the chat
    , open_profile :: Maybe Bool   -- ^ True, if user's profile information screen must be opened; otherwise, the chat itself must be opened
    }
  | InternalLinkTypeUserToken -- ^ The link is a link to a user by a temporary token. Call searchUserByToken with the given token to process the link. If the user is found, then call createPrivateChat and open the chat
    { token :: Maybe T.Text -- ^ The token
    }
  | InternalLinkTypeVideoChat -- ^ The link is a link to a video chat. Call searchPublicChat with the given chat username, and then joinVideoChat with the given invite hash to process the link
    { chat_username  :: Maybe T.Text -- ^ Username of the chat with the video chat
    , invite_hash    :: Maybe T.Text -- ^ If non-empty, invite hash to be used to join the video chat without being muted by administrators
    , is_live_stream :: Maybe Bool   -- ^ True, if the video chat is expected to be a live stream in a channel or a broadcast group
    }
  | InternalLinkTypeWebApp -- ^ The link is a link to a Web App. Call searchPublicChat with the given bot username, check that the user is a bot. If the bot is restricted for the current user, then show an error message. Otherwise, call searchWebApp with the received bot and the given web_app_short_name. Process received foundWebApp by showing a confirmation dialog if needed. If the bot can be added to attachment or side menu, but isn't added yet, then show a disclaimer about Mini Apps being third-party applications instead of the dialog and ask the user to accept their Terms of service. If the user accept the terms and confirms adding, then use toggleBotIsAddedToAttachmentMenu to add the bot. Then, call getWebAppLinkUrl and open the returned URL as a Web App
    { bot_username       :: Maybe T.Text                        -- ^ Username of the bot that owns the Web App
    , web_app_short_name :: Maybe T.Text                        -- ^ Short name of the Web App
    , start_parameter    :: Maybe T.Text                        -- ^ Start parameter to be passed to getWebAppLinkUrl
    , mode               :: Maybe WebAppOpenMode.WebAppOpenMode -- ^ The mode in which the Web App must be opened
    }
  deriving (Eq, Show)

instance I.ShortShow InternalLinkType where
  shortShow InternalLinkTypeAttachmentMenuBot
    { target_chat  = target_chat_
    , bot_username = bot_username_
    , url          = url_
    }
      = "InternalLinkTypeAttachmentMenuBot"
        ++ I.cc
        [ "target_chat"  `I.p` target_chat_
        , "bot_username" `I.p` bot_username_
        , "url"          `I.p` url_
        ]
  shortShow InternalLinkTypeAuthenticationCode
    { code = code_
    }
      = "InternalLinkTypeAuthenticationCode"
        ++ I.cc
        [ "code" `I.p` code_
        ]
  shortShow InternalLinkTypeBackground
    { background_name = background_name_
    }
      = "InternalLinkTypeBackground"
        ++ I.cc
        [ "background_name" `I.p` background_name_
        ]
  shortShow InternalLinkTypeBotAddToChannel
    { bot_username         = bot_username_
    , administrator_rights = administrator_rights_
    }
      = "InternalLinkTypeBotAddToChannel"
        ++ I.cc
        [ "bot_username"         `I.p` bot_username_
        , "administrator_rights" `I.p` administrator_rights_
        ]
  shortShow InternalLinkTypeBotStart
    { bot_username    = bot_username_
    , start_parameter = start_parameter_
    , autostart       = autostart_
    }
      = "InternalLinkTypeBotStart"
        ++ I.cc
        [ "bot_username"    `I.p` bot_username_
        , "start_parameter" `I.p` start_parameter_
        , "autostart"       `I.p` autostart_
        ]
  shortShow InternalLinkTypeBotStartInGroup
    { bot_username         = bot_username_
    , start_parameter      = start_parameter_
    , administrator_rights = administrator_rights_
    }
      = "InternalLinkTypeBotStartInGroup"
        ++ I.cc
        [ "bot_username"         `I.p` bot_username_
        , "start_parameter"      `I.p` start_parameter_
        , "administrator_rights" `I.p` administrator_rights_
        ]
  shortShow InternalLinkTypeBusinessChat
    { link_name = link_name_
    }
      = "InternalLinkTypeBusinessChat"
        ++ I.cc
        [ "link_name" `I.p` link_name_
        ]
  shortShow InternalLinkTypeCallsPage
    { section = section_
    }
      = "InternalLinkTypeCallsPage"
        ++ I.cc
        [ "section" `I.p` section_
        ]
  shortShow InternalLinkTypeChatAffiliateProgram
    { username = username_
    , referrer = referrer_
    }
      = "InternalLinkTypeChatAffiliateProgram"
        ++ I.cc
        [ "username" `I.p` username_
        , "referrer" `I.p` referrer_
        ]
  shortShow InternalLinkTypeChatBoost
    { url = url_
    }
      = "InternalLinkTypeChatBoost"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InternalLinkTypeChatFolderInvite
    { invite_link = invite_link_
    }
      = "InternalLinkTypeChatFolderInvite"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        ]
  shortShow InternalLinkTypeChatInvite
    { invite_link = invite_link_
    }
      = "InternalLinkTypeChatInvite"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        ]
  shortShow InternalLinkTypeChatSelection
      = "InternalLinkTypeChatSelection"
  shortShow InternalLinkTypeContactsPage
    { section = section_
    }
      = "InternalLinkTypeContactsPage"
        ++ I.cc
        [ "section" `I.p` section_
        ]
  shortShow InternalLinkTypeDirectMessagesChat
    { channel_username = channel_username_
    }
      = "InternalLinkTypeDirectMessagesChat"
        ++ I.cc
        [ "channel_username" `I.p` channel_username_
        ]
  shortShow InternalLinkTypeGame
    { bot_username    = bot_username_
    , game_short_name = game_short_name_
    }
      = "InternalLinkTypeGame"
        ++ I.cc
        [ "bot_username"    `I.p` bot_username_
        , "game_short_name" `I.p` game_short_name_
        ]
  shortShow InternalLinkTypeGiftAuction
    { auction_id = auction_id_
    }
      = "InternalLinkTypeGiftAuction"
        ++ I.cc
        [ "auction_id" `I.p` auction_id_
        ]
  shortShow InternalLinkTypeGiftCollection
    { gift_owner_username = gift_owner_username_
    , collection_id       = collection_id_
    }
      = "InternalLinkTypeGiftCollection"
        ++ I.cc
        [ "gift_owner_username" `I.p` gift_owner_username_
        , "collection_id"       `I.p` collection_id_
        ]
  shortShow InternalLinkTypeGroupCall
    { invite_link = invite_link_
    }
      = "InternalLinkTypeGroupCall"
        ++ I.cc
        [ "invite_link" `I.p` invite_link_
        ]
  shortShow InternalLinkTypeInstantView
    { url          = url_
    , fallback_url = fallback_url_
    }
      = "InternalLinkTypeInstantView"
        ++ I.cc
        [ "url"          `I.p` url_
        , "fallback_url" `I.p` fallback_url_
        ]
  shortShow InternalLinkTypeInvoice
    { invoice_name = invoice_name_
    }
      = "InternalLinkTypeInvoice"
        ++ I.cc
        [ "invoice_name" `I.p` invoice_name_
        ]
  shortShow InternalLinkTypeLanguagePack
    { language_pack_id = language_pack_id_
    }
      = "InternalLinkTypeLanguagePack"
        ++ I.cc
        [ "language_pack_id" `I.p` language_pack_id_
        ]
  shortShow InternalLinkTypeLiveStory
    { story_poster_username = story_poster_username_
    }
      = "InternalLinkTypeLiveStory"
        ++ I.cc
        [ "story_poster_username" `I.p` story_poster_username_
        ]
  shortShow InternalLinkTypeMainWebApp
    { bot_username    = bot_username_
    , start_parameter = start_parameter_
    , mode            = mode_
    }
      = "InternalLinkTypeMainWebApp"
        ++ I.cc
        [ "bot_username"    `I.p` bot_username_
        , "start_parameter" `I.p` start_parameter_
        , "mode"            `I.p` mode_
        ]
  shortShow InternalLinkTypeMessage
    { url = url_
    }
      = "InternalLinkTypeMessage"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InternalLinkTypeMessageDraft
    { text          = text_
    , contains_link = contains_link_
    }
      = "InternalLinkTypeMessageDraft"
        ++ I.cc
        [ "text"          `I.p` text_
        , "contains_link" `I.p` contains_link_
        ]
  shortShow InternalLinkTypeMyProfilePage
    { section = section_
    }
      = "InternalLinkTypeMyProfilePage"
        ++ I.cc
        [ "section" `I.p` section_
        ]
  shortShow InternalLinkTypeNewChannelChat
      = "InternalLinkTypeNewChannelChat"
  shortShow InternalLinkTypeNewGroupChat
      = "InternalLinkTypeNewGroupChat"
  shortShow InternalLinkTypeNewPrivateChat
      = "InternalLinkTypeNewPrivateChat"
  shortShow InternalLinkTypeNewStory
    { content_type = content_type_
    }
      = "InternalLinkTypeNewStory"
        ++ I.cc
        [ "content_type" `I.p` content_type_
        ]
  shortShow InternalLinkTypeOauth
    { url = url_
    }
      = "InternalLinkTypeOauth"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InternalLinkTypePassportDataRequest
    { bot_user_id  = bot_user_id_
    , scope        = scope_
    , public_key   = public_key_
    , nonce        = nonce_
    , callback_url = callback_url_
    }
      = "InternalLinkTypePassportDataRequest"
        ++ I.cc
        [ "bot_user_id"  `I.p` bot_user_id_
        , "scope"        `I.p` scope_
        , "public_key"   `I.p` public_key_
        , "nonce"        `I.p` nonce_
        , "callback_url" `I.p` callback_url_
        ]
  shortShow InternalLinkTypePhoneNumberConfirmation
    { hash         = hash_
    , phone_number = phone_number_
    }
      = "InternalLinkTypePhoneNumberConfirmation"
        ++ I.cc
        [ "hash"         `I.p` hash_
        , "phone_number" `I.p` phone_number_
        ]
  shortShow InternalLinkTypePremiumFeaturesPage
    { referrer = referrer_
    }
      = "InternalLinkTypePremiumFeaturesPage"
        ++ I.cc
        [ "referrer" `I.p` referrer_
        ]
  shortShow InternalLinkTypePremiumGiftCode
    { code = code_
    }
      = "InternalLinkTypePremiumGiftCode"
        ++ I.cc
        [ "code" `I.p` code_
        ]
  shortShow InternalLinkTypePremiumGiftPurchase
    { referrer = referrer_
    }
      = "InternalLinkTypePremiumGiftPurchase"
        ++ I.cc
        [ "referrer" `I.p` referrer_
        ]
  shortShow InternalLinkTypeProxy
    { proxy = proxy_
    }
      = "InternalLinkTypeProxy"
        ++ I.cc
        [ "proxy" `I.p` proxy_
        ]
  shortShow InternalLinkTypePublicChat
    { chat_username = chat_username_
    , draft_text    = draft_text_
    , open_profile  = open_profile_
    }
      = "InternalLinkTypePublicChat"
        ++ I.cc
        [ "chat_username" `I.p` chat_username_
        , "draft_text"    `I.p` draft_text_
        , "open_profile"  `I.p` open_profile_
        ]
  shortShow InternalLinkTypeQrCodeAuthentication
      = "InternalLinkTypeQrCodeAuthentication"
  shortShow InternalLinkTypeRestorePurchases
      = "InternalLinkTypeRestorePurchases"
  shortShow InternalLinkTypeSavedMessages
      = "InternalLinkTypeSavedMessages"
  shortShow InternalLinkTypeSearch
      = "InternalLinkTypeSearch"
  shortShow InternalLinkTypeSettings
    { _section = _section_
    }
      = "InternalLinkTypeSettings"
        ++ I.cc
        [ "_section" `I.p` _section_
        ]
  shortShow InternalLinkTypeStarPurchase
    { star_count = star_count_
    , purpose    = purpose_
    }
      = "InternalLinkTypeStarPurchase"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        , "purpose"    `I.p` purpose_
        ]
  shortShow InternalLinkTypeStickerSet
    { sticker_set_name    = sticker_set_name_
    , expect_custom_emoji = expect_custom_emoji_
    }
      = "InternalLinkTypeStickerSet"
        ++ I.cc
        [ "sticker_set_name"    `I.p` sticker_set_name_
        , "expect_custom_emoji" `I.p` expect_custom_emoji_
        ]
  shortShow InternalLinkTypeStory
    { story_poster_username = story_poster_username_
    , story_id              = story_id_
    }
      = "InternalLinkTypeStory"
        ++ I.cc
        [ "story_poster_username" `I.p` story_poster_username_
        , "story_id"              `I.p` story_id_
        ]
  shortShow InternalLinkTypeStoryAlbum
    { story_album_owner_username = story_album_owner_username_
    , story_album_id             = story_album_id_
    }
      = "InternalLinkTypeStoryAlbum"
        ++ I.cc
        [ "story_album_owner_username" `I.p` story_album_owner_username_
        , "story_album_id"             `I.p` story_album_id_
        ]
  shortShow InternalLinkTypeTheme
    { theme_name = theme_name_
    }
      = "InternalLinkTypeTheme"
        ++ I.cc
        [ "theme_name" `I.p` theme_name_
        ]
  shortShow InternalLinkTypeUnknownDeepLink
    { link = link_
    }
      = "InternalLinkTypeUnknownDeepLink"
        ++ I.cc
        [ "link" `I.p` link_
        ]
  shortShow InternalLinkTypeUpgradedGift
    { name = name_
    }
      = "InternalLinkTypeUpgradedGift"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow InternalLinkTypeUserPhoneNumber
    { phone_number = phone_number_
    , draft_text   = draft_text_
    , open_profile = open_profile_
    }
      = "InternalLinkTypeUserPhoneNumber"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        , "draft_text"   `I.p` draft_text_
        , "open_profile" `I.p` open_profile_
        ]
  shortShow InternalLinkTypeUserToken
    { token = token_
    }
      = "InternalLinkTypeUserToken"
        ++ I.cc
        [ "token" `I.p` token_
        ]
  shortShow InternalLinkTypeVideoChat
    { chat_username  = chat_username_
    , invite_hash    = invite_hash_
    , is_live_stream = is_live_stream_
    }
      = "InternalLinkTypeVideoChat"
        ++ I.cc
        [ "chat_username"  `I.p` chat_username_
        , "invite_hash"    `I.p` invite_hash_
        , "is_live_stream" `I.p` is_live_stream_
        ]
  shortShow InternalLinkTypeWebApp
    { bot_username       = bot_username_
    , web_app_short_name = web_app_short_name_
    , start_parameter    = start_parameter_
    , mode               = mode_
    }
      = "InternalLinkTypeWebApp"
        ++ I.cc
        [ "bot_username"       `I.p` bot_username_
        , "web_app_short_name" `I.p` web_app_short_name_
        , "start_parameter"    `I.p` start_parameter_
        , "mode"               `I.p` mode_
        ]

instance AT.FromJSON InternalLinkType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "internalLinkTypeAttachmentMenuBot"       -> parseInternalLinkTypeAttachmentMenuBot v
      "internalLinkTypeAuthenticationCode"      -> parseInternalLinkTypeAuthenticationCode v
      "internalLinkTypeBackground"              -> parseInternalLinkTypeBackground v
      "internalLinkTypeBotAddToChannel"         -> parseInternalLinkTypeBotAddToChannel v
      "internalLinkTypeBotStart"                -> parseInternalLinkTypeBotStart v
      "internalLinkTypeBotStartInGroup"         -> parseInternalLinkTypeBotStartInGroup v
      "internalLinkTypeBusinessChat"            -> parseInternalLinkTypeBusinessChat v
      "internalLinkTypeCallsPage"               -> parseInternalLinkTypeCallsPage v
      "internalLinkTypeChatAffiliateProgram"    -> parseInternalLinkTypeChatAffiliateProgram v
      "internalLinkTypeChatBoost"               -> parseInternalLinkTypeChatBoost v
      "internalLinkTypeChatFolderInvite"        -> parseInternalLinkTypeChatFolderInvite v
      "internalLinkTypeChatInvite"              -> parseInternalLinkTypeChatInvite v
      "internalLinkTypeChatSelection"           -> pure InternalLinkTypeChatSelection
      "internalLinkTypeContactsPage"            -> parseInternalLinkTypeContactsPage v
      "internalLinkTypeDirectMessagesChat"      -> parseInternalLinkTypeDirectMessagesChat v
      "internalLinkTypeGame"                    -> parseInternalLinkTypeGame v
      "internalLinkTypeGiftAuction"             -> parseInternalLinkTypeGiftAuction v
      "internalLinkTypeGiftCollection"          -> parseInternalLinkTypeGiftCollection v
      "internalLinkTypeGroupCall"               -> parseInternalLinkTypeGroupCall v
      "internalLinkTypeInstantView"             -> parseInternalLinkTypeInstantView v
      "internalLinkTypeInvoice"                 -> parseInternalLinkTypeInvoice v
      "internalLinkTypeLanguagePack"            -> parseInternalLinkTypeLanguagePack v
      "internalLinkTypeLiveStory"               -> parseInternalLinkTypeLiveStory v
      "internalLinkTypeMainWebApp"              -> parseInternalLinkTypeMainWebApp v
      "internalLinkTypeMessage"                 -> parseInternalLinkTypeMessage v
      "internalLinkTypeMessageDraft"            -> parseInternalLinkTypeMessageDraft v
      "internalLinkTypeMyProfilePage"           -> parseInternalLinkTypeMyProfilePage v
      "internalLinkTypeNewChannelChat"          -> pure InternalLinkTypeNewChannelChat
      "internalLinkTypeNewGroupChat"            -> pure InternalLinkTypeNewGroupChat
      "internalLinkTypeNewPrivateChat"          -> pure InternalLinkTypeNewPrivateChat
      "internalLinkTypeNewStory"                -> parseInternalLinkTypeNewStory v
      "internalLinkTypeOauth"                   -> parseInternalLinkTypeOauth v
      "internalLinkTypePassportDataRequest"     -> parseInternalLinkTypePassportDataRequest v
      "internalLinkTypePhoneNumberConfirmation" -> parseInternalLinkTypePhoneNumberConfirmation v
      "internalLinkTypePremiumFeaturesPage"     -> parseInternalLinkTypePremiumFeaturesPage v
      "internalLinkTypePremiumGiftCode"         -> parseInternalLinkTypePremiumGiftCode v
      "internalLinkTypePremiumGiftPurchase"     -> parseInternalLinkTypePremiumGiftPurchase v
      "internalLinkTypeProxy"                   -> parseInternalLinkTypeProxy v
      "internalLinkTypePublicChat"              -> parseInternalLinkTypePublicChat v
      "internalLinkTypeQrCodeAuthentication"    -> pure InternalLinkTypeQrCodeAuthentication
      "internalLinkTypeRestorePurchases"        -> pure InternalLinkTypeRestorePurchases
      "internalLinkTypeSavedMessages"           -> pure InternalLinkTypeSavedMessages
      "internalLinkTypeSearch"                  -> pure InternalLinkTypeSearch
      "internalLinkTypeSettings"                -> parseInternalLinkTypeSettings v
      "internalLinkTypeStarPurchase"            -> parseInternalLinkTypeStarPurchase v
      "internalLinkTypeStickerSet"              -> parseInternalLinkTypeStickerSet v
      "internalLinkTypeStory"                   -> parseInternalLinkTypeStory v
      "internalLinkTypeStoryAlbum"              -> parseInternalLinkTypeStoryAlbum v
      "internalLinkTypeTheme"                   -> parseInternalLinkTypeTheme v
      "internalLinkTypeUnknownDeepLink"         -> parseInternalLinkTypeUnknownDeepLink v
      "internalLinkTypeUpgradedGift"            -> parseInternalLinkTypeUpgradedGift v
      "internalLinkTypeUserPhoneNumber"         -> parseInternalLinkTypeUserPhoneNumber v
      "internalLinkTypeUserToken"               -> parseInternalLinkTypeUserToken v
      "internalLinkTypeVideoChat"               -> parseInternalLinkTypeVideoChat v
      "internalLinkTypeWebApp"                  -> parseInternalLinkTypeWebApp v
      _                                         -> mempty
    
    where
      parseInternalLinkTypeAttachmentMenuBot :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeAttachmentMenuBot = A.withObject "InternalLinkTypeAttachmentMenuBot" $ \o -> do
        target_chat_  <- o A..:?  "target_chat"
        bot_username_ <- o A..:?  "bot_username"
        url_          <- o A..:?  "url"
        pure $ InternalLinkTypeAttachmentMenuBot
          { target_chat  = target_chat_
          , bot_username = bot_username_
          , url          = url_
          }
      parseInternalLinkTypeAuthenticationCode :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeAuthenticationCode = A.withObject "InternalLinkTypeAuthenticationCode" $ \o -> do
        code_ <- o A..:?  "code"
        pure $ InternalLinkTypeAuthenticationCode
          { code = code_
          }
      parseInternalLinkTypeBackground :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeBackground = A.withObject "InternalLinkTypeBackground" $ \o -> do
        background_name_ <- o A..:?  "background_name"
        pure $ InternalLinkTypeBackground
          { background_name = background_name_
          }
      parseInternalLinkTypeBotAddToChannel :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeBotAddToChannel = A.withObject "InternalLinkTypeBotAddToChannel" $ \o -> do
        bot_username_         <- o A..:?  "bot_username"
        administrator_rights_ <- o A..:?  "administrator_rights"
        pure $ InternalLinkTypeBotAddToChannel
          { bot_username         = bot_username_
          , administrator_rights = administrator_rights_
          }
      parseInternalLinkTypeBotStart :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeBotStart = A.withObject "InternalLinkTypeBotStart" $ \o -> do
        bot_username_    <- o A..:?  "bot_username"
        start_parameter_ <- o A..:?  "start_parameter"
        autostart_       <- o A..:?  "autostart"
        pure $ InternalLinkTypeBotStart
          { bot_username    = bot_username_
          , start_parameter = start_parameter_
          , autostart       = autostart_
          }
      parseInternalLinkTypeBotStartInGroup :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeBotStartInGroup = A.withObject "InternalLinkTypeBotStartInGroup" $ \o -> do
        bot_username_         <- o A..:?  "bot_username"
        start_parameter_      <- o A..:?  "start_parameter"
        administrator_rights_ <- o A..:?  "administrator_rights"
        pure $ InternalLinkTypeBotStartInGroup
          { bot_username         = bot_username_
          , start_parameter      = start_parameter_
          , administrator_rights = administrator_rights_
          }
      parseInternalLinkTypeBusinessChat :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeBusinessChat = A.withObject "InternalLinkTypeBusinessChat" $ \o -> do
        link_name_ <- o A..:?  "link_name"
        pure $ InternalLinkTypeBusinessChat
          { link_name = link_name_
          }
      parseInternalLinkTypeCallsPage :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeCallsPage = A.withObject "InternalLinkTypeCallsPage" $ \o -> do
        section_ <- o A..:?  "section"
        pure $ InternalLinkTypeCallsPage
          { section = section_
          }
      parseInternalLinkTypeChatAffiliateProgram :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeChatAffiliateProgram = A.withObject "InternalLinkTypeChatAffiliateProgram" $ \o -> do
        username_ <- o A..:?  "username"
        referrer_ <- o A..:?  "referrer"
        pure $ InternalLinkTypeChatAffiliateProgram
          { username = username_
          , referrer = referrer_
          }
      parseInternalLinkTypeChatBoost :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeChatBoost = A.withObject "InternalLinkTypeChatBoost" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InternalLinkTypeChatBoost
          { url = url_
          }
      parseInternalLinkTypeChatFolderInvite :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeChatFolderInvite = A.withObject "InternalLinkTypeChatFolderInvite" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        pure $ InternalLinkTypeChatFolderInvite
          { invite_link = invite_link_
          }
      parseInternalLinkTypeChatInvite :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeChatInvite = A.withObject "InternalLinkTypeChatInvite" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        pure $ InternalLinkTypeChatInvite
          { invite_link = invite_link_
          }
      parseInternalLinkTypeContactsPage :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeContactsPage = A.withObject "InternalLinkTypeContactsPage" $ \o -> do
        section_ <- o A..:?  "section"
        pure $ InternalLinkTypeContactsPage
          { section = section_
          }
      parseInternalLinkTypeDirectMessagesChat :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeDirectMessagesChat = A.withObject "InternalLinkTypeDirectMessagesChat" $ \o -> do
        channel_username_ <- o A..:?  "channel_username"
        pure $ InternalLinkTypeDirectMessagesChat
          { channel_username = channel_username_
          }
      parseInternalLinkTypeGame :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeGame = A.withObject "InternalLinkTypeGame" $ \o -> do
        bot_username_    <- o A..:?  "bot_username"
        game_short_name_ <- o A..:?  "game_short_name"
        pure $ InternalLinkTypeGame
          { bot_username    = bot_username_
          , game_short_name = game_short_name_
          }
      parseInternalLinkTypeGiftAuction :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeGiftAuction = A.withObject "InternalLinkTypeGiftAuction" $ \o -> do
        auction_id_ <- o A..:?  "auction_id"
        pure $ InternalLinkTypeGiftAuction
          { auction_id = auction_id_
          }
      parseInternalLinkTypeGiftCollection :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeGiftCollection = A.withObject "InternalLinkTypeGiftCollection" $ \o -> do
        gift_owner_username_ <- o A..:?  "gift_owner_username"
        collection_id_       <- o A..:?  "collection_id"
        pure $ InternalLinkTypeGiftCollection
          { gift_owner_username = gift_owner_username_
          , collection_id       = collection_id_
          }
      parseInternalLinkTypeGroupCall :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeGroupCall = A.withObject "InternalLinkTypeGroupCall" $ \o -> do
        invite_link_ <- o A..:?  "invite_link"
        pure $ InternalLinkTypeGroupCall
          { invite_link = invite_link_
          }
      parseInternalLinkTypeInstantView :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeInstantView = A.withObject "InternalLinkTypeInstantView" $ \o -> do
        url_          <- o A..:?  "url"
        fallback_url_ <- o A..:?  "fallback_url"
        pure $ InternalLinkTypeInstantView
          { url          = url_
          , fallback_url = fallback_url_
          }
      parseInternalLinkTypeInvoice :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeInvoice = A.withObject "InternalLinkTypeInvoice" $ \o -> do
        invoice_name_ <- o A..:?  "invoice_name"
        pure $ InternalLinkTypeInvoice
          { invoice_name = invoice_name_
          }
      parseInternalLinkTypeLanguagePack :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeLanguagePack = A.withObject "InternalLinkTypeLanguagePack" $ \o -> do
        language_pack_id_ <- o A..:?  "language_pack_id"
        pure $ InternalLinkTypeLanguagePack
          { language_pack_id = language_pack_id_
          }
      parseInternalLinkTypeLiveStory :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeLiveStory = A.withObject "InternalLinkTypeLiveStory" $ \o -> do
        story_poster_username_ <- o A..:?  "story_poster_username"
        pure $ InternalLinkTypeLiveStory
          { story_poster_username = story_poster_username_
          }
      parseInternalLinkTypeMainWebApp :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeMainWebApp = A.withObject "InternalLinkTypeMainWebApp" $ \o -> do
        bot_username_    <- o A..:?  "bot_username"
        start_parameter_ <- o A..:?  "start_parameter"
        mode_            <- o A..:?  "mode"
        pure $ InternalLinkTypeMainWebApp
          { bot_username    = bot_username_
          , start_parameter = start_parameter_
          , mode            = mode_
          }
      parseInternalLinkTypeMessage :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeMessage = A.withObject "InternalLinkTypeMessage" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InternalLinkTypeMessage
          { url = url_
          }
      parseInternalLinkTypeMessageDraft :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeMessageDraft = A.withObject "InternalLinkTypeMessageDraft" $ \o -> do
        text_          <- o A..:?  "text"
        contains_link_ <- o A..:?  "contains_link"
        pure $ InternalLinkTypeMessageDraft
          { text          = text_
          , contains_link = contains_link_
          }
      parseInternalLinkTypeMyProfilePage :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeMyProfilePage = A.withObject "InternalLinkTypeMyProfilePage" $ \o -> do
        section_ <- o A..:?  "section"
        pure $ InternalLinkTypeMyProfilePage
          { section = section_
          }
      parseInternalLinkTypeNewStory :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeNewStory = A.withObject "InternalLinkTypeNewStory" $ \o -> do
        content_type_ <- o A..:?  "content_type"
        pure $ InternalLinkTypeNewStory
          { content_type = content_type_
          }
      parseInternalLinkTypeOauth :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeOauth = A.withObject "InternalLinkTypeOauth" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InternalLinkTypeOauth
          { url = url_
          }
      parseInternalLinkTypePassportDataRequest :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypePassportDataRequest = A.withObject "InternalLinkTypePassportDataRequest" $ \o -> do
        bot_user_id_  <- o A..:?  "bot_user_id"
        scope_        <- o A..:?  "scope"
        public_key_   <- o A..:?  "public_key"
        nonce_        <- o A..:?  "nonce"
        callback_url_ <- o A..:?  "callback_url"
        pure $ InternalLinkTypePassportDataRequest
          { bot_user_id  = bot_user_id_
          , scope        = scope_
          , public_key   = public_key_
          , nonce        = nonce_
          , callback_url = callback_url_
          }
      parseInternalLinkTypePhoneNumberConfirmation :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypePhoneNumberConfirmation = A.withObject "InternalLinkTypePhoneNumberConfirmation" $ \o -> do
        hash_         <- o A..:?  "hash"
        phone_number_ <- o A..:?  "phone_number"
        pure $ InternalLinkTypePhoneNumberConfirmation
          { hash         = hash_
          , phone_number = phone_number_
          }
      parseInternalLinkTypePremiumFeaturesPage :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypePremiumFeaturesPage = A.withObject "InternalLinkTypePremiumFeaturesPage" $ \o -> do
        referrer_ <- o A..:?  "referrer"
        pure $ InternalLinkTypePremiumFeaturesPage
          { referrer = referrer_
          }
      parseInternalLinkTypePremiumGiftCode :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypePremiumGiftCode = A.withObject "InternalLinkTypePremiumGiftCode" $ \o -> do
        code_ <- o A..:?  "code"
        pure $ InternalLinkTypePremiumGiftCode
          { code = code_
          }
      parseInternalLinkTypePremiumGiftPurchase :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypePremiumGiftPurchase = A.withObject "InternalLinkTypePremiumGiftPurchase" $ \o -> do
        referrer_ <- o A..:?  "referrer"
        pure $ InternalLinkTypePremiumGiftPurchase
          { referrer = referrer_
          }
      parseInternalLinkTypeProxy :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeProxy = A.withObject "InternalLinkTypeProxy" $ \o -> do
        proxy_ <- o A..:?  "proxy"
        pure $ InternalLinkTypeProxy
          { proxy = proxy_
          }
      parseInternalLinkTypePublicChat :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypePublicChat = A.withObject "InternalLinkTypePublicChat" $ \o -> do
        chat_username_ <- o A..:?  "chat_username"
        draft_text_    <- o A..:?  "draft_text"
        open_profile_  <- o A..:?  "open_profile"
        pure $ InternalLinkTypePublicChat
          { chat_username = chat_username_
          , draft_text    = draft_text_
          , open_profile  = open_profile_
          }
      parseInternalLinkTypeSettings :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeSettings = A.withObject "InternalLinkTypeSettings" $ \o -> do
        _section_ <- o A..:?  "section"
        pure $ InternalLinkTypeSettings
          { _section = _section_
          }
      parseInternalLinkTypeStarPurchase :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeStarPurchase = A.withObject "InternalLinkTypeStarPurchase" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        purpose_    <- o A..:?  "purpose"
        pure $ InternalLinkTypeStarPurchase
          { star_count = star_count_
          , purpose    = purpose_
          }
      parseInternalLinkTypeStickerSet :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeStickerSet = A.withObject "InternalLinkTypeStickerSet" $ \o -> do
        sticker_set_name_    <- o A..:?  "sticker_set_name"
        expect_custom_emoji_ <- o A..:?  "expect_custom_emoji"
        pure $ InternalLinkTypeStickerSet
          { sticker_set_name    = sticker_set_name_
          , expect_custom_emoji = expect_custom_emoji_
          }
      parseInternalLinkTypeStory :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeStory = A.withObject "InternalLinkTypeStory" $ \o -> do
        story_poster_username_ <- o A..:?  "story_poster_username"
        story_id_              <- o A..:?  "story_id"
        pure $ InternalLinkTypeStory
          { story_poster_username = story_poster_username_
          , story_id              = story_id_
          }
      parseInternalLinkTypeStoryAlbum :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeStoryAlbum = A.withObject "InternalLinkTypeStoryAlbum" $ \o -> do
        story_album_owner_username_ <- o A..:?  "story_album_owner_username"
        story_album_id_             <- o A..:?  "story_album_id"
        pure $ InternalLinkTypeStoryAlbum
          { story_album_owner_username = story_album_owner_username_
          , story_album_id             = story_album_id_
          }
      parseInternalLinkTypeTheme :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeTheme = A.withObject "InternalLinkTypeTheme" $ \o -> do
        theme_name_ <- o A..:?  "theme_name"
        pure $ InternalLinkTypeTheme
          { theme_name = theme_name_
          }
      parseInternalLinkTypeUnknownDeepLink :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeUnknownDeepLink = A.withObject "InternalLinkTypeUnknownDeepLink" $ \o -> do
        link_ <- o A..:?  "link"
        pure $ InternalLinkTypeUnknownDeepLink
          { link = link_
          }
      parseInternalLinkTypeUpgradedGift :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeUpgradedGift = A.withObject "InternalLinkTypeUpgradedGift" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ InternalLinkTypeUpgradedGift
          { name = name_
          }
      parseInternalLinkTypeUserPhoneNumber :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeUserPhoneNumber = A.withObject "InternalLinkTypeUserPhoneNumber" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        draft_text_   <- o A..:?  "draft_text"
        open_profile_ <- o A..:?  "open_profile"
        pure $ InternalLinkTypeUserPhoneNumber
          { phone_number = phone_number_
          , draft_text   = draft_text_
          , open_profile = open_profile_
          }
      parseInternalLinkTypeUserToken :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeUserToken = A.withObject "InternalLinkTypeUserToken" $ \o -> do
        token_ <- o A..:?  "token"
        pure $ InternalLinkTypeUserToken
          { token = token_
          }
      parseInternalLinkTypeVideoChat :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeVideoChat = A.withObject "InternalLinkTypeVideoChat" $ \o -> do
        chat_username_  <- o A..:?  "chat_username"
        invite_hash_    <- o A..:?  "invite_hash"
        is_live_stream_ <- o A..:?  "is_live_stream"
        pure $ InternalLinkTypeVideoChat
          { chat_username  = chat_username_
          , invite_hash    = invite_hash_
          , is_live_stream = is_live_stream_
          }
      parseInternalLinkTypeWebApp :: A.Value -> AT.Parser InternalLinkType
      parseInternalLinkTypeWebApp = A.withObject "InternalLinkTypeWebApp" $ \o -> do
        bot_username_       <- o A..:?  "bot_username"
        web_app_short_name_ <- o A..:?  "web_app_short_name"
        start_parameter_    <- o A..:?  "start_parameter"
        mode_               <- o A..:?  "mode"
        pure $ InternalLinkTypeWebApp
          { bot_username       = bot_username_
          , web_app_short_name = web_app_short_name_
          , start_parameter    = start_parameter_
          , mode               = mode_
          }
  parseJSON _ = mempty

instance AT.ToJSON InternalLinkType where
  toJSON InternalLinkTypeAttachmentMenuBot
    { target_chat  = target_chat_
    , bot_username = bot_username_
    , url          = url_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypeAttachmentMenuBot"
        , "target_chat"  A..= target_chat_
        , "bot_username" A..= bot_username_
        , "url"          A..= url_
        ]
  toJSON InternalLinkTypeAuthenticationCode
    { code = code_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeAuthenticationCode"
        , "code"  A..= code_
        ]
  toJSON InternalLinkTypeBackground
    { background_name = background_name_
    }
      = A.object
        [ "@type"           A..= AT.String "internalLinkTypeBackground"
        , "background_name" A..= background_name_
        ]
  toJSON InternalLinkTypeBotAddToChannel
    { bot_username         = bot_username_
    , administrator_rights = administrator_rights_
    }
      = A.object
        [ "@type"                A..= AT.String "internalLinkTypeBotAddToChannel"
        , "bot_username"         A..= bot_username_
        , "administrator_rights" A..= administrator_rights_
        ]
  toJSON InternalLinkTypeBotStart
    { bot_username    = bot_username_
    , start_parameter = start_parameter_
    , autostart       = autostart_
    }
      = A.object
        [ "@type"           A..= AT.String "internalLinkTypeBotStart"
        , "bot_username"    A..= bot_username_
        , "start_parameter" A..= start_parameter_
        , "autostart"       A..= autostart_
        ]
  toJSON InternalLinkTypeBotStartInGroup
    { bot_username         = bot_username_
    , start_parameter      = start_parameter_
    , administrator_rights = administrator_rights_
    }
      = A.object
        [ "@type"                A..= AT.String "internalLinkTypeBotStartInGroup"
        , "bot_username"         A..= bot_username_
        , "start_parameter"      A..= start_parameter_
        , "administrator_rights" A..= administrator_rights_
        ]
  toJSON InternalLinkTypeBusinessChat
    { link_name = link_name_
    }
      = A.object
        [ "@type"     A..= AT.String "internalLinkTypeBusinessChat"
        , "link_name" A..= link_name_
        ]
  toJSON InternalLinkTypeCallsPage
    { section = section_
    }
      = A.object
        [ "@type"   A..= AT.String "internalLinkTypeCallsPage"
        , "section" A..= section_
        ]
  toJSON InternalLinkTypeChatAffiliateProgram
    { username = username_
    , referrer = referrer_
    }
      = A.object
        [ "@type"    A..= AT.String "internalLinkTypeChatAffiliateProgram"
        , "username" A..= username_
        , "referrer" A..= referrer_
        ]
  toJSON InternalLinkTypeChatBoost
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeChatBoost"
        , "url"   A..= url_
        ]
  toJSON InternalLinkTypeChatFolderInvite
    { invite_link = invite_link_
    }
      = A.object
        [ "@type"       A..= AT.String "internalLinkTypeChatFolderInvite"
        , "invite_link" A..= invite_link_
        ]
  toJSON InternalLinkTypeChatInvite
    { invite_link = invite_link_
    }
      = A.object
        [ "@type"       A..= AT.String "internalLinkTypeChatInvite"
        , "invite_link" A..= invite_link_
        ]
  toJSON InternalLinkTypeChatSelection
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeChatSelection"
        ]
  toJSON InternalLinkTypeContactsPage
    { section = section_
    }
      = A.object
        [ "@type"   A..= AT.String "internalLinkTypeContactsPage"
        , "section" A..= section_
        ]
  toJSON InternalLinkTypeDirectMessagesChat
    { channel_username = channel_username_
    }
      = A.object
        [ "@type"            A..= AT.String "internalLinkTypeDirectMessagesChat"
        , "channel_username" A..= channel_username_
        ]
  toJSON InternalLinkTypeGame
    { bot_username    = bot_username_
    , game_short_name = game_short_name_
    }
      = A.object
        [ "@type"           A..= AT.String "internalLinkTypeGame"
        , "bot_username"    A..= bot_username_
        , "game_short_name" A..= game_short_name_
        ]
  toJSON InternalLinkTypeGiftAuction
    { auction_id = auction_id_
    }
      = A.object
        [ "@type"      A..= AT.String "internalLinkTypeGiftAuction"
        , "auction_id" A..= auction_id_
        ]
  toJSON InternalLinkTypeGiftCollection
    { gift_owner_username = gift_owner_username_
    , collection_id       = collection_id_
    }
      = A.object
        [ "@type"               A..= AT.String "internalLinkTypeGiftCollection"
        , "gift_owner_username" A..= gift_owner_username_
        , "collection_id"       A..= collection_id_
        ]
  toJSON InternalLinkTypeGroupCall
    { invite_link = invite_link_
    }
      = A.object
        [ "@type"       A..= AT.String "internalLinkTypeGroupCall"
        , "invite_link" A..= invite_link_
        ]
  toJSON InternalLinkTypeInstantView
    { url          = url_
    , fallback_url = fallback_url_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypeInstantView"
        , "url"          A..= url_
        , "fallback_url" A..= fallback_url_
        ]
  toJSON InternalLinkTypeInvoice
    { invoice_name = invoice_name_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypeInvoice"
        , "invoice_name" A..= invoice_name_
        ]
  toJSON InternalLinkTypeLanguagePack
    { language_pack_id = language_pack_id_
    }
      = A.object
        [ "@type"            A..= AT.String "internalLinkTypeLanguagePack"
        , "language_pack_id" A..= language_pack_id_
        ]
  toJSON InternalLinkTypeLiveStory
    { story_poster_username = story_poster_username_
    }
      = A.object
        [ "@type"                 A..= AT.String "internalLinkTypeLiveStory"
        , "story_poster_username" A..= story_poster_username_
        ]
  toJSON InternalLinkTypeMainWebApp
    { bot_username    = bot_username_
    , start_parameter = start_parameter_
    , mode            = mode_
    }
      = A.object
        [ "@type"           A..= AT.String "internalLinkTypeMainWebApp"
        , "bot_username"    A..= bot_username_
        , "start_parameter" A..= start_parameter_
        , "mode"            A..= mode_
        ]
  toJSON InternalLinkTypeMessage
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeMessage"
        , "url"   A..= url_
        ]
  toJSON InternalLinkTypeMessageDraft
    { text          = text_
    , contains_link = contains_link_
    }
      = A.object
        [ "@type"         A..= AT.String "internalLinkTypeMessageDraft"
        , "text"          A..= text_
        , "contains_link" A..= contains_link_
        ]
  toJSON InternalLinkTypeMyProfilePage
    { section = section_
    }
      = A.object
        [ "@type"   A..= AT.String "internalLinkTypeMyProfilePage"
        , "section" A..= section_
        ]
  toJSON InternalLinkTypeNewChannelChat
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeNewChannelChat"
        ]
  toJSON InternalLinkTypeNewGroupChat
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeNewGroupChat"
        ]
  toJSON InternalLinkTypeNewPrivateChat
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeNewPrivateChat"
        ]
  toJSON InternalLinkTypeNewStory
    { content_type = content_type_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypeNewStory"
        , "content_type" A..= content_type_
        ]
  toJSON InternalLinkTypeOauth
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeOauth"
        , "url"   A..= url_
        ]
  toJSON InternalLinkTypePassportDataRequest
    { bot_user_id  = bot_user_id_
    , scope        = scope_
    , public_key   = public_key_
    , nonce        = nonce_
    , callback_url = callback_url_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypePassportDataRequest"
        , "bot_user_id"  A..= bot_user_id_
        , "scope"        A..= scope_
        , "public_key"   A..= public_key_
        , "nonce"        A..= nonce_
        , "callback_url" A..= callback_url_
        ]
  toJSON InternalLinkTypePhoneNumberConfirmation
    { hash         = hash_
    , phone_number = phone_number_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypePhoneNumberConfirmation"
        , "hash"         A..= hash_
        , "phone_number" A..= phone_number_
        ]
  toJSON InternalLinkTypePremiumFeaturesPage
    { referrer = referrer_
    }
      = A.object
        [ "@type"    A..= AT.String "internalLinkTypePremiumFeaturesPage"
        , "referrer" A..= referrer_
        ]
  toJSON InternalLinkTypePremiumGiftCode
    { code = code_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypePremiumGiftCode"
        , "code"  A..= code_
        ]
  toJSON InternalLinkTypePremiumGiftPurchase
    { referrer = referrer_
    }
      = A.object
        [ "@type"    A..= AT.String "internalLinkTypePremiumGiftPurchase"
        , "referrer" A..= referrer_
        ]
  toJSON InternalLinkTypeProxy
    { proxy = proxy_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeProxy"
        , "proxy" A..= proxy_
        ]
  toJSON InternalLinkTypePublicChat
    { chat_username = chat_username_
    , draft_text    = draft_text_
    , open_profile  = open_profile_
    }
      = A.object
        [ "@type"         A..= AT.String "internalLinkTypePublicChat"
        , "chat_username" A..= chat_username_
        , "draft_text"    A..= draft_text_
        , "open_profile"  A..= open_profile_
        ]
  toJSON InternalLinkTypeQrCodeAuthentication
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeQrCodeAuthentication"
        ]
  toJSON InternalLinkTypeRestorePurchases
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeRestorePurchases"
        ]
  toJSON InternalLinkTypeSavedMessages
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeSavedMessages"
        ]
  toJSON InternalLinkTypeSearch
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeSearch"
        ]
  toJSON InternalLinkTypeSettings
    { _section = _section_
    }
      = A.object
        [ "@type"   A..= AT.String "internalLinkTypeSettings"
        , "section" A..= _section_
        ]
  toJSON InternalLinkTypeStarPurchase
    { star_count = star_count_
    , purpose    = purpose_
    }
      = A.object
        [ "@type"      A..= AT.String "internalLinkTypeStarPurchase"
        , "star_count" A..= star_count_
        , "purpose"    A..= purpose_
        ]
  toJSON InternalLinkTypeStickerSet
    { sticker_set_name    = sticker_set_name_
    , expect_custom_emoji = expect_custom_emoji_
    }
      = A.object
        [ "@type"               A..= AT.String "internalLinkTypeStickerSet"
        , "sticker_set_name"    A..= sticker_set_name_
        , "expect_custom_emoji" A..= expect_custom_emoji_
        ]
  toJSON InternalLinkTypeStory
    { story_poster_username = story_poster_username_
    , story_id              = story_id_
    }
      = A.object
        [ "@type"                 A..= AT.String "internalLinkTypeStory"
        , "story_poster_username" A..= story_poster_username_
        , "story_id"              A..= story_id_
        ]
  toJSON InternalLinkTypeStoryAlbum
    { story_album_owner_username = story_album_owner_username_
    , story_album_id             = story_album_id_
    }
      = A.object
        [ "@type"                      A..= AT.String "internalLinkTypeStoryAlbum"
        , "story_album_owner_username" A..= story_album_owner_username_
        , "story_album_id"             A..= story_album_id_
        ]
  toJSON InternalLinkTypeTheme
    { theme_name = theme_name_
    }
      = A.object
        [ "@type"      A..= AT.String "internalLinkTypeTheme"
        , "theme_name" A..= theme_name_
        ]
  toJSON InternalLinkTypeUnknownDeepLink
    { link = link_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeUnknownDeepLink"
        , "link"  A..= link_
        ]
  toJSON InternalLinkTypeUpgradedGift
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeUpgradedGift"
        , "name"  A..= name_
        ]
  toJSON InternalLinkTypeUserPhoneNumber
    { phone_number = phone_number_
    , draft_text   = draft_text_
    , open_profile = open_profile_
    }
      = A.object
        [ "@type"        A..= AT.String "internalLinkTypeUserPhoneNumber"
        , "phone_number" A..= phone_number_
        , "draft_text"   A..= draft_text_
        , "open_profile" A..= open_profile_
        ]
  toJSON InternalLinkTypeUserToken
    { token = token_
    }
      = A.object
        [ "@type" A..= AT.String "internalLinkTypeUserToken"
        , "token" A..= token_
        ]
  toJSON InternalLinkTypeVideoChat
    { chat_username  = chat_username_
    , invite_hash    = invite_hash_
    , is_live_stream = is_live_stream_
    }
      = A.object
        [ "@type"          A..= AT.String "internalLinkTypeVideoChat"
        , "chat_username"  A..= chat_username_
        , "invite_hash"    A..= invite_hash_
        , "is_live_stream" A..= is_live_stream_
        ]
  toJSON InternalLinkTypeWebApp
    { bot_username       = bot_username_
    , web_app_short_name = web_app_short_name_
    , start_parameter    = start_parameter_
    , mode               = mode_
    }
      = A.object
        [ "@type"              A..= AT.String "internalLinkTypeWebApp"
        , "bot_username"       A..= bot_username_
        , "web_app_short_name" A..= web_app_short_name_
        , "start_parameter"    A..= start_parameter_
        , "mode"               A..= mode_
        ]

