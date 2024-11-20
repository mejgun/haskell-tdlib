module TD.Data.MessageContent
  (MessageContent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.LinkPreview as LinkPreview
import qualified TD.Data.LinkPreviewOptions as LinkPreviewOptions
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.PaidMedia as PaidMedia
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
import qualified TD.Data.AlternativeVideo as AlternativeVideo
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote
import qualified TD.Data.Location as Location
import qualified TD.Data.Venue as Venue
import qualified TD.Data.Contact as Contact
import qualified TD.Data.AnimatedEmoji as AnimatedEmoji
import qualified Data.Text as T
import qualified TD.Data.DiceStickers as DiceStickers
import qualified TD.Data.Game as Game
import qualified TD.Data.Poll as Poll
import qualified TD.Data.ProductInfo as ProductInfo
import qualified TD.Data.CallDiscardReason as CallDiscardReason
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.ChatBackground as ChatBackground
import qualified TD.Data.ForumTopicIcon as ForumTopicIcon
import qualified Data.ByteString as BS
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.GiveawayParameters as GiveawayParameters
import qualified TD.Data.GiveawayPrize as GiveawayPrize
import qualified TD.Data.Gift as Gift
import qualified TD.Data.SharedUser as SharedUser
import qualified TD.Data.SharedChat as SharedChat
import qualified TD.Data.BotWriteAccessAllowReason as BotWriteAccessAllowReason
import qualified TD.Data.PassportElementType as PassportElementType
import qualified TD.Data.EncryptedPassportElement as EncryptedPassportElement
import qualified TD.Data.EncryptedCredentials as EncryptedCredentials

-- | Contains the content of a message
data MessageContent
  = MessageText -- ^ A text message
    { text                 :: Maybe FormattedText.FormattedText           -- ^ Text of the message
    , link_preview         :: Maybe LinkPreview.LinkPreview               -- ^ A link preview attached to the message; may be null
    , link_preview_options :: Maybe LinkPreviewOptions.LinkPreviewOptions -- ^ Options which were used for generation of the link preview; may be null if default options were used
    }
  | MessageAnimation -- ^ An animation message (GIF-style).
    { animation                :: Maybe Animation.Animation         -- ^ The animation description
    , caption                  :: Maybe FormattedText.FormattedText -- ^ Animation caption
    , show_caption_above_media :: Maybe Bool                        -- ^ True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation
    , has_spoiler              :: Maybe Bool                        -- ^ True, if the animation preview must be covered by a spoiler animation
    , is_secret                :: Maybe Bool                        -- ^ True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
    }
  | MessageAudio -- ^ An audio message
    { audio   :: Maybe Audio.Audio                 -- ^ The audio description
    , caption :: Maybe FormattedText.FormattedText -- ^ Audio caption
    }
  | MessageDocument -- ^ A document message (general file)
    { document :: Maybe Document.Document           -- ^ The document description
    , caption  :: Maybe FormattedText.FormattedText -- ^ Document caption
    }
  | MessagePaidMedia -- ^ A message with paid media
    { star_count               :: Maybe Int                         -- ^ Number of Telegram Stars needed to buy access to the media in the message
    , media                    :: Maybe [PaidMedia.PaidMedia]       -- ^ Information about the media
    , caption                  :: Maybe FormattedText.FormattedText -- ^ Media caption
    , show_caption_above_media :: Maybe Bool                        -- ^ True, if the caption must be shown above the media; otherwise, the caption must be shown below the media
    }
  | MessagePhoto -- ^ A photo message
    { photo                    :: Maybe Photo.Photo                 -- ^ The photo
    , caption                  :: Maybe FormattedText.FormattedText -- ^ Photo caption
    , show_caption_above_media :: Maybe Bool                        -- ^ True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo
    , has_spoiler              :: Maybe Bool                        -- ^ True, if the photo preview must be covered by a spoiler animation
    , is_secret                :: Maybe Bool                        -- ^ True, if the photo must be blurred and must be shown only while tapped
    }
  | MessageSticker -- ^ A sticker message
    { sticker    :: Maybe Sticker.Sticker -- ^ The sticker description
    , is_premium :: Maybe Bool            -- ^ True, if premium animation of the sticker must be played
    }
  | MessageVideo -- ^ A video message
    { video                    :: Maybe Video.Video                         -- ^ The video description
    , alternative_videos       :: Maybe [AlternativeVideo.AlternativeVideo] -- ^ Alternative qualities of the video
    , caption                  :: Maybe FormattedText.FormattedText         -- ^ Video caption
    , show_caption_above_media :: Maybe Bool                                -- ^ True, if the caption must be shown above the video; otherwise, the caption must be shown below the video
    , has_spoiler              :: Maybe Bool                                -- ^ True, if the video preview must be covered by a spoiler animation
    , is_secret                :: Maybe Bool                                -- ^ True, if the video thumbnail must be blurred and the video must be shown only while tapped
    }
  | MessageVideoNote -- ^ A video note message
    { video_note :: Maybe VideoNote.VideoNote -- ^ The video note description
    , is_viewed  :: Maybe Bool                -- ^ True, if at least one of the recipients has viewed the video note
    , is_secret  :: Maybe Bool                -- ^ True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
    }
  | MessageVoiceNote -- ^ A voice note message
    { voice_note  :: Maybe VoiceNote.VoiceNote         -- ^ The voice note description
    , caption     :: Maybe FormattedText.FormattedText -- ^ Voice note caption
    , is_listened :: Maybe Bool                        -- ^ True, if at least one of the recipients has listened to the voice note
    }
  | MessageExpiredPhoto -- ^ A self-destructed photo message
  | MessageExpiredVideo -- ^ A self-destructed video message
  | MessageExpiredVideoNote -- ^ A self-destructed video note message
  | MessageExpiredVoiceNote -- ^ A self-destructed voice note message
  | MessageLocation -- ^ A message with a location
    { location               :: Maybe Location.Location -- ^ The location description
    , live_period            :: Maybe Int               -- ^ Time relative to the message send date, for which the location can be updated, in seconds; if 0x7FFFFFFF, then location can be updated forever
    , expires_in             :: Maybe Int               -- ^ Left time for which the location can be updated, in seconds. If 0, then the location can't be updated anymore. The update updateMessageContent is not sent when this field changes
    , heading                :: Maybe Int               -- ^ For live locations, a direction in which the location moves, in degrees; 1-360. If 0 the direction is unknown
    , proximity_alert_radius :: Maybe Int               -- ^ For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled. Available only to the message sender
    }
  | MessageVenue -- ^ A message with information about a venue
    { venue :: Maybe Venue.Venue -- ^ The venue description
    }
  | MessageContact -- ^ A message with a user contact
    { contact :: Maybe Contact.Contact -- ^ The contact description
    }
  | MessageAnimatedEmoji -- ^ A message with an animated emoji
    { animated_emoji :: Maybe AnimatedEmoji.AnimatedEmoji -- ^ The animated emoji
    , emoji          :: Maybe T.Text                      -- ^ The corresponding emoji
    }
  | MessageDice -- ^ A dice message. The dice value is randomly generated by the server
    { initial_state                  :: Maybe DiceStickers.DiceStickers -- ^ The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
    , final_state                    :: Maybe DiceStickers.DiceStickers -- ^ The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
    , emoji                          :: Maybe T.Text                    -- ^ Emoji on which the dice throw animation is based
    , value                          :: Maybe Int                       -- ^ The dice value. If the value is 0, the dice don't have final state yet
    , success_animation_frame_number :: Maybe Int                       -- ^ Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
    }
  | MessageGame -- ^ A message with a game
    { game :: Maybe Game.Game -- ^ The game description
    }
  | MessagePoll -- ^ A message with a poll
    { poll :: Maybe Poll.Poll -- ^ The poll description
    }
  | MessageStory -- ^ A message with a forwarded story
    { story_sender_chat_id :: Maybe Int  -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int  -- ^ Story identifier
    , via_mention          :: Maybe Bool -- ^ True, if the story was automatically forwarded because of a mention of the user
    }
  | MessageInvoice -- ^ A message with an invoice from a bot. Use getInternalLink with internalLinkTypeBotStart to share the invoice
    { product_info          :: Maybe ProductInfo.ProductInfo     -- ^ Information about the product
    , currency              :: Maybe T.Text                      -- ^ Currency for the product price
    , total_amount          :: Maybe Int                         -- ^ Product total price in the smallest units of the currency
    , start_parameter       :: Maybe T.Text                      -- ^ Unique invoice bot start_parameter to be passed to getInternalLink
    , is_test               :: Maybe Bool                        -- ^ True, if the invoice is a test invoice
    , need_shipping_address :: Maybe Bool                        -- ^ True, if the shipping address must be specified
    , receipt_message_id    :: Maybe Int                         -- ^ The identifier of the message with the receipt, after the product has been purchased
    , paid_media            :: Maybe PaidMedia.PaidMedia         -- ^ Extended media attached to the invoice; may be null if none
    , paid_media_caption    :: Maybe FormattedText.FormattedText -- ^ Extended media caption; may be null if none
    }
  | MessageCall -- ^ A message with information about an ended call
    { is_video       :: Maybe Bool                                -- ^ True, if the call was a video call
    , discard_reason :: Maybe CallDiscardReason.CallDiscardReason -- ^ Reason why the call was discarded
    , duration       :: Maybe Int                                 -- ^ Call duration, in seconds
    }
  | MessageVideoChatScheduled -- ^ A new video chat was scheduled
    { group_call_id :: Maybe Int -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    , start_date    :: Maybe Int -- ^ Point in time (Unix timestamp) when the group call is expected to be started by an administrator
    }
  | MessageVideoChatStarted -- ^ A newly created video chat
    { group_call_id :: Maybe Int -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    }
  | MessageVideoChatEnded -- ^ A message with information about an ended video chat
    { duration :: Maybe Int -- ^ Call duration, in seconds
    }
  | MessageInviteVideoChatParticipants -- ^ A message with information about an invitation to a video chat
    { group_call_id :: Maybe Int   -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    , user_ids      :: Maybe [Int] -- ^ Invited user identifiers
    }
  | MessageBasicGroupChatCreate -- ^ A newly created basic group
    { title           :: Maybe T.Text -- ^ Title of the basic group
    , member_user_ids :: Maybe [Int]  -- ^ User identifiers of members in the basic group
    }
  | MessageSupergroupChatCreate -- ^ A newly created supergroup or channel
    { title :: Maybe T.Text -- ^ Title of the supergroup or channel
    }
  | MessageChatChangeTitle -- ^ An updated chat title
    { title :: Maybe T.Text -- ^ New chat title
    }
  | MessageChatChangePhoto -- ^ An updated chat photo
    { _photo :: Maybe ChatPhoto.ChatPhoto -- ^ New chat photo
    }
  | MessageChatDeletePhoto -- ^ A deleted chat photo
  | MessageChatAddMembers -- ^ New chat members were added
    { member_user_ids :: Maybe [Int] -- ^ User identifiers of the new members
    }
  | MessageChatJoinByLink -- ^ A new member joined the chat via an invite link
  | MessageChatJoinByRequest -- ^ A new member was accepted to the chat by an administrator
  | MessageChatDeleteMember -- ^ A chat member was deleted
    { user_id :: Maybe Int -- ^ User identifier of the deleted chat member
    }
  | MessageChatUpgradeTo -- ^ A basic group was upgraded to a supergroup and was deactivated as the result
    { supergroup_id :: Maybe Int -- ^ Identifier of the supergroup to which the basic group was upgraded
    }
  | MessageChatUpgradeFrom -- ^ A supergroup has been created from a basic group
    { title          :: Maybe T.Text -- ^ Title of the newly created supergroup
    , basic_group_id :: Maybe Int    -- ^ The identifier of the original basic group
    }
  | MessagePinMessage -- ^ A message has been pinned
    { message_id :: Maybe Int -- ^ Identifier of the pinned message, can be an identifier of a deleted message or 0
    }
  | MessageScreenshotTaken -- ^ A screenshot of a message in the chat has been taken
  | MessageChatSetBackground -- ^ A new background was set in the chat
    { old_background_message_id :: Maybe Int                           -- ^ Identifier of the message with a previously set same background; 0 if none. Can be an identifier of a deleted message
    , background                :: Maybe ChatBackground.ChatBackground -- ^ The new background
    , only_for_self             :: Maybe Bool                          -- ^ True, if the background was set only for self
    }
  | MessageChatSetTheme -- ^ A theme in the chat has been changed
    { theme_name :: Maybe T.Text -- ^ If non-empty, name of a new theme, set for the chat. Otherwise, chat theme was reset to the default one
    }
  | MessageChatSetMessageAutoDeleteTime -- ^ The auto-delete or self-destruct timer for messages in the chat has been changed
    { message_auto_delete_time :: Maybe Int -- ^ New value auto-delete or self-destruct time, in seconds; 0 if disabled
    , from_user_id             :: Maybe Int -- ^ If not 0, a user identifier, which default setting was automatically applied
    }
  | MessageChatBoost -- ^ The chat was boosted by the sender of the message
    { boost_count :: Maybe Int -- ^ Number of times the chat was boosted
    }
  | MessageForumTopicCreated -- ^ A forum topic has been created
    { name :: Maybe T.Text                        -- ^ Name of the topic
    , icon :: Maybe ForumTopicIcon.ForumTopicIcon -- ^ Icon of the topic
    }
  | MessageForumTopicEdited -- ^ A forum topic has been edited
    { name                      :: Maybe T.Text -- ^ If non-empty, the new name of the topic
    , edit_icon_custom_emoji_id :: Maybe Bool   -- ^ True, if icon's custom_emoji_id is changed
    , icon_custom_emoji_id      :: Maybe Int    -- ^ New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false
    }
  | MessageForumTopicIsClosedToggled -- ^ A forum topic has been closed or opened
    { is_closed :: Maybe Bool -- ^ True, if the topic was closed; otherwise, the topic was reopened
    }
  | MessageForumTopicIsHiddenToggled -- ^ A General forum topic has been hidden or unhidden
    { is_hidden :: Maybe Bool -- ^ True, if the topic was hidden; otherwise, the topic was unhidden
    }
  | MessageSuggestProfilePhoto -- ^ A profile photo was suggested to a user in a private chat
    { _photo :: Maybe ChatPhoto.ChatPhoto -- ^ The suggested chat photo. Use the method setProfilePhoto with inputChatPhotoPrevious to apply the photo
    }
  | MessageCustomServiceAction -- ^ A non-standard action has happened in the chat
    { _text :: Maybe T.Text -- ^ Message text to be shown in the chat
    }
  | MessageGameScore -- ^ A new high score was achieved in a game
    { game_message_id :: Maybe Int -- ^ Identifier of the message with the game, can be an identifier of a deleted message
    , game_id         :: Maybe Int -- ^ Identifier of the game; may be different from the games presented in the message with the game
    , score           :: Maybe Int -- ^ New score
    }
  | MessagePaymentSuccessful -- ^ A payment has been sent to a bot or a business account
    { invoice_chat_id         :: Maybe Int    -- ^ Identifier of the chat, containing the corresponding invoice message
    , invoice_message_id      :: Maybe Int    -- ^ Identifier of the message with the corresponding invoice; can be 0 or an identifier of a deleted message
    , currency                :: Maybe T.Text -- ^ Currency for the price of the product
    , total_amount            :: Maybe Int    -- ^ Total price for the product, in the smallest units of the currency
    , subscription_until_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring
    , is_recurring            :: Maybe Bool   -- ^ True, if this is a recurring payment
    , is_first_recurring      :: Maybe Bool   -- ^ True, if this is the first recurring payment
    , invoice_name            :: Maybe T.Text -- ^ Name of the invoice; may be empty if unknown
    }
  | MessagePaymentSuccessfulBot -- ^ A payment has been received by the bot or the business account
    { currency                   :: Maybe T.Text              -- ^ Currency for price of the product
    , total_amount               :: Maybe Int                 -- ^ Total price for the product, in the smallest units of the currency
    , subscription_until_date    :: Maybe Int                 -- ^ Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring
    , is_recurring               :: Maybe Bool                -- ^ True, if this is a recurring payment
    , is_first_recurring         :: Maybe Bool                -- ^ True, if this is the first recurring payment
    , invoice_payload            :: Maybe BS.ByteString       -- ^ Invoice payload
    , shipping_option_id         :: Maybe T.Text              -- ^ Identifier of the shipping option chosen by the user; may be empty if not applicable; for bots only
    , order_info                 :: Maybe OrderInfo.OrderInfo -- ^ Information about the order; may be null; for bots only
    , telegram_payment_charge_id :: Maybe T.Text              -- ^ Telegram payment identifier
    , provider_payment_charge_id :: Maybe T.Text              -- ^ Provider payment identifier
    }
  | MessagePaymentRefunded -- ^ A payment has been refunded
    { owner_id                   :: Maybe MessageSender.MessageSender -- ^ Identifier of the previous owner of the Telegram Stars that refunds them
    , currency                   :: Maybe T.Text                      -- ^ Currency for the price of the product
    , total_amount               :: Maybe Int                         -- ^ Total price for the product, in the smallest units of the currency
    , invoice_payload            :: Maybe BS.ByteString               -- ^ Invoice payload; only for bots
    , telegram_payment_charge_id :: Maybe T.Text                      -- ^ Telegram payment identifier
    , provider_payment_charge_id :: Maybe T.Text                      -- ^ Provider payment identifier
    }
  | MessageGiftedPremium -- ^ Telegram Premium was gifted to a user
    { gifter_user_id        :: Maybe Int                         -- ^ The identifier of a user that gifted Telegram Premium; 0 if the gift was anonymous or is outgoing
    , receiver_user_id      :: Maybe Int                         -- ^ The identifier of a user that received Telegram Premium; 0 if the gift is incoming
    , text                  :: Maybe FormattedText.FormattedText -- ^ Message added to the gifted Telegram Premium by the sender
    , currency              :: Maybe T.Text                      -- ^ Currency for the paid amount
    , amount                :: Maybe Int                         -- ^ The paid amount, in the smallest units of the currency
    , cryptocurrency        :: Maybe T.Text                      -- ^ Cryptocurrency used to pay for the gift; may be empty if none
    , cryptocurrency_amount :: Maybe Int                         -- ^ The paid amount, in the smallest units of the cryptocurrency; 0 if none
    , month_count           :: Maybe Int                         -- ^ Number of months the Telegram Premium subscription will be active
    , sticker               :: Maybe Sticker.Sticker             -- ^ A sticker to be shown in the message; may be null if unknown
    }
  | MessagePremiumGiftCode -- ^ A Telegram Premium gift code was created for the user
    { creator_id            :: Maybe MessageSender.MessageSender -- ^ Identifier of a chat or a user that created the gift code; may be null if unknown
    , text                  :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , is_from_giveaway      :: Maybe Bool                        -- ^ True, if the gift code was created for a giveaway
    , is_unclaimed          :: Maybe Bool                        -- ^ True, if the winner for the corresponding Telegram Premium subscription wasn't chosen
    , currency              :: Maybe T.Text                      -- ^ Currency for the paid amount; empty if unknown
    , amount                :: Maybe Int                         -- ^ The paid amount, in the smallest units of the currency; 0 if unknown
    , cryptocurrency        :: Maybe T.Text                      -- ^ Cryptocurrency used to pay for the gift; may be empty if none or unknown
    , cryptocurrency_amount :: Maybe Int                         -- ^ The paid amount, in the smallest units of the cryptocurrency; 0 if unknown
    , month_count           :: Maybe Int                         -- ^ Number of months the Telegram Premium subscription will be active after code activation
    , sticker               :: Maybe Sticker.Sticker             -- ^ A sticker to be shown in the message; may be null if unknown
    , code                  :: Maybe T.Text                      -- ^ The gift code
    }
  | MessageGiveawayCreated -- ^ A giveaway was created for the chat. Use telegramPaymentPurposePremiumGiveaway, storePaymentPurposePremiumGiveaway, telegramPaymentPurposeStarGiveaway, or storePaymentPurposeStarGiveaway to create a giveaway
    { star_count :: Maybe Int -- ^ Number of Telegram Stars that will be shared by winners of the giveaway; 0 for Telegram Premium giveaways
    }
  | MessageGiveaway -- ^ A giveaway
    { parameters   :: Maybe GiveawayParameters.GiveawayParameters -- ^ Giveaway parameters
    , winner_count :: Maybe Int                                   -- ^ Number of users which will receive Telegram Premium subscription gift codes
    , prize        :: Maybe GiveawayPrize.GiveawayPrize           -- ^ Prize of the giveaway
    , sticker      :: Maybe Sticker.Sticker                       -- ^ A sticker to be shown in the message; may be null if unknown
    }
  | MessageGiveawayCompleted -- ^ A giveaway without public winners has been completed for the chat
    { giveaway_message_id   :: Maybe Int  -- ^ Identifier of the message with the giveaway; can be 0 if the message was deleted
    , winner_count          :: Maybe Int  -- ^ Number of winners in the giveaway
    , is_star_giveaway      :: Maybe Bool -- ^ True, if the giveaway is a Telegram Star giveaway
    , unclaimed_prize_count :: Maybe Int  -- ^ Number of undistributed prizes; for Telegram Premium giveaways only
    }
  | MessageGiveawayWinners -- ^ A giveaway with public winners has been completed for the chat
    { boosted_chat_id               :: Maybe Int                         -- ^ Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway
    , giveaway_message_id           :: Maybe Int                         -- ^ Identifier of the message with the giveaway in the boosted chat
    , additional_chat_count         :: Maybe Int                         -- ^ Number of other chats that participated in the giveaway
    , actual_winners_selection_date :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
    , only_new_members              :: Maybe Bool                        -- ^ True, if only new members of the chats were eligible for the giveaway
    , was_refunded                  :: Maybe Bool                        -- ^ True, if the giveaway was canceled and was fully refunded
    , prize                         :: Maybe GiveawayPrize.GiveawayPrize -- ^ Prize of the giveaway
    , prize_description             :: Maybe T.Text                      -- ^ Additional description of the giveaway prize
    , winner_count                  :: Maybe Int                         -- ^ Total number of winners in the giveaway
    , winner_user_ids               :: Maybe [Int]                       -- ^ Up to 100 user identifiers of the winners of the giveaway
    , unclaimed_prize_count         :: Maybe Int                         -- ^ Number of undistributed prizes; for Telegram Premium giveaways only
    }
  | MessageGiftedStars -- ^ Telegram Stars were gifted to a user
    { gifter_user_id        :: Maybe Int             -- ^ The identifier of a user that gifted Telegram Stars; 0 if the gift was anonymous or is outgoing
    , receiver_user_id      :: Maybe Int             -- ^ The identifier of a user that received Telegram Stars; 0 if the gift is incoming
    , currency              :: Maybe T.Text          -- ^ Currency for the paid amount
    , amount                :: Maybe Int             -- ^ The paid amount, in the smallest units of the currency
    , cryptocurrency        :: Maybe T.Text          -- ^ Cryptocurrency used to pay for the gift; may be empty if none
    , cryptocurrency_amount :: Maybe Int             -- ^ The paid amount, in the smallest units of the cryptocurrency; 0 if none
    , star_count            :: Maybe Int             -- ^ Number of Telegram Stars that were gifted
    , transaction_id        :: Maybe T.Text          -- ^ Identifier of the transaction for Telegram Stars purchase; for receiver only
    , sticker               :: Maybe Sticker.Sticker -- ^ A sticker to be shown in the message; may be null if unknown
    }
  | MessageGiveawayPrizeStars -- ^ A Telegram Stars were received by the current user from a giveaway
    { star_count          :: Maybe Int             -- ^ Number of Telegram Stars that were received
    , transaction_id      :: Maybe T.Text          -- ^ Identifier of the transaction for Telegram Stars credit
    , boosted_chat_id     :: Maybe Int             -- ^ Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway
    , giveaway_message_id :: Maybe Int             -- ^ Identifier of the message with the giveaway in the boosted chat; can be 0 if the message was deleted
    , is_unclaimed        :: Maybe Bool            -- ^ True, if the corresponding winner wasn't chosen and the Telegram Stars were received by the owner of the boosted chat
    , sticker             :: Maybe Sticker.Sticker -- ^ A sticker to be shown in the message; may be null if unknown
    }
  | MessageGift -- ^ A gift was received or sent by the current user
    { gift            :: Maybe Gift.Gift                   -- ^ The gift
    , text            :: Maybe FormattedText.FormattedText -- ^ Message added to the gift
    , sell_star_count :: Maybe Int                         -- ^ Number of Telegram Stars that can be claimed by the receiver instead of the gift; 0 if the gift can't be sold by the receiver
    , is_private      :: Maybe Bool                        -- ^ True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    , is_saved        :: Maybe Bool                        -- ^ True, if the gift is displayed on the user's profile page; only for the receiver of the gift
    , was_converted   :: Maybe Bool                        -- ^ True, if the gift was converted to Telegram Stars; only for the receiver of the gift
    }
  | MessageContactRegistered -- ^ A contact has registered with Telegram
  | MessageUsersShared -- ^ The current user shared users, which were requested by the bot
    { users     :: Maybe [SharedUser.SharedUser] -- ^ The shared users
    , button_id :: Maybe Int                     -- ^ Identifier of the keyboard button with the request
    }
  | MessageChatShared -- ^ The current user shared a chat, which was requested by the bot
    { chat      :: Maybe SharedChat.SharedChat -- ^ The shared chat
    , button_id :: Maybe Int                   -- ^ Identifier of the keyboard button with the request
    }
  | MessageBotWriteAccessAllowed -- ^ The user allowed the bot to send messages
    { reason :: Maybe BotWriteAccessAllowReason.BotWriteAccessAllowReason -- ^ The reason why the bot was allowed to write messages
    }
  | MessageWebAppDataSent -- ^ Data from a Web App has been sent to a bot
    { button_text :: Maybe T.Text -- ^ Text of the keyboardButtonTypeWebApp button, which opened the Web App
    }
  | MessageWebAppDataReceived -- ^ Data from a Web App has been received; for bots only
    { button_text :: Maybe T.Text -- ^ Text of the keyboardButtonTypeWebApp button, which opened the Web App
    , _data       :: Maybe T.Text -- ^ The data
    }
  | MessagePassportDataSent -- ^ Telegram Passport data has been sent to a bot
    { types :: Maybe [PassportElementType.PassportElementType] -- ^ List of Telegram Passport element types sent
    }
  | MessagePassportDataReceived -- ^ Telegram Passport data has been received; for bots only
    { elements    :: Maybe [EncryptedPassportElement.EncryptedPassportElement] -- ^ List of received Telegram Passport elements
    , credentials :: Maybe EncryptedCredentials.EncryptedCredentials           -- ^ Encrypted data credentials
    }
  | MessageProximityAlertTriggered -- ^ A user in the chat came within proximity alert range
    { traveler_id :: Maybe MessageSender.MessageSender -- ^ The identifier of a user or chat that triggered the proximity alert
    , watcher_id  :: Maybe MessageSender.MessageSender -- ^ The identifier of a user or chat that subscribed for the proximity alert
    , distance    :: Maybe Int                         -- ^ The distance between the users
    }
  | MessageUnsupported -- ^ A message content that is not supported in the current TDLib version
  deriving (Eq, Show)

instance I.ShortShow MessageContent where
  shortShow MessageText
    { text                 = text_
    , link_preview         = link_preview_
    , link_preview_options = link_preview_options_
    }
      = "MessageText"
        ++ I.cc
        [ "text"                 `I.p` text_
        , "link_preview"         `I.p` link_preview_
        , "link_preview_options" `I.p` link_preview_options_
        ]
  shortShow MessageAnimation
    { animation                = animation_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , has_spoiler              = has_spoiler_
    , is_secret                = is_secret_
    }
      = "MessageAnimation"
        ++ I.cc
        [ "animation"                `I.p` animation_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "has_spoiler"              `I.p` has_spoiler_
        , "is_secret"                `I.p` is_secret_
        ]
  shortShow MessageAudio
    { audio   = audio_
    , caption = caption_
    }
      = "MessageAudio"
        ++ I.cc
        [ "audio"   `I.p` audio_
        , "caption" `I.p` caption_
        ]
  shortShow MessageDocument
    { document = document_
    , caption  = caption_
    }
      = "MessageDocument"
        ++ I.cc
        [ "document" `I.p` document_
        , "caption"  `I.p` caption_
        ]
  shortShow MessagePaidMedia
    { star_count               = star_count_
    , media                    = media_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    }
      = "MessagePaidMedia"
        ++ I.cc
        [ "star_count"               `I.p` star_count_
        , "media"                    `I.p` media_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        ]
  shortShow MessagePhoto
    { photo                    = photo_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , has_spoiler              = has_spoiler_
    , is_secret                = is_secret_
    }
      = "MessagePhoto"
        ++ I.cc
        [ "photo"                    `I.p` photo_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "has_spoiler"              `I.p` has_spoiler_
        , "is_secret"                `I.p` is_secret_
        ]
  shortShow MessageSticker
    { sticker    = sticker_
    , is_premium = is_premium_
    }
      = "MessageSticker"
        ++ I.cc
        [ "sticker"    `I.p` sticker_
        , "is_premium" `I.p` is_premium_
        ]
  shortShow MessageVideo
    { video                    = video_
    , alternative_videos       = alternative_videos_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , has_spoiler              = has_spoiler_
    , is_secret                = is_secret_
    }
      = "MessageVideo"
        ++ I.cc
        [ "video"                    `I.p` video_
        , "alternative_videos"       `I.p` alternative_videos_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "has_spoiler"              `I.p` has_spoiler_
        , "is_secret"                `I.p` is_secret_
        ]
  shortShow MessageVideoNote
    { video_note = video_note_
    , is_viewed  = is_viewed_
    , is_secret  = is_secret_
    }
      = "MessageVideoNote"
        ++ I.cc
        [ "video_note" `I.p` video_note_
        , "is_viewed"  `I.p` is_viewed_
        , "is_secret"  `I.p` is_secret_
        ]
  shortShow MessageVoiceNote
    { voice_note  = voice_note_
    , caption     = caption_
    , is_listened = is_listened_
    }
      = "MessageVoiceNote"
        ++ I.cc
        [ "voice_note"  `I.p` voice_note_
        , "caption"     `I.p` caption_
        , "is_listened" `I.p` is_listened_
        ]
  shortShow MessageExpiredPhoto
      = "MessageExpiredPhoto"
  shortShow MessageExpiredVideo
      = "MessageExpiredVideo"
  shortShow MessageExpiredVideoNote
      = "MessageExpiredVideoNote"
  shortShow MessageExpiredVoiceNote
      = "MessageExpiredVoiceNote"
  shortShow MessageLocation
    { location               = location_
    , live_period            = live_period_
    , expires_in             = expires_in_
    , heading                = heading_
    , proximity_alert_radius = proximity_alert_radius_
    }
      = "MessageLocation"
        ++ I.cc
        [ "location"               `I.p` location_
        , "live_period"            `I.p` live_period_
        , "expires_in"             `I.p` expires_in_
        , "heading"                `I.p` heading_
        , "proximity_alert_radius" `I.p` proximity_alert_radius_
        ]
  shortShow MessageVenue
    { venue = venue_
    }
      = "MessageVenue"
        ++ I.cc
        [ "venue" `I.p` venue_
        ]
  shortShow MessageContact
    { contact = contact_
    }
      = "MessageContact"
        ++ I.cc
        [ "contact" `I.p` contact_
        ]
  shortShow MessageAnimatedEmoji
    { animated_emoji = animated_emoji_
    , emoji          = emoji_
    }
      = "MessageAnimatedEmoji"
        ++ I.cc
        [ "animated_emoji" `I.p` animated_emoji_
        , "emoji"          `I.p` emoji_
        ]
  shortShow MessageDice
    { initial_state                  = initial_state_
    , final_state                    = final_state_
    , emoji                          = emoji_
    , value                          = value_
    , success_animation_frame_number = success_animation_frame_number_
    }
      = "MessageDice"
        ++ I.cc
        [ "initial_state"                  `I.p` initial_state_
        , "final_state"                    `I.p` final_state_
        , "emoji"                          `I.p` emoji_
        , "value"                          `I.p` value_
        , "success_animation_frame_number" `I.p` success_animation_frame_number_
        ]
  shortShow MessageGame
    { game = game_
    }
      = "MessageGame"
        ++ I.cc
        [ "game" `I.p` game_
        ]
  shortShow MessagePoll
    { poll = poll_
    }
      = "MessagePoll"
        ++ I.cc
        [ "poll" `I.p` poll_
        ]
  shortShow MessageStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    , via_mention          = via_mention_
    }
      = "MessageStory"
        ++ I.cc
        [ "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        , "via_mention"          `I.p` via_mention_
        ]
  shortShow MessageInvoice
    { product_info          = product_info_
    , currency              = currency_
    , total_amount          = total_amount_
    , start_parameter       = start_parameter_
    , is_test               = is_test_
    , need_shipping_address = need_shipping_address_
    , receipt_message_id    = receipt_message_id_
    , paid_media            = paid_media_
    , paid_media_caption    = paid_media_caption_
    }
      = "MessageInvoice"
        ++ I.cc
        [ "product_info"          `I.p` product_info_
        , "currency"              `I.p` currency_
        , "total_amount"          `I.p` total_amount_
        , "start_parameter"       `I.p` start_parameter_
        , "is_test"               `I.p` is_test_
        , "need_shipping_address" `I.p` need_shipping_address_
        , "receipt_message_id"    `I.p` receipt_message_id_
        , "paid_media"            `I.p` paid_media_
        , "paid_media_caption"    `I.p` paid_media_caption_
        ]
  shortShow MessageCall
    { is_video       = is_video_
    , discard_reason = discard_reason_
    , duration       = duration_
    }
      = "MessageCall"
        ++ I.cc
        [ "is_video"       `I.p` is_video_
        , "discard_reason" `I.p` discard_reason_
        , "duration"       `I.p` duration_
        ]
  shortShow MessageVideoChatScheduled
    { group_call_id = group_call_id_
    , start_date    = start_date_
    }
      = "MessageVideoChatScheduled"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        , "start_date"    `I.p` start_date_
        ]
  shortShow MessageVideoChatStarted
    { group_call_id = group_call_id_
    }
      = "MessageVideoChatStarted"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        ]
  shortShow MessageVideoChatEnded
    { duration = duration_
    }
      = "MessageVideoChatEnded"
        ++ I.cc
        [ "duration" `I.p` duration_
        ]
  shortShow MessageInviteVideoChatParticipants
    { group_call_id = group_call_id_
    , user_ids      = user_ids_
    }
      = "MessageInviteVideoChatParticipants"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        , "user_ids"      `I.p` user_ids_
        ]
  shortShow MessageBasicGroupChatCreate
    { title           = title_
    , member_user_ids = member_user_ids_
    }
      = "MessageBasicGroupChatCreate"
        ++ I.cc
        [ "title"           `I.p` title_
        , "member_user_ids" `I.p` member_user_ids_
        ]
  shortShow MessageSupergroupChatCreate
    { title = title_
    }
      = "MessageSupergroupChatCreate"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  shortShow MessageChatChangeTitle
    { title = title_
    }
      = "MessageChatChangeTitle"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  shortShow MessageChatChangePhoto
    { _photo = _photo_
    }
      = "MessageChatChangePhoto"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        ]
  shortShow MessageChatDeletePhoto
      = "MessageChatDeletePhoto"
  shortShow MessageChatAddMembers
    { member_user_ids = member_user_ids_
    }
      = "MessageChatAddMembers"
        ++ I.cc
        [ "member_user_ids" `I.p` member_user_ids_
        ]
  shortShow MessageChatJoinByLink
      = "MessageChatJoinByLink"
  shortShow MessageChatJoinByRequest
      = "MessageChatJoinByRequest"
  shortShow MessageChatDeleteMember
    { user_id = user_id_
    }
      = "MessageChatDeleteMember"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow MessageChatUpgradeTo
    { supergroup_id = supergroup_id_
    }
      = "MessageChatUpgradeTo"
        ++ I.cc
        [ "supergroup_id" `I.p` supergroup_id_
        ]
  shortShow MessageChatUpgradeFrom
    { title          = title_
    , basic_group_id = basic_group_id_
    }
      = "MessageChatUpgradeFrom"
        ++ I.cc
        [ "title"          `I.p` title_
        , "basic_group_id" `I.p` basic_group_id_
        ]
  shortShow MessagePinMessage
    { message_id = message_id_
    }
      = "MessagePinMessage"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        ]
  shortShow MessageScreenshotTaken
      = "MessageScreenshotTaken"
  shortShow MessageChatSetBackground
    { old_background_message_id = old_background_message_id_
    , background                = background_
    , only_for_self             = only_for_self_
    }
      = "MessageChatSetBackground"
        ++ I.cc
        [ "old_background_message_id" `I.p` old_background_message_id_
        , "background"                `I.p` background_
        , "only_for_self"             `I.p` only_for_self_
        ]
  shortShow MessageChatSetTheme
    { theme_name = theme_name_
    }
      = "MessageChatSetTheme"
        ++ I.cc
        [ "theme_name" `I.p` theme_name_
        ]
  shortShow MessageChatSetMessageAutoDeleteTime
    { message_auto_delete_time = message_auto_delete_time_
    , from_user_id             = from_user_id_
    }
      = "MessageChatSetMessageAutoDeleteTime"
        ++ I.cc
        [ "message_auto_delete_time" `I.p` message_auto_delete_time_
        , "from_user_id"             `I.p` from_user_id_
        ]
  shortShow MessageChatBoost
    { boost_count = boost_count_
    }
      = "MessageChatBoost"
        ++ I.cc
        [ "boost_count" `I.p` boost_count_
        ]
  shortShow MessageForumTopicCreated
    { name = name_
    , icon = icon_
    }
      = "MessageForumTopicCreated"
        ++ I.cc
        [ "name" `I.p` name_
        , "icon" `I.p` icon_
        ]
  shortShow MessageForumTopicEdited
    { name                      = name_
    , edit_icon_custom_emoji_id = edit_icon_custom_emoji_id_
    , icon_custom_emoji_id      = icon_custom_emoji_id_
    }
      = "MessageForumTopicEdited"
        ++ I.cc
        [ "name"                      `I.p` name_
        , "edit_icon_custom_emoji_id" `I.p` edit_icon_custom_emoji_id_
        , "icon_custom_emoji_id"      `I.p` icon_custom_emoji_id_
        ]
  shortShow MessageForumTopicIsClosedToggled
    { is_closed = is_closed_
    }
      = "MessageForumTopicIsClosedToggled"
        ++ I.cc
        [ "is_closed" `I.p` is_closed_
        ]
  shortShow MessageForumTopicIsHiddenToggled
    { is_hidden = is_hidden_
    }
      = "MessageForumTopicIsHiddenToggled"
        ++ I.cc
        [ "is_hidden" `I.p` is_hidden_
        ]
  shortShow MessageSuggestProfilePhoto
    { _photo = _photo_
    }
      = "MessageSuggestProfilePhoto"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        ]
  shortShow MessageCustomServiceAction
    { _text = _text_
    }
      = "MessageCustomServiceAction"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow MessageGameScore
    { game_message_id = game_message_id_
    , game_id         = game_id_
    , score           = score_
    }
      = "MessageGameScore"
        ++ I.cc
        [ "game_message_id" `I.p` game_message_id_
        , "game_id"         `I.p` game_id_
        , "score"           `I.p` score_
        ]
  shortShow MessagePaymentSuccessful
    { invoice_chat_id         = invoice_chat_id_
    , invoice_message_id      = invoice_message_id_
    , currency                = currency_
    , total_amount            = total_amount_
    , subscription_until_date = subscription_until_date_
    , is_recurring            = is_recurring_
    , is_first_recurring      = is_first_recurring_
    , invoice_name            = invoice_name_
    }
      = "MessagePaymentSuccessful"
        ++ I.cc
        [ "invoice_chat_id"         `I.p` invoice_chat_id_
        , "invoice_message_id"      `I.p` invoice_message_id_
        , "currency"                `I.p` currency_
        , "total_amount"            `I.p` total_amount_
        , "subscription_until_date" `I.p` subscription_until_date_
        , "is_recurring"            `I.p` is_recurring_
        , "is_first_recurring"      `I.p` is_first_recurring_
        , "invoice_name"            `I.p` invoice_name_
        ]
  shortShow MessagePaymentSuccessfulBot
    { currency                   = currency_
    , total_amount               = total_amount_
    , subscription_until_date    = subscription_until_date_
    , is_recurring               = is_recurring_
    , is_first_recurring         = is_first_recurring_
    , invoice_payload            = invoice_payload_
    , shipping_option_id         = shipping_option_id_
    , order_info                 = order_info_
    , telegram_payment_charge_id = telegram_payment_charge_id_
    , provider_payment_charge_id = provider_payment_charge_id_
    }
      = "MessagePaymentSuccessfulBot"
        ++ I.cc
        [ "currency"                   `I.p` currency_
        , "total_amount"               `I.p` total_amount_
        , "subscription_until_date"    `I.p` subscription_until_date_
        , "is_recurring"               `I.p` is_recurring_
        , "is_first_recurring"         `I.p` is_first_recurring_
        , "invoice_payload"            `I.p` invoice_payload_
        , "shipping_option_id"         `I.p` shipping_option_id_
        , "order_info"                 `I.p` order_info_
        , "telegram_payment_charge_id" `I.p` telegram_payment_charge_id_
        , "provider_payment_charge_id" `I.p` provider_payment_charge_id_
        ]
  shortShow MessagePaymentRefunded
    { owner_id                   = owner_id_
    , currency                   = currency_
    , total_amount               = total_amount_
    , invoice_payload            = invoice_payload_
    , telegram_payment_charge_id = telegram_payment_charge_id_
    , provider_payment_charge_id = provider_payment_charge_id_
    }
      = "MessagePaymentRefunded"
        ++ I.cc
        [ "owner_id"                   `I.p` owner_id_
        , "currency"                   `I.p` currency_
        , "total_amount"               `I.p` total_amount_
        , "invoice_payload"            `I.p` invoice_payload_
        , "telegram_payment_charge_id" `I.p` telegram_payment_charge_id_
        , "provider_payment_charge_id" `I.p` provider_payment_charge_id_
        ]
  shortShow MessageGiftedPremium
    { gifter_user_id        = gifter_user_id_
    , receiver_user_id      = receiver_user_id_
    , text                  = text_
    , currency              = currency_
    , amount                = amount_
    , cryptocurrency        = cryptocurrency_
    , cryptocurrency_amount = cryptocurrency_amount_
    , month_count           = month_count_
    , sticker               = sticker_
    }
      = "MessageGiftedPremium"
        ++ I.cc
        [ "gifter_user_id"        `I.p` gifter_user_id_
        , "receiver_user_id"      `I.p` receiver_user_id_
        , "text"                  `I.p` text_
        , "currency"              `I.p` currency_
        , "amount"                `I.p` amount_
        , "cryptocurrency"        `I.p` cryptocurrency_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "month_count"           `I.p` month_count_
        , "sticker"               `I.p` sticker_
        ]
  shortShow MessagePremiumGiftCode
    { creator_id            = creator_id_
    , text                  = text_
    , is_from_giveaway      = is_from_giveaway_
    , is_unclaimed          = is_unclaimed_
    , currency              = currency_
    , amount                = amount_
    , cryptocurrency        = cryptocurrency_
    , cryptocurrency_amount = cryptocurrency_amount_
    , month_count           = month_count_
    , sticker               = sticker_
    , code                  = code_
    }
      = "MessagePremiumGiftCode"
        ++ I.cc
        [ "creator_id"            `I.p` creator_id_
        , "text"                  `I.p` text_
        , "is_from_giveaway"      `I.p` is_from_giveaway_
        , "is_unclaimed"          `I.p` is_unclaimed_
        , "currency"              `I.p` currency_
        , "amount"                `I.p` amount_
        , "cryptocurrency"        `I.p` cryptocurrency_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "month_count"           `I.p` month_count_
        , "sticker"               `I.p` sticker_
        , "code"                  `I.p` code_
        ]
  shortShow MessageGiveawayCreated
    { star_count = star_count_
    }
      = "MessageGiveawayCreated"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]
  shortShow MessageGiveaway
    { parameters   = parameters_
    , winner_count = winner_count_
    , prize        = prize_
    , sticker      = sticker_
    }
      = "MessageGiveaway"
        ++ I.cc
        [ "parameters"   `I.p` parameters_
        , "winner_count" `I.p` winner_count_
        , "prize"        `I.p` prize_
        , "sticker"      `I.p` sticker_
        ]
  shortShow MessageGiveawayCompleted
    { giveaway_message_id   = giveaway_message_id_
    , winner_count          = winner_count_
    , is_star_giveaway      = is_star_giveaway_
    , unclaimed_prize_count = unclaimed_prize_count_
    }
      = "MessageGiveawayCompleted"
        ++ I.cc
        [ "giveaway_message_id"   `I.p` giveaway_message_id_
        , "winner_count"          `I.p` winner_count_
        , "is_star_giveaway"      `I.p` is_star_giveaway_
        , "unclaimed_prize_count" `I.p` unclaimed_prize_count_
        ]
  shortShow MessageGiveawayWinners
    { boosted_chat_id               = boosted_chat_id_
    , giveaway_message_id           = giveaway_message_id_
    , additional_chat_count         = additional_chat_count_
    , actual_winners_selection_date = actual_winners_selection_date_
    , only_new_members              = only_new_members_
    , was_refunded                  = was_refunded_
    , prize                         = prize_
    , prize_description             = prize_description_
    , winner_count                  = winner_count_
    , winner_user_ids               = winner_user_ids_
    , unclaimed_prize_count         = unclaimed_prize_count_
    }
      = "MessageGiveawayWinners"
        ++ I.cc
        [ "boosted_chat_id"               `I.p` boosted_chat_id_
        , "giveaway_message_id"           `I.p` giveaway_message_id_
        , "additional_chat_count"         `I.p` additional_chat_count_
        , "actual_winners_selection_date" `I.p` actual_winners_selection_date_
        , "only_new_members"              `I.p` only_new_members_
        , "was_refunded"                  `I.p` was_refunded_
        , "prize"                         `I.p` prize_
        , "prize_description"             `I.p` prize_description_
        , "winner_count"                  `I.p` winner_count_
        , "winner_user_ids"               `I.p` winner_user_ids_
        , "unclaimed_prize_count"         `I.p` unclaimed_prize_count_
        ]
  shortShow MessageGiftedStars
    { gifter_user_id        = gifter_user_id_
    , receiver_user_id      = receiver_user_id_
    , currency              = currency_
    , amount                = amount_
    , cryptocurrency        = cryptocurrency_
    , cryptocurrency_amount = cryptocurrency_amount_
    , star_count            = star_count_
    , transaction_id        = transaction_id_
    , sticker               = sticker_
    }
      = "MessageGiftedStars"
        ++ I.cc
        [ "gifter_user_id"        `I.p` gifter_user_id_
        , "receiver_user_id"      `I.p` receiver_user_id_
        , "currency"              `I.p` currency_
        , "amount"                `I.p` amount_
        , "cryptocurrency"        `I.p` cryptocurrency_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "star_count"            `I.p` star_count_
        , "transaction_id"        `I.p` transaction_id_
        , "sticker"               `I.p` sticker_
        ]
  shortShow MessageGiveawayPrizeStars
    { star_count          = star_count_
    , transaction_id      = transaction_id_
    , boosted_chat_id     = boosted_chat_id_
    , giveaway_message_id = giveaway_message_id_
    , is_unclaimed        = is_unclaimed_
    , sticker             = sticker_
    }
      = "MessageGiveawayPrizeStars"
        ++ I.cc
        [ "star_count"          `I.p` star_count_
        , "transaction_id"      `I.p` transaction_id_
        , "boosted_chat_id"     `I.p` boosted_chat_id_
        , "giveaway_message_id" `I.p` giveaway_message_id_
        , "is_unclaimed"        `I.p` is_unclaimed_
        , "sticker"             `I.p` sticker_
        ]
  shortShow MessageGift
    { gift            = gift_
    , text            = text_
    , sell_star_count = sell_star_count_
    , is_private      = is_private_
    , is_saved        = is_saved_
    , was_converted   = was_converted_
    }
      = "MessageGift"
        ++ I.cc
        [ "gift"            `I.p` gift_
        , "text"            `I.p` text_
        , "sell_star_count" `I.p` sell_star_count_
        , "is_private"      `I.p` is_private_
        , "is_saved"        `I.p` is_saved_
        , "was_converted"   `I.p` was_converted_
        ]
  shortShow MessageContactRegistered
      = "MessageContactRegistered"
  shortShow MessageUsersShared
    { users     = users_
    , button_id = button_id_
    }
      = "MessageUsersShared"
        ++ I.cc
        [ "users"     `I.p` users_
        , "button_id" `I.p` button_id_
        ]
  shortShow MessageChatShared
    { chat      = chat_
    , button_id = button_id_
    }
      = "MessageChatShared"
        ++ I.cc
        [ "chat"      `I.p` chat_
        , "button_id" `I.p` button_id_
        ]
  shortShow MessageBotWriteAccessAllowed
    { reason = reason_
    }
      = "MessageBotWriteAccessAllowed"
        ++ I.cc
        [ "reason" `I.p` reason_
        ]
  shortShow MessageWebAppDataSent
    { button_text = button_text_
    }
      = "MessageWebAppDataSent"
        ++ I.cc
        [ "button_text" `I.p` button_text_
        ]
  shortShow MessageWebAppDataReceived
    { button_text = button_text_
    , _data       = _data_
    }
      = "MessageWebAppDataReceived"
        ++ I.cc
        [ "button_text" `I.p` button_text_
        , "_data"       `I.p` _data_
        ]
  shortShow MessagePassportDataSent
    { types = types_
    }
      = "MessagePassportDataSent"
        ++ I.cc
        [ "types" `I.p` types_
        ]
  shortShow MessagePassportDataReceived
    { elements    = elements_
    , credentials = credentials_
    }
      = "MessagePassportDataReceived"
        ++ I.cc
        [ "elements"    `I.p` elements_
        , "credentials" `I.p` credentials_
        ]
  shortShow MessageProximityAlertTriggered
    { traveler_id = traveler_id_
    , watcher_id  = watcher_id_
    , distance    = distance_
    }
      = "MessageProximityAlertTriggered"
        ++ I.cc
        [ "traveler_id" `I.p` traveler_id_
        , "watcher_id"  `I.p` watcher_id_
        , "distance"    `I.p` distance_
        ]
  shortShow MessageUnsupported
      = "MessageUnsupported"

instance AT.FromJSON MessageContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageText"                         -> parseMessageText v
      "messageAnimation"                    -> parseMessageAnimation v
      "messageAudio"                        -> parseMessageAudio v
      "messageDocument"                     -> parseMessageDocument v
      "messagePaidMedia"                    -> parseMessagePaidMedia v
      "messagePhoto"                        -> parseMessagePhoto v
      "messageSticker"                      -> parseMessageSticker v
      "messageVideo"                        -> parseMessageVideo v
      "messageVideoNote"                    -> parseMessageVideoNote v
      "messageVoiceNote"                    -> parseMessageVoiceNote v
      "messageExpiredPhoto"                 -> pure MessageExpiredPhoto
      "messageExpiredVideo"                 -> pure MessageExpiredVideo
      "messageExpiredVideoNote"             -> pure MessageExpiredVideoNote
      "messageExpiredVoiceNote"             -> pure MessageExpiredVoiceNote
      "messageLocation"                     -> parseMessageLocation v
      "messageVenue"                        -> parseMessageVenue v
      "messageContact"                      -> parseMessageContact v
      "messageAnimatedEmoji"                -> parseMessageAnimatedEmoji v
      "messageDice"                         -> parseMessageDice v
      "messageGame"                         -> parseMessageGame v
      "messagePoll"                         -> parseMessagePoll v
      "messageStory"                        -> parseMessageStory v
      "messageInvoice"                      -> parseMessageInvoice v
      "messageCall"                         -> parseMessageCall v
      "messageVideoChatScheduled"           -> parseMessageVideoChatScheduled v
      "messageVideoChatStarted"             -> parseMessageVideoChatStarted v
      "messageVideoChatEnded"               -> parseMessageVideoChatEnded v
      "messageInviteVideoChatParticipants"  -> parseMessageInviteVideoChatParticipants v
      "messageBasicGroupChatCreate"         -> parseMessageBasicGroupChatCreate v
      "messageSupergroupChatCreate"         -> parseMessageSupergroupChatCreate v
      "messageChatChangeTitle"              -> parseMessageChatChangeTitle v
      "messageChatChangePhoto"              -> parseMessageChatChangePhoto v
      "messageChatDeletePhoto"              -> pure MessageChatDeletePhoto
      "messageChatAddMembers"               -> parseMessageChatAddMembers v
      "messageChatJoinByLink"               -> pure MessageChatJoinByLink
      "messageChatJoinByRequest"            -> pure MessageChatJoinByRequest
      "messageChatDeleteMember"             -> parseMessageChatDeleteMember v
      "messageChatUpgradeTo"                -> parseMessageChatUpgradeTo v
      "messageChatUpgradeFrom"              -> parseMessageChatUpgradeFrom v
      "messagePinMessage"                   -> parseMessagePinMessage v
      "messageScreenshotTaken"              -> pure MessageScreenshotTaken
      "messageChatSetBackground"            -> parseMessageChatSetBackground v
      "messageChatSetTheme"                 -> parseMessageChatSetTheme v
      "messageChatSetMessageAutoDeleteTime" -> parseMessageChatSetMessageAutoDeleteTime v
      "messageChatBoost"                    -> parseMessageChatBoost v
      "messageForumTopicCreated"            -> parseMessageForumTopicCreated v
      "messageForumTopicEdited"             -> parseMessageForumTopicEdited v
      "messageForumTopicIsClosedToggled"    -> parseMessageForumTopicIsClosedToggled v
      "messageForumTopicIsHiddenToggled"    -> parseMessageForumTopicIsHiddenToggled v
      "messageSuggestProfilePhoto"          -> parseMessageSuggestProfilePhoto v
      "messageCustomServiceAction"          -> parseMessageCustomServiceAction v
      "messageGameScore"                    -> parseMessageGameScore v
      "messagePaymentSuccessful"            -> parseMessagePaymentSuccessful v
      "messagePaymentSuccessfulBot"         -> parseMessagePaymentSuccessfulBot v
      "messagePaymentRefunded"              -> parseMessagePaymentRefunded v
      "messageGiftedPremium"                -> parseMessageGiftedPremium v
      "messagePremiumGiftCode"              -> parseMessagePremiumGiftCode v
      "messageGiveawayCreated"              -> parseMessageGiveawayCreated v
      "messageGiveaway"                     -> parseMessageGiveaway v
      "messageGiveawayCompleted"            -> parseMessageGiveawayCompleted v
      "messageGiveawayWinners"              -> parseMessageGiveawayWinners v
      "messageGiftedStars"                  -> parseMessageGiftedStars v
      "messageGiveawayPrizeStars"           -> parseMessageGiveawayPrizeStars v
      "messageGift"                         -> parseMessageGift v
      "messageContactRegistered"            -> pure MessageContactRegistered
      "messageUsersShared"                  -> parseMessageUsersShared v
      "messageChatShared"                   -> parseMessageChatShared v
      "messageBotWriteAccessAllowed"        -> parseMessageBotWriteAccessAllowed v
      "messageWebAppDataSent"               -> parseMessageWebAppDataSent v
      "messageWebAppDataReceived"           -> parseMessageWebAppDataReceived v
      "messagePassportDataSent"             -> parseMessagePassportDataSent v
      "messagePassportDataReceived"         -> parseMessagePassportDataReceived v
      "messageProximityAlertTriggered"      -> parseMessageProximityAlertTriggered v
      "messageUnsupported"                  -> pure MessageUnsupported
      _                                     -> mempty
    
    where
      parseMessageText :: A.Value -> AT.Parser MessageContent
      parseMessageText = A.withObject "MessageText" $ \o -> do
        text_                 <- o A..:?  "text"
        link_preview_         <- o A..:?  "link_preview"
        link_preview_options_ <- o A..:?  "link_preview_options"
        pure $ MessageText
          { text                 = text_
          , link_preview         = link_preview_
          , link_preview_options = link_preview_options_
          }
      parseMessageAnimation :: A.Value -> AT.Parser MessageContent
      parseMessageAnimation = A.withObject "MessageAnimation" $ \o -> do
        animation_                <- o A..:?  "animation"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        has_spoiler_              <- o A..:?  "has_spoiler"
        is_secret_                <- o A..:?  "is_secret"
        pure $ MessageAnimation
          { animation                = animation_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , has_spoiler              = has_spoiler_
          , is_secret                = is_secret_
          }
      parseMessageAudio :: A.Value -> AT.Parser MessageContent
      parseMessageAudio = A.withObject "MessageAudio" $ \o -> do
        audio_   <- o A..:?  "audio"
        caption_ <- o A..:?  "caption"
        pure $ MessageAudio
          { audio   = audio_
          , caption = caption_
          }
      parseMessageDocument :: A.Value -> AT.Parser MessageContent
      parseMessageDocument = A.withObject "MessageDocument" $ \o -> do
        document_ <- o A..:?  "document"
        caption_  <- o A..:?  "caption"
        pure $ MessageDocument
          { document = document_
          , caption  = caption_
          }
      parseMessagePaidMedia :: A.Value -> AT.Parser MessageContent
      parseMessagePaidMedia = A.withObject "MessagePaidMedia" $ \o -> do
        star_count_               <- o A..:?  "star_count"
        media_                    <- o A..:?  "media"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        pure $ MessagePaidMedia
          { star_count               = star_count_
          , media                    = media_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          }
      parseMessagePhoto :: A.Value -> AT.Parser MessageContent
      parseMessagePhoto = A.withObject "MessagePhoto" $ \o -> do
        photo_                    <- o A..:?  "photo"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        has_spoiler_              <- o A..:?  "has_spoiler"
        is_secret_                <- o A..:?  "is_secret"
        pure $ MessagePhoto
          { photo                    = photo_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , has_spoiler              = has_spoiler_
          , is_secret                = is_secret_
          }
      parseMessageSticker :: A.Value -> AT.Parser MessageContent
      parseMessageSticker = A.withObject "MessageSticker" $ \o -> do
        sticker_    <- o A..:?  "sticker"
        is_premium_ <- o A..:?  "is_premium"
        pure $ MessageSticker
          { sticker    = sticker_
          , is_premium = is_premium_
          }
      parseMessageVideo :: A.Value -> AT.Parser MessageContent
      parseMessageVideo = A.withObject "MessageVideo" $ \o -> do
        video_                    <- o A..:?  "video"
        alternative_videos_       <- o A..:?  "alternative_videos"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        has_spoiler_              <- o A..:?  "has_spoiler"
        is_secret_                <- o A..:?  "is_secret"
        pure $ MessageVideo
          { video                    = video_
          , alternative_videos       = alternative_videos_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , has_spoiler              = has_spoiler_
          , is_secret                = is_secret_
          }
      parseMessageVideoNote :: A.Value -> AT.Parser MessageContent
      parseMessageVideoNote = A.withObject "MessageVideoNote" $ \o -> do
        video_note_ <- o A..:?  "video_note"
        is_viewed_  <- o A..:?  "is_viewed"
        is_secret_  <- o A..:?  "is_secret"
        pure $ MessageVideoNote
          { video_note = video_note_
          , is_viewed  = is_viewed_
          , is_secret  = is_secret_
          }
      parseMessageVoiceNote :: A.Value -> AT.Parser MessageContent
      parseMessageVoiceNote = A.withObject "MessageVoiceNote" $ \o -> do
        voice_note_  <- o A..:?  "voice_note"
        caption_     <- o A..:?  "caption"
        is_listened_ <- o A..:?  "is_listened"
        pure $ MessageVoiceNote
          { voice_note  = voice_note_
          , caption     = caption_
          , is_listened = is_listened_
          }
      parseMessageLocation :: A.Value -> AT.Parser MessageContent
      parseMessageLocation = A.withObject "MessageLocation" $ \o -> do
        location_               <- o A..:?  "location"
        live_period_            <- o A..:?  "live_period"
        expires_in_             <- o A..:?  "expires_in"
        heading_                <- o A..:?  "heading"
        proximity_alert_radius_ <- o A..:?  "proximity_alert_radius"
        pure $ MessageLocation
          { location               = location_
          , live_period            = live_period_
          , expires_in             = expires_in_
          , heading                = heading_
          , proximity_alert_radius = proximity_alert_radius_
          }
      parseMessageVenue :: A.Value -> AT.Parser MessageContent
      parseMessageVenue = A.withObject "MessageVenue" $ \o -> do
        venue_ <- o A..:?  "venue"
        pure $ MessageVenue
          { venue = venue_
          }
      parseMessageContact :: A.Value -> AT.Parser MessageContent
      parseMessageContact = A.withObject "MessageContact" $ \o -> do
        contact_ <- o A..:?  "contact"
        pure $ MessageContact
          { contact = contact_
          }
      parseMessageAnimatedEmoji :: A.Value -> AT.Parser MessageContent
      parseMessageAnimatedEmoji = A.withObject "MessageAnimatedEmoji" $ \o -> do
        animated_emoji_ <- o A..:?  "animated_emoji"
        emoji_          <- o A..:?  "emoji"
        pure $ MessageAnimatedEmoji
          { animated_emoji = animated_emoji_
          , emoji          = emoji_
          }
      parseMessageDice :: A.Value -> AT.Parser MessageContent
      parseMessageDice = A.withObject "MessageDice" $ \o -> do
        initial_state_                  <- o A..:?  "initial_state"
        final_state_                    <- o A..:?  "final_state"
        emoji_                          <- o A..:?  "emoji"
        value_                          <- o A..:?  "value"
        success_animation_frame_number_ <- o A..:?  "success_animation_frame_number"
        pure $ MessageDice
          { initial_state                  = initial_state_
          , final_state                    = final_state_
          , emoji                          = emoji_
          , value                          = value_
          , success_animation_frame_number = success_animation_frame_number_
          }
      parseMessageGame :: A.Value -> AT.Parser MessageContent
      parseMessageGame = A.withObject "MessageGame" $ \o -> do
        game_ <- o A..:?  "game"
        pure $ MessageGame
          { game = game_
          }
      parseMessagePoll :: A.Value -> AT.Parser MessageContent
      parseMessagePoll = A.withObject "MessagePoll" $ \o -> do
        poll_ <- o A..:?  "poll"
        pure $ MessagePoll
          { poll = poll_
          }
      parseMessageStory :: A.Value -> AT.Parser MessageContent
      parseMessageStory = A.withObject "MessageStory" $ \o -> do
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        via_mention_          <- o A..:?  "via_mention"
        pure $ MessageStory
          { story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          , via_mention          = via_mention_
          }
      parseMessageInvoice :: A.Value -> AT.Parser MessageContent
      parseMessageInvoice = A.withObject "MessageInvoice" $ \o -> do
        product_info_          <- o A..:?  "product_info"
        currency_              <- o A..:?  "currency"
        total_amount_          <- o A..:?  "total_amount"
        start_parameter_       <- o A..:?  "start_parameter"
        is_test_               <- o A..:?  "is_test"
        need_shipping_address_ <- o A..:?  "need_shipping_address"
        receipt_message_id_    <- o A..:?  "receipt_message_id"
        paid_media_            <- o A..:?  "paid_media"
        paid_media_caption_    <- o A..:?  "paid_media_caption"
        pure $ MessageInvoice
          { product_info          = product_info_
          , currency              = currency_
          , total_amount          = total_amount_
          , start_parameter       = start_parameter_
          , is_test               = is_test_
          , need_shipping_address = need_shipping_address_
          , receipt_message_id    = receipt_message_id_
          , paid_media            = paid_media_
          , paid_media_caption    = paid_media_caption_
          }
      parseMessageCall :: A.Value -> AT.Parser MessageContent
      parseMessageCall = A.withObject "MessageCall" $ \o -> do
        is_video_       <- o A..:?  "is_video"
        discard_reason_ <- o A..:?  "discard_reason"
        duration_       <- o A..:?  "duration"
        pure $ MessageCall
          { is_video       = is_video_
          , discard_reason = discard_reason_
          , duration       = duration_
          }
      parseMessageVideoChatScheduled :: A.Value -> AT.Parser MessageContent
      parseMessageVideoChatScheduled = A.withObject "MessageVideoChatScheduled" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        start_date_    <- o A..:?  "start_date"
        pure $ MessageVideoChatScheduled
          { group_call_id = group_call_id_
          , start_date    = start_date_
          }
      parseMessageVideoChatStarted :: A.Value -> AT.Parser MessageContent
      parseMessageVideoChatStarted = A.withObject "MessageVideoChatStarted" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        pure $ MessageVideoChatStarted
          { group_call_id = group_call_id_
          }
      parseMessageVideoChatEnded :: A.Value -> AT.Parser MessageContent
      parseMessageVideoChatEnded = A.withObject "MessageVideoChatEnded" $ \o -> do
        duration_ <- o A..:?  "duration"
        pure $ MessageVideoChatEnded
          { duration = duration_
          }
      parseMessageInviteVideoChatParticipants :: A.Value -> AT.Parser MessageContent
      parseMessageInviteVideoChatParticipants = A.withObject "MessageInviteVideoChatParticipants" $ \o -> do
        group_call_id_ <- o A..:?  "group_call_id"
        user_ids_      <- o A..:?  "user_ids"
        pure $ MessageInviteVideoChatParticipants
          { group_call_id = group_call_id_
          , user_ids      = user_ids_
          }
      parseMessageBasicGroupChatCreate :: A.Value -> AT.Parser MessageContent
      parseMessageBasicGroupChatCreate = A.withObject "MessageBasicGroupChatCreate" $ \o -> do
        title_           <- o A..:?  "title"
        member_user_ids_ <- o A..:?  "member_user_ids"
        pure $ MessageBasicGroupChatCreate
          { title           = title_
          , member_user_ids = member_user_ids_
          }
      parseMessageSupergroupChatCreate :: A.Value -> AT.Parser MessageContent
      parseMessageSupergroupChatCreate = A.withObject "MessageSupergroupChatCreate" $ \o -> do
        title_ <- o A..:?  "title"
        pure $ MessageSupergroupChatCreate
          { title = title_
          }
      parseMessageChatChangeTitle :: A.Value -> AT.Parser MessageContent
      parseMessageChatChangeTitle = A.withObject "MessageChatChangeTitle" $ \o -> do
        title_ <- o A..:?  "title"
        pure $ MessageChatChangeTitle
          { title = title_
          }
      parseMessageChatChangePhoto :: A.Value -> AT.Parser MessageContent
      parseMessageChatChangePhoto = A.withObject "MessageChatChangePhoto" $ \o -> do
        _photo_ <- o A..:?  "photo"
        pure $ MessageChatChangePhoto
          { _photo = _photo_
          }
      parseMessageChatAddMembers :: A.Value -> AT.Parser MessageContent
      parseMessageChatAddMembers = A.withObject "MessageChatAddMembers" $ \o -> do
        member_user_ids_ <- o A..:?  "member_user_ids"
        pure $ MessageChatAddMembers
          { member_user_ids = member_user_ids_
          }
      parseMessageChatDeleteMember :: A.Value -> AT.Parser MessageContent
      parseMessageChatDeleteMember = A.withObject "MessageChatDeleteMember" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ MessageChatDeleteMember
          { user_id = user_id_
          }
      parseMessageChatUpgradeTo :: A.Value -> AT.Parser MessageContent
      parseMessageChatUpgradeTo = A.withObject "MessageChatUpgradeTo" $ \o -> do
        supergroup_id_ <- o A..:?  "supergroup_id"
        pure $ MessageChatUpgradeTo
          { supergroup_id = supergroup_id_
          }
      parseMessageChatUpgradeFrom :: A.Value -> AT.Parser MessageContent
      parseMessageChatUpgradeFrom = A.withObject "MessageChatUpgradeFrom" $ \o -> do
        title_          <- o A..:?  "title"
        basic_group_id_ <- o A..:?  "basic_group_id"
        pure $ MessageChatUpgradeFrom
          { title          = title_
          , basic_group_id = basic_group_id_
          }
      parseMessagePinMessage :: A.Value -> AT.Parser MessageContent
      parseMessagePinMessage = A.withObject "MessagePinMessage" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        pure $ MessagePinMessage
          { message_id = message_id_
          }
      parseMessageChatSetBackground :: A.Value -> AT.Parser MessageContent
      parseMessageChatSetBackground = A.withObject "MessageChatSetBackground" $ \o -> do
        old_background_message_id_ <- o A..:?  "old_background_message_id"
        background_                <- o A..:?  "background"
        only_for_self_             <- o A..:?  "only_for_self"
        pure $ MessageChatSetBackground
          { old_background_message_id = old_background_message_id_
          , background                = background_
          , only_for_self             = only_for_self_
          }
      parseMessageChatSetTheme :: A.Value -> AT.Parser MessageContent
      parseMessageChatSetTheme = A.withObject "MessageChatSetTheme" $ \o -> do
        theme_name_ <- o A..:?  "theme_name"
        pure $ MessageChatSetTheme
          { theme_name = theme_name_
          }
      parseMessageChatSetMessageAutoDeleteTime :: A.Value -> AT.Parser MessageContent
      parseMessageChatSetMessageAutoDeleteTime = A.withObject "MessageChatSetMessageAutoDeleteTime" $ \o -> do
        message_auto_delete_time_ <- o A..:?  "message_auto_delete_time"
        from_user_id_             <- o A..:?  "from_user_id"
        pure $ MessageChatSetMessageAutoDeleteTime
          { message_auto_delete_time = message_auto_delete_time_
          , from_user_id             = from_user_id_
          }
      parseMessageChatBoost :: A.Value -> AT.Parser MessageContent
      parseMessageChatBoost = A.withObject "MessageChatBoost" $ \o -> do
        boost_count_ <- o A..:?  "boost_count"
        pure $ MessageChatBoost
          { boost_count = boost_count_
          }
      parseMessageForumTopicCreated :: A.Value -> AT.Parser MessageContent
      parseMessageForumTopicCreated = A.withObject "MessageForumTopicCreated" $ \o -> do
        name_ <- o A..:?  "name"
        icon_ <- o A..:?  "icon"
        pure $ MessageForumTopicCreated
          { name = name_
          , icon = icon_
          }
      parseMessageForumTopicEdited :: A.Value -> AT.Parser MessageContent
      parseMessageForumTopicEdited = A.withObject "MessageForumTopicEdited" $ \o -> do
        name_                      <- o A..:?                       "name"
        edit_icon_custom_emoji_id_ <- o A..:?                       "edit_icon_custom_emoji_id"
        icon_custom_emoji_id_      <- fmap I.readInt64 <$> o A..:?  "icon_custom_emoji_id"
        pure $ MessageForumTopicEdited
          { name                      = name_
          , edit_icon_custom_emoji_id = edit_icon_custom_emoji_id_
          , icon_custom_emoji_id      = icon_custom_emoji_id_
          }
      parseMessageForumTopicIsClosedToggled :: A.Value -> AT.Parser MessageContent
      parseMessageForumTopicIsClosedToggled = A.withObject "MessageForumTopicIsClosedToggled" $ \o -> do
        is_closed_ <- o A..:?  "is_closed"
        pure $ MessageForumTopicIsClosedToggled
          { is_closed = is_closed_
          }
      parseMessageForumTopicIsHiddenToggled :: A.Value -> AT.Parser MessageContent
      parseMessageForumTopicIsHiddenToggled = A.withObject "MessageForumTopicIsHiddenToggled" $ \o -> do
        is_hidden_ <- o A..:?  "is_hidden"
        pure $ MessageForumTopicIsHiddenToggled
          { is_hidden = is_hidden_
          }
      parseMessageSuggestProfilePhoto :: A.Value -> AT.Parser MessageContent
      parseMessageSuggestProfilePhoto = A.withObject "MessageSuggestProfilePhoto" $ \o -> do
        _photo_ <- o A..:?  "photo"
        pure $ MessageSuggestProfilePhoto
          { _photo = _photo_
          }
      parseMessageCustomServiceAction :: A.Value -> AT.Parser MessageContent
      parseMessageCustomServiceAction = A.withObject "MessageCustomServiceAction" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ MessageCustomServiceAction
          { _text = _text_
          }
      parseMessageGameScore :: A.Value -> AT.Parser MessageContent
      parseMessageGameScore = A.withObject "MessageGameScore" $ \o -> do
        game_message_id_ <- o A..:?                       "game_message_id"
        game_id_         <- fmap I.readInt64 <$> o A..:?  "game_id"
        score_           <- o A..:?                       "score"
        pure $ MessageGameScore
          { game_message_id = game_message_id_
          , game_id         = game_id_
          , score           = score_
          }
      parseMessagePaymentSuccessful :: A.Value -> AT.Parser MessageContent
      parseMessagePaymentSuccessful = A.withObject "MessagePaymentSuccessful" $ \o -> do
        invoice_chat_id_         <- o A..:?  "invoice_chat_id"
        invoice_message_id_      <- o A..:?  "invoice_message_id"
        currency_                <- o A..:?  "currency"
        total_amount_            <- o A..:?  "total_amount"
        subscription_until_date_ <- o A..:?  "subscription_until_date"
        is_recurring_            <- o A..:?  "is_recurring"
        is_first_recurring_      <- o A..:?  "is_first_recurring"
        invoice_name_            <- o A..:?  "invoice_name"
        pure $ MessagePaymentSuccessful
          { invoice_chat_id         = invoice_chat_id_
          , invoice_message_id      = invoice_message_id_
          , currency                = currency_
          , total_amount            = total_amount_
          , subscription_until_date = subscription_until_date_
          , is_recurring            = is_recurring_
          , is_first_recurring      = is_first_recurring_
          , invoice_name            = invoice_name_
          }
      parseMessagePaymentSuccessfulBot :: A.Value -> AT.Parser MessageContent
      parseMessagePaymentSuccessfulBot = A.withObject "MessagePaymentSuccessfulBot" $ \o -> do
        currency_                   <- o A..:?                       "currency"
        total_amount_               <- o A..:?                       "total_amount"
        subscription_until_date_    <- o A..:?                       "subscription_until_date"
        is_recurring_               <- o A..:?                       "is_recurring"
        is_first_recurring_         <- o A..:?                       "is_first_recurring"
        invoice_payload_            <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        shipping_option_id_         <- o A..:?                       "shipping_option_id"
        order_info_                 <- o A..:?                       "order_info"
        telegram_payment_charge_id_ <- o A..:?                       "telegram_payment_charge_id"
        provider_payment_charge_id_ <- o A..:?                       "provider_payment_charge_id"
        pure $ MessagePaymentSuccessfulBot
          { currency                   = currency_
          , total_amount               = total_amount_
          , subscription_until_date    = subscription_until_date_
          , is_recurring               = is_recurring_
          , is_first_recurring         = is_first_recurring_
          , invoice_payload            = invoice_payload_
          , shipping_option_id         = shipping_option_id_
          , order_info                 = order_info_
          , telegram_payment_charge_id = telegram_payment_charge_id_
          , provider_payment_charge_id = provider_payment_charge_id_
          }
      parseMessagePaymentRefunded :: A.Value -> AT.Parser MessageContent
      parseMessagePaymentRefunded = A.withObject "MessagePaymentRefunded" $ \o -> do
        owner_id_                   <- o A..:?                       "owner_id"
        currency_                   <- o A..:?                       "currency"
        total_amount_               <- o A..:?                       "total_amount"
        invoice_payload_            <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        telegram_payment_charge_id_ <- o A..:?                       "telegram_payment_charge_id"
        provider_payment_charge_id_ <- o A..:?                       "provider_payment_charge_id"
        pure $ MessagePaymentRefunded
          { owner_id                   = owner_id_
          , currency                   = currency_
          , total_amount               = total_amount_
          , invoice_payload            = invoice_payload_
          , telegram_payment_charge_id = telegram_payment_charge_id_
          , provider_payment_charge_id = provider_payment_charge_id_
          }
      parseMessageGiftedPremium :: A.Value -> AT.Parser MessageContent
      parseMessageGiftedPremium = A.withObject "MessageGiftedPremium" $ \o -> do
        gifter_user_id_        <- o A..:?                       "gifter_user_id"
        receiver_user_id_      <- o A..:?                       "receiver_user_id"
        text_                  <- o A..:?                       "text"
        currency_              <- o A..:?                       "currency"
        amount_                <- o A..:?                       "amount"
        cryptocurrency_        <- o A..:?                       "cryptocurrency"
        cryptocurrency_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_amount"
        month_count_           <- o A..:?                       "month_count"
        sticker_               <- o A..:?                       "sticker"
        pure $ MessageGiftedPremium
          { gifter_user_id        = gifter_user_id_
          , receiver_user_id      = receiver_user_id_
          , text                  = text_
          , currency              = currency_
          , amount                = amount_
          , cryptocurrency        = cryptocurrency_
          , cryptocurrency_amount = cryptocurrency_amount_
          , month_count           = month_count_
          , sticker               = sticker_
          }
      parseMessagePremiumGiftCode :: A.Value -> AT.Parser MessageContent
      parseMessagePremiumGiftCode = A.withObject "MessagePremiumGiftCode" $ \o -> do
        creator_id_            <- o A..:?                       "creator_id"
        text_                  <- o A..:?                       "text"
        is_from_giveaway_      <- o A..:?                       "is_from_giveaway"
        is_unclaimed_          <- o A..:?                       "is_unclaimed"
        currency_              <- o A..:?                       "currency"
        amount_                <- o A..:?                       "amount"
        cryptocurrency_        <- o A..:?                       "cryptocurrency"
        cryptocurrency_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_amount"
        month_count_           <- o A..:?                       "month_count"
        sticker_               <- o A..:?                       "sticker"
        code_                  <- o A..:?                       "code"
        pure $ MessagePremiumGiftCode
          { creator_id            = creator_id_
          , text                  = text_
          , is_from_giveaway      = is_from_giveaway_
          , is_unclaimed          = is_unclaimed_
          , currency              = currency_
          , amount                = amount_
          , cryptocurrency        = cryptocurrency_
          , cryptocurrency_amount = cryptocurrency_amount_
          , month_count           = month_count_
          , sticker               = sticker_
          , code                  = code_
          }
      parseMessageGiveawayCreated :: A.Value -> AT.Parser MessageContent
      parseMessageGiveawayCreated = A.withObject "MessageGiveawayCreated" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ MessageGiveawayCreated
          { star_count = star_count_
          }
      parseMessageGiveaway :: A.Value -> AT.Parser MessageContent
      parseMessageGiveaway = A.withObject "MessageGiveaway" $ \o -> do
        parameters_   <- o A..:?  "parameters"
        winner_count_ <- o A..:?  "winner_count"
        prize_        <- o A..:?  "prize"
        sticker_      <- o A..:?  "sticker"
        pure $ MessageGiveaway
          { parameters   = parameters_
          , winner_count = winner_count_
          , prize        = prize_
          , sticker      = sticker_
          }
      parseMessageGiveawayCompleted :: A.Value -> AT.Parser MessageContent
      parseMessageGiveawayCompleted = A.withObject "MessageGiveawayCompleted" $ \o -> do
        giveaway_message_id_   <- o A..:?  "giveaway_message_id"
        winner_count_          <- o A..:?  "winner_count"
        is_star_giveaway_      <- o A..:?  "is_star_giveaway"
        unclaimed_prize_count_ <- o A..:?  "unclaimed_prize_count"
        pure $ MessageGiveawayCompleted
          { giveaway_message_id   = giveaway_message_id_
          , winner_count          = winner_count_
          , is_star_giveaway      = is_star_giveaway_
          , unclaimed_prize_count = unclaimed_prize_count_
          }
      parseMessageGiveawayWinners :: A.Value -> AT.Parser MessageContent
      parseMessageGiveawayWinners = A.withObject "MessageGiveawayWinners" $ \o -> do
        boosted_chat_id_               <- o A..:?  "boosted_chat_id"
        giveaway_message_id_           <- o A..:?  "giveaway_message_id"
        additional_chat_count_         <- o A..:?  "additional_chat_count"
        actual_winners_selection_date_ <- o A..:?  "actual_winners_selection_date"
        only_new_members_              <- o A..:?  "only_new_members"
        was_refunded_                  <- o A..:?  "was_refunded"
        prize_                         <- o A..:?  "prize"
        prize_description_             <- o A..:?  "prize_description"
        winner_count_                  <- o A..:?  "winner_count"
        winner_user_ids_               <- o A..:?  "winner_user_ids"
        unclaimed_prize_count_         <- o A..:?  "unclaimed_prize_count"
        pure $ MessageGiveawayWinners
          { boosted_chat_id               = boosted_chat_id_
          , giveaway_message_id           = giveaway_message_id_
          , additional_chat_count         = additional_chat_count_
          , actual_winners_selection_date = actual_winners_selection_date_
          , only_new_members              = only_new_members_
          , was_refunded                  = was_refunded_
          , prize                         = prize_
          , prize_description             = prize_description_
          , winner_count                  = winner_count_
          , winner_user_ids               = winner_user_ids_
          , unclaimed_prize_count         = unclaimed_prize_count_
          }
      parseMessageGiftedStars :: A.Value -> AT.Parser MessageContent
      parseMessageGiftedStars = A.withObject "MessageGiftedStars" $ \o -> do
        gifter_user_id_        <- o A..:?                       "gifter_user_id"
        receiver_user_id_      <- o A..:?                       "receiver_user_id"
        currency_              <- o A..:?                       "currency"
        amount_                <- o A..:?                       "amount"
        cryptocurrency_        <- o A..:?                       "cryptocurrency"
        cryptocurrency_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_amount"
        star_count_            <- o A..:?                       "star_count"
        transaction_id_        <- o A..:?                       "transaction_id"
        sticker_               <- o A..:?                       "sticker"
        pure $ MessageGiftedStars
          { gifter_user_id        = gifter_user_id_
          , receiver_user_id      = receiver_user_id_
          , currency              = currency_
          , amount                = amount_
          , cryptocurrency        = cryptocurrency_
          , cryptocurrency_amount = cryptocurrency_amount_
          , star_count            = star_count_
          , transaction_id        = transaction_id_
          , sticker               = sticker_
          }
      parseMessageGiveawayPrizeStars :: A.Value -> AT.Parser MessageContent
      parseMessageGiveawayPrizeStars = A.withObject "MessageGiveawayPrizeStars" $ \o -> do
        star_count_          <- o A..:?  "star_count"
        transaction_id_      <- o A..:?  "transaction_id"
        boosted_chat_id_     <- o A..:?  "boosted_chat_id"
        giveaway_message_id_ <- o A..:?  "giveaway_message_id"
        is_unclaimed_        <- o A..:?  "is_unclaimed"
        sticker_             <- o A..:?  "sticker"
        pure $ MessageGiveawayPrizeStars
          { star_count          = star_count_
          , transaction_id      = transaction_id_
          , boosted_chat_id     = boosted_chat_id_
          , giveaway_message_id = giveaway_message_id_
          , is_unclaimed        = is_unclaimed_
          , sticker             = sticker_
          }
      parseMessageGift :: A.Value -> AT.Parser MessageContent
      parseMessageGift = A.withObject "MessageGift" $ \o -> do
        gift_            <- o A..:?  "gift"
        text_            <- o A..:?  "text"
        sell_star_count_ <- o A..:?  "sell_star_count"
        is_private_      <- o A..:?  "is_private"
        is_saved_        <- o A..:?  "is_saved"
        was_converted_   <- o A..:?  "was_converted"
        pure $ MessageGift
          { gift            = gift_
          , text            = text_
          , sell_star_count = sell_star_count_
          , is_private      = is_private_
          , is_saved        = is_saved_
          , was_converted   = was_converted_
          }
      parseMessageUsersShared :: A.Value -> AT.Parser MessageContent
      parseMessageUsersShared = A.withObject "MessageUsersShared" $ \o -> do
        users_     <- o A..:?  "users"
        button_id_ <- o A..:?  "button_id"
        pure $ MessageUsersShared
          { users     = users_
          , button_id = button_id_
          }
      parseMessageChatShared :: A.Value -> AT.Parser MessageContent
      parseMessageChatShared = A.withObject "MessageChatShared" $ \o -> do
        chat_      <- o A..:?  "chat"
        button_id_ <- o A..:?  "button_id"
        pure $ MessageChatShared
          { chat      = chat_
          , button_id = button_id_
          }
      parseMessageBotWriteAccessAllowed :: A.Value -> AT.Parser MessageContent
      parseMessageBotWriteAccessAllowed = A.withObject "MessageBotWriteAccessAllowed" $ \o -> do
        reason_ <- o A..:?  "reason"
        pure $ MessageBotWriteAccessAllowed
          { reason = reason_
          }
      parseMessageWebAppDataSent :: A.Value -> AT.Parser MessageContent
      parseMessageWebAppDataSent = A.withObject "MessageWebAppDataSent" $ \o -> do
        button_text_ <- o A..:?  "button_text"
        pure $ MessageWebAppDataSent
          { button_text = button_text_
          }
      parseMessageWebAppDataReceived :: A.Value -> AT.Parser MessageContent
      parseMessageWebAppDataReceived = A.withObject "MessageWebAppDataReceived" $ \o -> do
        button_text_ <- o A..:?  "button_text"
        _data_       <- o A..:?  "data"
        pure $ MessageWebAppDataReceived
          { button_text = button_text_
          , _data       = _data_
          }
      parseMessagePassportDataSent :: A.Value -> AT.Parser MessageContent
      parseMessagePassportDataSent = A.withObject "MessagePassportDataSent" $ \o -> do
        types_ <- o A..:?  "types"
        pure $ MessagePassportDataSent
          { types = types_
          }
      parseMessagePassportDataReceived :: A.Value -> AT.Parser MessageContent
      parseMessagePassportDataReceived = A.withObject "MessagePassportDataReceived" $ \o -> do
        elements_    <- o A..:?  "elements"
        credentials_ <- o A..:?  "credentials"
        pure $ MessagePassportDataReceived
          { elements    = elements_
          , credentials = credentials_
          }
      parseMessageProximityAlertTriggered :: A.Value -> AT.Parser MessageContent
      parseMessageProximityAlertTriggered = A.withObject "MessageProximityAlertTriggered" $ \o -> do
        traveler_id_ <- o A..:?  "traveler_id"
        watcher_id_  <- o A..:?  "watcher_id"
        distance_    <- o A..:?  "distance"
        pure $ MessageProximityAlertTriggered
          { traveler_id = traveler_id_
          , watcher_id  = watcher_id_
          , distance    = distance_
          }
  parseJSON _ = mempty

