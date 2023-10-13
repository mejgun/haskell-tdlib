module TD.Data.MessageContent
  ( MessageContent(..)                         
  , defaultMessageText                         
  , defaultMessageAnimation                    
  , defaultMessageAudio                        
  , defaultMessageDocument                     
  , defaultMessagePhoto                        
  , defaultMessageSticker                      
  , defaultMessageVideo                        
  , defaultMessageVideoNote                    
  , defaultMessageVoiceNote                    
  , defaultMessageLocation                     
  , defaultMessageVenue                        
  , defaultMessageContact                      
  , defaultMessageAnimatedEmoji                
  , defaultMessageDice                         
  , defaultMessageGame                         
  , defaultMessagePoll                         
  , defaultMessageStory                        
  , defaultMessageInvoice                      
  , defaultMessageCall                         
  , defaultMessageVideoChatScheduled           
  , defaultMessageVideoChatStarted             
  , defaultMessageVideoChatEnded               
  , defaultMessageInviteVideoChatParticipants  
  , defaultMessageBasicGroupChatCreate         
  , defaultMessageSupergroupChatCreate         
  , defaultMessageChatChangeTitle              
  , defaultMessageChatChangePhoto              
  , defaultMessageChatAddMembers               
  , defaultMessageChatDeleteMember             
  , defaultMessageChatUpgradeTo                
  , defaultMessageChatUpgradeFrom              
  , defaultMessagePinMessage                   
  , defaultMessageChatSetBackground            
  , defaultMessageChatSetTheme                 
  , defaultMessageChatSetMessageAutoDeleteTime 
  , defaultMessageForumTopicCreated            
  , defaultMessageForumTopicEdited             
  , defaultMessageForumTopicIsClosedToggled    
  , defaultMessageForumTopicIsHiddenToggled    
  , defaultMessageSuggestProfilePhoto          
  , defaultMessageCustomServiceAction          
  , defaultMessageGameScore                    
  , defaultMessagePaymentSuccessful            
  , defaultMessagePaymentSuccessfulBot         
  , defaultMessageGiftedPremium                
  , defaultMessageUserShared                   
  , defaultMessageChatShared                   
  , defaultMessageWebsiteConnected             
  , defaultMessageBotWriteAccessAllowed        
  , defaultMessageWebAppDataSent               
  , defaultMessageWebAppDataReceived           
  , defaultMessagePassportDataSent             
  , defaultMessagePassportDataReceived         
  , defaultMessageProximityAlertTriggered      
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.WebPage as WebPage
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
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
import qualified TD.Data.MessageExtendedMedia as MessageExtendedMedia
import qualified TD.Data.CallDiscardReason as CallDiscardReason
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.ChatBackground as ChatBackground
import qualified TD.Data.ForumTopicIcon as ForumTopicIcon
import qualified Data.ByteString as BS
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.WebApp as WebApp
import qualified TD.Data.PassportElementType as PassportElementType
import qualified TD.Data.EncryptedPassportElement as EncryptedPassportElement
import qualified TD.Data.EncryptedCredentials as EncryptedCredentials
import qualified TD.Data.MessageSender as MessageSender

data MessageContent -- ^ Contains the content of a message
  = MessageText -- ^ A text message
    { text     :: Maybe FormattedText.FormattedText -- ^ Text of the message
    , web_page :: Maybe WebPage.WebPage             -- ^ A preview of the web page that's mentioned in the text; may be null
    }
  | MessageAnimation -- ^ An animation message (GIF-style).
    { animation   :: Maybe Animation.Animation         -- ^ The animation description
    , caption     :: Maybe FormattedText.FormattedText -- ^ Animation caption
    , has_spoiler :: Maybe Bool                        -- ^ True, if the animation preview must be covered by a spoiler animation
    , is_secret   :: Maybe Bool                        -- ^ True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
    }
  | MessageAudio -- ^ An audio message
    { audio   :: Maybe Audio.Audio                 -- ^ The audio description
    , caption :: Maybe FormattedText.FormattedText -- ^ Audio caption
    }
  | MessageDocument -- ^ A document message (general file)
    { document :: Maybe Document.Document           -- ^ The document description
    , caption  :: Maybe FormattedText.FormattedText -- ^ Document caption
    }
  | MessagePhoto -- ^ A photo message
    { photo       :: Maybe Photo.Photo                 -- ^ The photo
    , caption     :: Maybe FormattedText.FormattedText -- ^ Photo caption
    , has_spoiler :: Maybe Bool                        -- ^ True, if the photo preview must be covered by a spoiler animation
    , is_secret   :: Maybe Bool                        -- ^ True, if the photo must be blurred and must be shown only while tapped
    }
  | MessageExpiredPhoto -- ^ A self-destructed photo message
  | MessageSticker -- ^ A sticker message
    { sticker    :: Maybe Sticker.Sticker -- ^ The sticker description
    , is_premium :: Maybe Bool            -- ^ True, if premium animation of the sticker must be played
    }
  | MessageVideo -- ^ A video message
    { video       :: Maybe Video.Video                 -- ^ The video description
    , caption     :: Maybe FormattedText.FormattedText -- ^ Video caption
    , has_spoiler :: Maybe Bool                        -- ^ True, if the video preview must be covered by a spoiler animation
    , is_secret   :: Maybe Bool                        -- ^ True, if the video thumbnail must be blurred and the video must be shown only while tapped
    }
  | MessageExpiredVideo -- ^ A self-destructed video message
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
  | MessageLocation -- ^ A message with a location
    { location               :: Maybe Location.Location -- ^ The location description
    , live_period            :: Maybe Int               -- ^ Time relative to the message send date, for which the location can be updated, in seconds
    , expires_in             :: Maybe Int               -- ^ Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
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
    { initial_state                  :: Maybe DiceStickers.DiceStickers -- ^ The animated stickers with the initial dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
    , final_state                    :: Maybe DiceStickers.DiceStickers -- ^ The animated stickers with the final dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
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
    { title                 :: Maybe T.Text                                    -- ^ Product title
    , description           :: Maybe FormattedText.FormattedText
    , photo                 :: Maybe Photo.Photo                               -- ^ Product photo; may be null
    , currency              :: Maybe T.Text                                    -- ^ Currency for the product price
    , total_amount          :: Maybe Int                                       -- ^ Product total price in the smallest units of the currency
    , start_parameter       :: Maybe T.Text                                    -- ^ Unique invoice bot start_parameter to be passed to getInternalLink
    , is_test               :: Maybe Bool                                      -- ^ True, if the invoice is a test invoice
    , need_shipping_address :: Maybe Bool                                      -- ^ True, if the shipping address must be specified
    , receipt_message_id    :: Maybe Int                                       -- ^ The identifier of the message with the receipt, after the product has been purchased
    , extended_media        :: Maybe MessageExtendedMedia.MessageExtendedMedia -- ^ Extended media attached to the invoice; may be null
    }
  | MessageCall -- ^ A message with information about an ended call
    { is_video       :: Maybe Bool                                -- ^ True, if the call was a video call
    , discard_reason :: Maybe CallDiscardReason.CallDiscardReason -- ^ Reason why the call was discarded
    , duration       :: Maybe Int                                 -- ^ Call duration, in seconds
    }
  | MessageVideoChatScheduled -- ^ A new video chat was scheduled
    { group_call_id :: Maybe Int -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    , start_date    :: Maybe Int -- ^ Point in time (Unix timestamp) when the group call is supposed to be started by an administrator
    }
  | MessageVideoChatStarted -- ^ A newly created video chat
    { group_call_id :: Maybe Int -- ^ Identifier of the video chat. The video chat can be received through the method getGroupCall
    }
  | MessageVideoChatEnded -- ^ A message with information about an ended video chat
    { duration :: Maybe Int -- ^ Call duration, in seconds
    }
  | MessageInviteVideoChatParticipants -- ^ A message with information about an invite to a video chat
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
    }
  | MessageChatSetTheme -- ^ A theme in the chat has been changed
    { theme_name :: Maybe T.Text -- ^ If non-empty, name of a new theme, set for the chat. Otherwise, chat theme was reset to the default one
    }
  | MessageChatSetMessageAutoDeleteTime -- ^ The auto-delete or self-destruct timer for messages in the chat has been changed
    { message_auto_delete_time :: Maybe Int -- ^ New value auto-delete or self-destruct time, in seconds; 0 if disabled
    , from_user_id             :: Maybe Int -- ^ If not 0, a user identifier, which default setting was automatically applied
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
  | MessagePaymentSuccessful -- ^ A payment has been completed
    { invoice_chat_id    :: Maybe Int    -- ^ Identifier of the chat, containing the corresponding invoice message
    , invoice_message_id :: Maybe Int    -- ^ Identifier of the message with the corresponding invoice; can be 0 or an identifier of a deleted message
    , currency           :: Maybe T.Text -- ^ Currency for the price of the product
    , total_amount       :: Maybe Int    -- ^ Total price for the product, in the smallest units of the currency
    , is_recurring       :: Maybe Bool   -- ^ True, if this is a recurring payment
    , is_first_recurring :: Maybe Bool   -- ^ True, if this is the first recurring payment
    , invoice_name       :: Maybe T.Text -- ^ Name of the invoice; may be empty if unknown
    }
  | MessagePaymentSuccessfulBot -- ^ A payment has been completed; for bots only
    { currency                   :: Maybe T.Text              -- ^ Currency for price of the product
    , total_amount               :: Maybe Int                 -- ^ Total price for the product, in the smallest units of the currency
    , is_recurring               :: Maybe Bool                -- ^ True, if this is a recurring payment
    , is_first_recurring         :: Maybe Bool                -- ^ True, if this is the first recurring payment
    , invoice_payload            :: Maybe BS.ByteString       -- ^ Invoice payload
    , shipping_option_id         :: Maybe T.Text              -- ^ Identifier of the shipping option chosen by the user; may be empty if not applicable
    , order_info                 :: Maybe OrderInfo.OrderInfo -- ^ Information about the order; may be null
    , telegram_payment_charge_id :: Maybe T.Text              -- ^ Telegram payment identifier
    , provider_payment_charge_id :: Maybe T.Text              -- ^ Provider payment identifier
    }
  | MessageGiftedPremium -- ^ Telegram Premium was gifted to the user
    { gifter_user_id        :: Maybe Int             -- ^ The identifier of a user that gifted Telegram Premium; 0 if the gift was anonymous
    , currency              :: Maybe T.Text          -- ^ Currency for the paid amount
    , amount                :: Maybe Int             -- ^ The paid amount, in the smallest units of the currency
    , cryptocurrency        :: Maybe T.Text          -- ^ Cryptocurrency used to pay for the gift; may be empty if none
    , cryptocurrency_amount :: Maybe Int             -- ^ The paid amount, in the smallest units of the cryptocurrency
    , month_count           :: Maybe Int             -- ^ Number of month the Telegram Premium subscription will be active
    , sticker               :: Maybe Sticker.Sticker -- ^ A sticker to be shown in the message; may be null if unknown
    }
  | MessageContactRegistered -- ^ A contact has registered with Telegram
  | MessageUserShared -- ^ The current user shared a user, which was requested by the bot
    { user_id   :: Maybe Int -- ^ Identifier of the shared user
    , button_id :: Maybe Int -- ^ Identifier of the keyboard button with the request
    }
  | MessageChatShared -- ^ The current user shared a chat, which was requested by the bot
    { chat_id   :: Maybe Int -- ^ Identifier of the shared chat
    , button_id :: Maybe Int -- ^ Identifier of the keyboard button with the request
    }
  | MessageWebsiteConnected -- ^ The current user has connected a website by logging in using Telegram Login Widget on it
    { domain_name :: Maybe T.Text -- ^ Domain name of the connected website
    }
  | MessageBotWriteAccessAllowed -- ^ The user allowed the bot to send messages
    { web_app :: Maybe WebApp.WebApp -- ^ Information about the Web App, which requested the access; may be null if none or the Web App was opened from the attachment menu
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
  deriving (Eq)

instance Show MessageContent where
  show MessageText
    { text     = text_
    , web_page = web_page_
    }
      = "MessageText"
        ++ I.cc
        [ "text"     `I.p` text_
        , "web_page" `I.p` web_page_
        ]
  show MessageAnimation
    { animation   = animation_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    , is_secret   = is_secret_
    }
      = "MessageAnimation"
        ++ I.cc
        [ "animation"   `I.p` animation_
        , "caption"     `I.p` caption_
        , "has_spoiler" `I.p` has_spoiler_
        , "is_secret"   `I.p` is_secret_
        ]
  show MessageAudio
    { audio   = audio_
    , caption = caption_
    }
      = "MessageAudio"
        ++ I.cc
        [ "audio"   `I.p` audio_
        , "caption" `I.p` caption_
        ]
  show MessageDocument
    { document = document_
    , caption  = caption_
    }
      = "MessageDocument"
        ++ I.cc
        [ "document" `I.p` document_
        , "caption"  `I.p` caption_
        ]
  show MessagePhoto
    { photo       = photo_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    , is_secret   = is_secret_
    }
      = "MessagePhoto"
        ++ I.cc
        [ "photo"       `I.p` photo_
        , "caption"     `I.p` caption_
        , "has_spoiler" `I.p` has_spoiler_
        , "is_secret"   `I.p` is_secret_
        ]
  show MessageExpiredPhoto
      = "MessageExpiredPhoto"
  show MessageSticker
    { sticker    = sticker_
    , is_premium = is_premium_
    }
      = "MessageSticker"
        ++ I.cc
        [ "sticker"    `I.p` sticker_
        , "is_premium" `I.p` is_premium_
        ]
  show MessageVideo
    { video       = video_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    , is_secret   = is_secret_
    }
      = "MessageVideo"
        ++ I.cc
        [ "video"       `I.p` video_
        , "caption"     `I.p` caption_
        , "has_spoiler" `I.p` has_spoiler_
        , "is_secret"   `I.p` is_secret_
        ]
  show MessageExpiredVideo
      = "MessageExpiredVideo"
  show MessageVideoNote
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
  show MessageVoiceNote
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
  show MessageLocation
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
  show MessageVenue
    { venue = venue_
    }
      = "MessageVenue"
        ++ I.cc
        [ "venue" `I.p` venue_
        ]
  show MessageContact
    { contact = contact_
    }
      = "MessageContact"
        ++ I.cc
        [ "contact" `I.p` contact_
        ]
  show MessageAnimatedEmoji
    { animated_emoji = animated_emoji_
    , emoji          = emoji_
    }
      = "MessageAnimatedEmoji"
        ++ I.cc
        [ "animated_emoji" `I.p` animated_emoji_
        , "emoji"          `I.p` emoji_
        ]
  show MessageDice
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
  show MessageGame
    { game = game_
    }
      = "MessageGame"
        ++ I.cc
        [ "game" `I.p` game_
        ]
  show MessagePoll
    { poll = poll_
    }
      = "MessagePoll"
        ++ I.cc
        [ "poll" `I.p` poll_
        ]
  show MessageStory
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
  show MessageInvoice
    { title                 = title_
    , description           = description_
    , photo                 = photo_
    , currency              = currency_
    , total_amount          = total_amount_
    , start_parameter       = start_parameter_
    , is_test               = is_test_
    , need_shipping_address = need_shipping_address_
    , receipt_message_id    = receipt_message_id_
    , extended_media        = extended_media_
    }
      = "MessageInvoice"
        ++ I.cc
        [ "title"                 `I.p` title_
        , "description"           `I.p` description_
        , "photo"                 `I.p` photo_
        , "currency"              `I.p` currency_
        , "total_amount"          `I.p` total_amount_
        , "start_parameter"       `I.p` start_parameter_
        , "is_test"               `I.p` is_test_
        , "need_shipping_address" `I.p` need_shipping_address_
        , "receipt_message_id"    `I.p` receipt_message_id_
        , "extended_media"        `I.p` extended_media_
        ]
  show MessageCall
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
  show MessageVideoChatScheduled
    { group_call_id = group_call_id_
    , start_date    = start_date_
    }
      = "MessageVideoChatScheduled"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        , "start_date"    `I.p` start_date_
        ]
  show MessageVideoChatStarted
    { group_call_id = group_call_id_
    }
      = "MessageVideoChatStarted"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        ]
  show MessageVideoChatEnded
    { duration = duration_
    }
      = "MessageVideoChatEnded"
        ++ I.cc
        [ "duration" `I.p` duration_
        ]
  show MessageInviteVideoChatParticipants
    { group_call_id = group_call_id_
    , user_ids      = user_ids_
    }
      = "MessageInviteVideoChatParticipants"
        ++ I.cc
        [ "group_call_id" `I.p` group_call_id_
        , "user_ids"      `I.p` user_ids_
        ]
  show MessageBasicGroupChatCreate
    { title           = title_
    , member_user_ids = member_user_ids_
    }
      = "MessageBasicGroupChatCreate"
        ++ I.cc
        [ "title"           `I.p` title_
        , "member_user_ids" `I.p` member_user_ids_
        ]
  show MessageSupergroupChatCreate
    { title = title_
    }
      = "MessageSupergroupChatCreate"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  show MessageChatChangeTitle
    { title = title_
    }
      = "MessageChatChangeTitle"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  show MessageChatChangePhoto
    { _photo = _photo_
    }
      = "MessageChatChangePhoto"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        ]
  show MessageChatDeletePhoto
      = "MessageChatDeletePhoto"
  show MessageChatAddMembers
    { member_user_ids = member_user_ids_
    }
      = "MessageChatAddMembers"
        ++ I.cc
        [ "member_user_ids" `I.p` member_user_ids_
        ]
  show MessageChatJoinByLink
      = "MessageChatJoinByLink"
  show MessageChatJoinByRequest
      = "MessageChatJoinByRequest"
  show MessageChatDeleteMember
    { user_id = user_id_
    }
      = "MessageChatDeleteMember"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  show MessageChatUpgradeTo
    { supergroup_id = supergroup_id_
    }
      = "MessageChatUpgradeTo"
        ++ I.cc
        [ "supergroup_id" `I.p` supergroup_id_
        ]
  show MessageChatUpgradeFrom
    { title          = title_
    , basic_group_id = basic_group_id_
    }
      = "MessageChatUpgradeFrom"
        ++ I.cc
        [ "title"          `I.p` title_
        , "basic_group_id" `I.p` basic_group_id_
        ]
  show MessagePinMessage
    { message_id = message_id_
    }
      = "MessagePinMessage"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        ]
  show MessageScreenshotTaken
      = "MessageScreenshotTaken"
  show MessageChatSetBackground
    { old_background_message_id = old_background_message_id_
    , background                = background_
    }
      = "MessageChatSetBackground"
        ++ I.cc
        [ "old_background_message_id" `I.p` old_background_message_id_
        , "background"                `I.p` background_
        ]
  show MessageChatSetTheme
    { theme_name = theme_name_
    }
      = "MessageChatSetTheme"
        ++ I.cc
        [ "theme_name" `I.p` theme_name_
        ]
  show MessageChatSetMessageAutoDeleteTime
    { message_auto_delete_time = message_auto_delete_time_
    , from_user_id             = from_user_id_
    }
      = "MessageChatSetMessageAutoDeleteTime"
        ++ I.cc
        [ "message_auto_delete_time" `I.p` message_auto_delete_time_
        , "from_user_id"             `I.p` from_user_id_
        ]
  show MessageForumTopicCreated
    { name = name_
    , icon = icon_
    }
      = "MessageForumTopicCreated"
        ++ I.cc
        [ "name" `I.p` name_
        , "icon" `I.p` icon_
        ]
  show MessageForumTopicEdited
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
  show MessageForumTopicIsClosedToggled
    { is_closed = is_closed_
    }
      = "MessageForumTopicIsClosedToggled"
        ++ I.cc
        [ "is_closed" `I.p` is_closed_
        ]
  show MessageForumTopicIsHiddenToggled
    { is_hidden = is_hidden_
    }
      = "MessageForumTopicIsHiddenToggled"
        ++ I.cc
        [ "is_hidden" `I.p` is_hidden_
        ]
  show MessageSuggestProfilePhoto
    { _photo = _photo_
    }
      = "MessageSuggestProfilePhoto"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        ]
  show MessageCustomServiceAction
    { _text = _text_
    }
      = "MessageCustomServiceAction"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  show MessageGameScore
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
  show MessagePaymentSuccessful
    { invoice_chat_id    = invoice_chat_id_
    , invoice_message_id = invoice_message_id_
    , currency           = currency_
    , total_amount       = total_amount_
    , is_recurring       = is_recurring_
    , is_first_recurring = is_first_recurring_
    , invoice_name       = invoice_name_
    }
      = "MessagePaymentSuccessful"
        ++ I.cc
        [ "invoice_chat_id"    `I.p` invoice_chat_id_
        , "invoice_message_id" `I.p` invoice_message_id_
        , "currency"           `I.p` currency_
        , "total_amount"       `I.p` total_amount_
        , "is_recurring"       `I.p` is_recurring_
        , "is_first_recurring" `I.p` is_first_recurring_
        , "invoice_name"       `I.p` invoice_name_
        ]
  show MessagePaymentSuccessfulBot
    { currency                   = currency_
    , total_amount               = total_amount_
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
        , "is_recurring"               `I.p` is_recurring_
        , "is_first_recurring"         `I.p` is_first_recurring_
        , "invoice_payload"            `I.p` invoice_payload_
        , "shipping_option_id"         `I.p` shipping_option_id_
        , "order_info"                 `I.p` order_info_
        , "telegram_payment_charge_id" `I.p` telegram_payment_charge_id_
        , "provider_payment_charge_id" `I.p` provider_payment_charge_id_
        ]
  show MessageGiftedPremium
    { gifter_user_id        = gifter_user_id_
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
        , "currency"              `I.p` currency_
        , "amount"                `I.p` amount_
        , "cryptocurrency"        `I.p` cryptocurrency_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "month_count"           `I.p` month_count_
        , "sticker"               `I.p` sticker_
        ]
  show MessageContactRegistered
      = "MessageContactRegistered"
  show MessageUserShared
    { user_id   = user_id_
    , button_id = button_id_
    }
      = "MessageUserShared"
        ++ I.cc
        [ "user_id"   `I.p` user_id_
        , "button_id" `I.p` button_id_
        ]
  show MessageChatShared
    { chat_id   = chat_id_
    , button_id = button_id_
    }
      = "MessageChatShared"
        ++ I.cc
        [ "chat_id"   `I.p` chat_id_
        , "button_id" `I.p` button_id_
        ]
  show MessageWebsiteConnected
    { domain_name = domain_name_
    }
      = "MessageWebsiteConnected"
        ++ I.cc
        [ "domain_name" `I.p` domain_name_
        ]
  show MessageBotWriteAccessAllowed
    { web_app = web_app_
    }
      = "MessageBotWriteAccessAllowed"
        ++ I.cc
        [ "web_app" `I.p` web_app_
        ]
  show MessageWebAppDataSent
    { button_text = button_text_
    }
      = "MessageWebAppDataSent"
        ++ I.cc
        [ "button_text" `I.p` button_text_
        ]
  show MessageWebAppDataReceived
    { button_text = button_text_
    , _data       = _data_
    }
      = "MessageWebAppDataReceived"
        ++ I.cc
        [ "button_text" `I.p` button_text_
        , "_data"       `I.p` _data_
        ]
  show MessagePassportDataSent
    { types = types_
    }
      = "MessagePassportDataSent"
        ++ I.cc
        [ "types" `I.p` types_
        ]
  show MessagePassportDataReceived
    { elements    = elements_
    , credentials = credentials_
    }
      = "MessagePassportDataReceived"
        ++ I.cc
        [ "elements"    `I.p` elements_
        , "credentials" `I.p` credentials_
        ]
  show MessageProximityAlertTriggered
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
  show MessageUnsupported
      = "MessageUnsupported"

instance AT.FromJSON MessageContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageText"                         -> parseMessageText v
      "messageAnimation"                    -> parseMessageAnimation v
      "messageAudio"                        -> parseMessageAudio v
      "messageDocument"                     -> parseMessageDocument v
      "messagePhoto"                        -> parseMessagePhoto v
      "messageExpiredPhoto"                 -> pure MessageExpiredPhoto
      "messageSticker"                      -> parseMessageSticker v
      "messageVideo"                        -> parseMessageVideo v
      "messageExpiredVideo"                 -> pure MessageExpiredVideo
      "messageVideoNote"                    -> parseMessageVideoNote v
      "messageVoiceNote"                    -> parseMessageVoiceNote v
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
      "messageForumTopicCreated"            -> parseMessageForumTopicCreated v
      "messageForumTopicEdited"             -> parseMessageForumTopicEdited v
      "messageForumTopicIsClosedToggled"    -> parseMessageForumTopicIsClosedToggled v
      "messageForumTopicIsHiddenToggled"    -> parseMessageForumTopicIsHiddenToggled v
      "messageSuggestProfilePhoto"          -> parseMessageSuggestProfilePhoto v
      "messageCustomServiceAction"          -> parseMessageCustomServiceAction v
      "messageGameScore"                    -> parseMessageGameScore v
      "messagePaymentSuccessful"            -> parseMessagePaymentSuccessful v
      "messagePaymentSuccessfulBot"         -> parseMessagePaymentSuccessfulBot v
      "messageGiftedPremium"                -> parseMessageGiftedPremium v
      "messageContactRegistered"            -> pure MessageContactRegistered
      "messageUserShared"                   -> parseMessageUserShared v
      "messageChatShared"                   -> parseMessageChatShared v
      "messageWebsiteConnected"             -> parseMessageWebsiteConnected v
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
        text_     <- o A..:?  "text"
        web_page_ <- o A..:?  "web_page"
        pure $ MessageText
          { text     = text_
          , web_page = web_page_
          }
      parseMessageAnimation :: A.Value -> AT.Parser MessageContent
      parseMessageAnimation = A.withObject "MessageAnimation" $ \o -> do
        animation_   <- o A..:?  "animation"
        caption_     <- o A..:?  "caption"
        has_spoiler_ <- o A..:?  "has_spoiler"
        is_secret_   <- o A..:?  "is_secret"
        pure $ MessageAnimation
          { animation   = animation_
          , caption     = caption_
          , has_spoiler = has_spoiler_
          , is_secret   = is_secret_
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
      parseMessagePhoto :: A.Value -> AT.Parser MessageContent
      parseMessagePhoto = A.withObject "MessagePhoto" $ \o -> do
        photo_       <- o A..:?  "photo"
        caption_     <- o A..:?  "caption"
        has_spoiler_ <- o A..:?  "has_spoiler"
        is_secret_   <- o A..:?  "is_secret"
        pure $ MessagePhoto
          { photo       = photo_
          , caption     = caption_
          , has_spoiler = has_spoiler_
          , is_secret   = is_secret_
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
        video_       <- o A..:?  "video"
        caption_     <- o A..:?  "caption"
        has_spoiler_ <- o A..:?  "has_spoiler"
        is_secret_   <- o A..:?  "is_secret"
        pure $ MessageVideo
          { video       = video_
          , caption     = caption_
          , has_spoiler = has_spoiler_
          , is_secret   = is_secret_
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
        title_                 <- o A..:?  "title"
        description_           <- o A..:?  "description"
        photo_                 <- o A..:?  "photo"
        currency_              <- o A..:?  "currency"
        total_amount_          <- o A..:?  "total_amount"
        start_parameter_       <- o A..:?  "start_parameter"
        is_test_               <- o A..:?  "is_test"
        need_shipping_address_ <- o A..:?  "need_shipping_address"
        receipt_message_id_    <- o A..:?  "receipt_message_id"
        extended_media_        <- o A..:?  "extended_media"
        pure $ MessageInvoice
          { title                 = title_
          , description           = description_
          , photo                 = photo_
          , currency              = currency_
          , total_amount          = total_amount_
          , start_parameter       = start_parameter_
          , is_test               = is_test_
          , need_shipping_address = need_shipping_address_
          , receipt_message_id    = receipt_message_id_
          , extended_media        = extended_media_
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
        pure $ MessageChatSetBackground
          { old_background_message_id = old_background_message_id_
          , background                = background_
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
        invoice_chat_id_    <- o A..:?  "invoice_chat_id"
        invoice_message_id_ <- o A..:?  "invoice_message_id"
        currency_           <- o A..:?  "currency"
        total_amount_       <- o A..:?  "total_amount"
        is_recurring_       <- o A..:?  "is_recurring"
        is_first_recurring_ <- o A..:?  "is_first_recurring"
        invoice_name_       <- o A..:?  "invoice_name"
        pure $ MessagePaymentSuccessful
          { invoice_chat_id    = invoice_chat_id_
          , invoice_message_id = invoice_message_id_
          , currency           = currency_
          , total_amount       = total_amount_
          , is_recurring       = is_recurring_
          , is_first_recurring = is_first_recurring_
          , invoice_name       = invoice_name_
          }
      parseMessagePaymentSuccessfulBot :: A.Value -> AT.Parser MessageContent
      parseMessagePaymentSuccessfulBot = A.withObject "MessagePaymentSuccessfulBot" $ \o -> do
        currency_                   <- o A..:?                       "currency"
        total_amount_               <- o A..:?                       "total_amount"
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
          , is_recurring               = is_recurring_
          , is_first_recurring         = is_first_recurring_
          , invoice_payload            = invoice_payload_
          , shipping_option_id         = shipping_option_id_
          , order_info                 = order_info_
          , telegram_payment_charge_id = telegram_payment_charge_id_
          , provider_payment_charge_id = provider_payment_charge_id_
          }
      parseMessageGiftedPremium :: A.Value -> AT.Parser MessageContent
      parseMessageGiftedPremium = A.withObject "MessageGiftedPremium" $ \o -> do
        gifter_user_id_        <- o A..:?                       "gifter_user_id"
        currency_              <- o A..:?                       "currency"
        amount_                <- o A..:?                       "amount"
        cryptocurrency_        <- o A..:?                       "cryptocurrency"
        cryptocurrency_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_amount"
        month_count_           <- o A..:?                       "month_count"
        sticker_               <- o A..:?                       "sticker"
        pure $ MessageGiftedPremium
          { gifter_user_id        = gifter_user_id_
          , currency              = currency_
          , amount                = amount_
          , cryptocurrency        = cryptocurrency_
          , cryptocurrency_amount = cryptocurrency_amount_
          , month_count           = month_count_
          , sticker               = sticker_
          }
      parseMessageUserShared :: A.Value -> AT.Parser MessageContent
      parseMessageUserShared = A.withObject "MessageUserShared" $ \o -> do
        user_id_   <- o A..:?  "user_id"
        button_id_ <- o A..:?  "button_id"
        pure $ MessageUserShared
          { user_id   = user_id_
          , button_id = button_id_
          }
      parseMessageChatShared :: A.Value -> AT.Parser MessageContent
      parseMessageChatShared = A.withObject "MessageChatShared" $ \o -> do
        chat_id_   <- o A..:?  "chat_id"
        button_id_ <- o A..:?  "button_id"
        pure $ MessageChatShared
          { chat_id   = chat_id_
          , button_id = button_id_
          }
      parseMessageWebsiteConnected :: A.Value -> AT.Parser MessageContent
      parseMessageWebsiteConnected = A.withObject "MessageWebsiteConnected" $ \o -> do
        domain_name_ <- o A..:?  "domain_name"
        pure $ MessageWebsiteConnected
          { domain_name = domain_name_
          }
      parseMessageBotWriteAccessAllowed :: A.Value -> AT.Parser MessageContent
      parseMessageBotWriteAccessAllowed = A.withObject "MessageBotWriteAccessAllowed" $ \o -> do
        web_app_ <- o A..:?  "web_app"
        pure $ MessageBotWriteAccessAllowed
          { web_app = web_app_
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

instance AT.ToJSON MessageContent where
  toJSON MessageText
    { text     = text_
    , web_page = web_page_
    }
      = A.object
        [ "@type"    A..= AT.String "messageText"
        , "text"     A..= text_
        , "web_page" A..= web_page_
        ]
  toJSON MessageAnimation
    { animation   = animation_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    , is_secret   = is_secret_
    }
      = A.object
        [ "@type"       A..= AT.String "messageAnimation"
        , "animation"   A..= animation_
        , "caption"     A..= caption_
        , "has_spoiler" A..= has_spoiler_
        , "is_secret"   A..= is_secret_
        ]
  toJSON MessageAudio
    { audio   = audio_
    , caption = caption_
    }
      = A.object
        [ "@type"   A..= AT.String "messageAudio"
        , "audio"   A..= audio_
        , "caption" A..= caption_
        ]
  toJSON MessageDocument
    { document = document_
    , caption  = caption_
    }
      = A.object
        [ "@type"    A..= AT.String "messageDocument"
        , "document" A..= document_
        , "caption"  A..= caption_
        ]
  toJSON MessagePhoto
    { photo       = photo_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    , is_secret   = is_secret_
    }
      = A.object
        [ "@type"       A..= AT.String "messagePhoto"
        , "photo"       A..= photo_
        , "caption"     A..= caption_
        , "has_spoiler" A..= has_spoiler_
        , "is_secret"   A..= is_secret_
        ]
  toJSON MessageExpiredPhoto
      = A.object
        [ "@type" A..= AT.String "messageExpiredPhoto"
        ]
  toJSON MessageSticker
    { sticker    = sticker_
    , is_premium = is_premium_
    }
      = A.object
        [ "@type"      A..= AT.String "messageSticker"
        , "sticker"    A..= sticker_
        , "is_premium" A..= is_premium_
        ]
  toJSON MessageVideo
    { video       = video_
    , caption     = caption_
    , has_spoiler = has_spoiler_
    , is_secret   = is_secret_
    }
      = A.object
        [ "@type"       A..= AT.String "messageVideo"
        , "video"       A..= video_
        , "caption"     A..= caption_
        , "has_spoiler" A..= has_spoiler_
        , "is_secret"   A..= is_secret_
        ]
  toJSON MessageExpiredVideo
      = A.object
        [ "@type" A..= AT.String "messageExpiredVideo"
        ]
  toJSON MessageVideoNote
    { video_note = video_note_
    , is_viewed  = is_viewed_
    , is_secret  = is_secret_
    }
      = A.object
        [ "@type"      A..= AT.String "messageVideoNote"
        , "video_note" A..= video_note_
        , "is_viewed"  A..= is_viewed_
        , "is_secret"  A..= is_secret_
        ]
  toJSON MessageVoiceNote
    { voice_note  = voice_note_
    , caption     = caption_
    , is_listened = is_listened_
    }
      = A.object
        [ "@type"       A..= AT.String "messageVoiceNote"
        , "voice_note"  A..= voice_note_
        , "caption"     A..= caption_
        , "is_listened" A..= is_listened_
        ]
  toJSON MessageLocation
    { location               = location_
    , live_period            = live_period_
    , expires_in             = expires_in_
    , heading                = heading_
    , proximity_alert_radius = proximity_alert_radius_
    }
      = A.object
        [ "@type"                  A..= AT.String "messageLocation"
        , "location"               A..= location_
        , "live_period"            A..= live_period_
        , "expires_in"             A..= expires_in_
        , "heading"                A..= heading_
        , "proximity_alert_radius" A..= proximity_alert_radius_
        ]
  toJSON MessageVenue
    { venue = venue_
    }
      = A.object
        [ "@type" A..= AT.String "messageVenue"
        , "venue" A..= venue_
        ]
  toJSON MessageContact
    { contact = contact_
    }
      = A.object
        [ "@type"   A..= AT.String "messageContact"
        , "contact" A..= contact_
        ]
  toJSON MessageAnimatedEmoji
    { animated_emoji = animated_emoji_
    , emoji          = emoji_
    }
      = A.object
        [ "@type"          A..= AT.String "messageAnimatedEmoji"
        , "animated_emoji" A..= animated_emoji_
        , "emoji"          A..= emoji_
        ]
  toJSON MessageDice
    { initial_state                  = initial_state_
    , final_state                    = final_state_
    , emoji                          = emoji_
    , value                          = value_
    , success_animation_frame_number = success_animation_frame_number_
    }
      = A.object
        [ "@type"                          A..= AT.String "messageDice"
        , "initial_state"                  A..= initial_state_
        , "final_state"                    A..= final_state_
        , "emoji"                          A..= emoji_
        , "value"                          A..= value_
        , "success_animation_frame_number" A..= success_animation_frame_number_
        ]
  toJSON MessageGame
    { game = game_
    }
      = A.object
        [ "@type" A..= AT.String "messageGame"
        , "game"  A..= game_
        ]
  toJSON MessagePoll
    { poll = poll_
    }
      = A.object
        [ "@type" A..= AT.String "messagePoll"
        , "poll"  A..= poll_
        ]
  toJSON MessageStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    , via_mention          = via_mention_
    }
      = A.object
        [ "@type"                A..= AT.String "messageStory"
        , "story_sender_chat_id" A..= story_sender_chat_id_
        , "story_id"             A..= story_id_
        , "via_mention"          A..= via_mention_
        ]
  toJSON MessageInvoice
    { title                 = title_
    , description           = description_
    , photo                 = photo_
    , currency              = currency_
    , total_amount          = total_amount_
    , start_parameter       = start_parameter_
    , is_test               = is_test_
    , need_shipping_address = need_shipping_address_
    , receipt_message_id    = receipt_message_id_
    , extended_media        = extended_media_
    }
      = A.object
        [ "@type"                 A..= AT.String "messageInvoice"
        , "title"                 A..= title_
        , "description"           A..= description_
        , "photo"                 A..= photo_
        , "currency"              A..= currency_
        , "total_amount"          A..= total_amount_
        , "start_parameter"       A..= start_parameter_
        , "is_test"               A..= is_test_
        , "need_shipping_address" A..= need_shipping_address_
        , "receipt_message_id"    A..= receipt_message_id_
        , "extended_media"        A..= extended_media_
        ]
  toJSON MessageCall
    { is_video       = is_video_
    , discard_reason = discard_reason_
    , duration       = duration_
    }
      = A.object
        [ "@type"          A..= AT.String "messageCall"
        , "is_video"       A..= is_video_
        , "discard_reason" A..= discard_reason_
        , "duration"       A..= duration_
        ]
  toJSON MessageVideoChatScheduled
    { group_call_id = group_call_id_
    , start_date    = start_date_
    }
      = A.object
        [ "@type"         A..= AT.String "messageVideoChatScheduled"
        , "group_call_id" A..= group_call_id_
        , "start_date"    A..= start_date_
        ]
  toJSON MessageVideoChatStarted
    { group_call_id = group_call_id_
    }
      = A.object
        [ "@type"         A..= AT.String "messageVideoChatStarted"
        , "group_call_id" A..= group_call_id_
        ]
  toJSON MessageVideoChatEnded
    { duration = duration_
    }
      = A.object
        [ "@type"    A..= AT.String "messageVideoChatEnded"
        , "duration" A..= duration_
        ]
  toJSON MessageInviteVideoChatParticipants
    { group_call_id = group_call_id_
    , user_ids      = user_ids_
    }
      = A.object
        [ "@type"         A..= AT.String "messageInviteVideoChatParticipants"
        , "group_call_id" A..= group_call_id_
        , "user_ids"      A..= user_ids_
        ]
  toJSON MessageBasicGroupChatCreate
    { title           = title_
    , member_user_ids = member_user_ids_
    }
      = A.object
        [ "@type"           A..= AT.String "messageBasicGroupChatCreate"
        , "title"           A..= title_
        , "member_user_ids" A..= member_user_ids_
        ]
  toJSON MessageSupergroupChatCreate
    { title = title_
    }
      = A.object
        [ "@type" A..= AT.String "messageSupergroupChatCreate"
        , "title" A..= title_
        ]
  toJSON MessageChatChangeTitle
    { title = title_
    }
      = A.object
        [ "@type" A..= AT.String "messageChatChangeTitle"
        , "title" A..= title_
        ]
  toJSON MessageChatChangePhoto
    { _photo = _photo_
    }
      = A.object
        [ "@type" A..= AT.String "messageChatChangePhoto"
        , "photo" A..= _photo_
        ]
  toJSON MessageChatDeletePhoto
      = A.object
        [ "@type" A..= AT.String "messageChatDeletePhoto"
        ]
  toJSON MessageChatAddMembers
    { member_user_ids = member_user_ids_
    }
      = A.object
        [ "@type"           A..= AT.String "messageChatAddMembers"
        , "member_user_ids" A..= member_user_ids_
        ]
  toJSON MessageChatJoinByLink
      = A.object
        [ "@type" A..= AT.String "messageChatJoinByLink"
        ]
  toJSON MessageChatJoinByRequest
      = A.object
        [ "@type" A..= AT.String "messageChatJoinByRequest"
        ]
  toJSON MessageChatDeleteMember
    { user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "messageChatDeleteMember"
        , "user_id" A..= user_id_
        ]
  toJSON MessageChatUpgradeTo
    { supergroup_id = supergroup_id_
    }
      = A.object
        [ "@type"         A..= AT.String "messageChatUpgradeTo"
        , "supergroup_id" A..= supergroup_id_
        ]
  toJSON MessageChatUpgradeFrom
    { title          = title_
    , basic_group_id = basic_group_id_
    }
      = A.object
        [ "@type"          A..= AT.String "messageChatUpgradeFrom"
        , "title"          A..= title_
        , "basic_group_id" A..= basic_group_id_
        ]
  toJSON MessagePinMessage
    { message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "messagePinMessage"
        , "message_id" A..= message_id_
        ]
  toJSON MessageScreenshotTaken
      = A.object
        [ "@type" A..= AT.String "messageScreenshotTaken"
        ]
  toJSON MessageChatSetBackground
    { old_background_message_id = old_background_message_id_
    , background                = background_
    }
      = A.object
        [ "@type"                     A..= AT.String "messageChatSetBackground"
        , "old_background_message_id" A..= old_background_message_id_
        , "background"                A..= background_
        ]
  toJSON MessageChatSetTheme
    { theme_name = theme_name_
    }
      = A.object
        [ "@type"      A..= AT.String "messageChatSetTheme"
        , "theme_name" A..= theme_name_
        ]
  toJSON MessageChatSetMessageAutoDeleteTime
    { message_auto_delete_time = message_auto_delete_time_
    , from_user_id             = from_user_id_
    }
      = A.object
        [ "@type"                    A..= AT.String "messageChatSetMessageAutoDeleteTime"
        , "message_auto_delete_time" A..= message_auto_delete_time_
        , "from_user_id"             A..= from_user_id_
        ]
  toJSON MessageForumTopicCreated
    { name = name_
    , icon = icon_
    }
      = A.object
        [ "@type" A..= AT.String "messageForumTopicCreated"
        , "name"  A..= name_
        , "icon"  A..= icon_
        ]
  toJSON MessageForumTopicEdited
    { name                      = name_
    , edit_icon_custom_emoji_id = edit_icon_custom_emoji_id_
    , icon_custom_emoji_id      = icon_custom_emoji_id_
    }
      = A.object
        [ "@type"                     A..= AT.String "messageForumTopicEdited"
        , "name"                      A..= name_
        , "edit_icon_custom_emoji_id" A..= edit_icon_custom_emoji_id_
        , "icon_custom_emoji_id"      A..= fmap I.writeInt64  icon_custom_emoji_id_
        ]
  toJSON MessageForumTopicIsClosedToggled
    { is_closed = is_closed_
    }
      = A.object
        [ "@type"     A..= AT.String "messageForumTopicIsClosedToggled"
        , "is_closed" A..= is_closed_
        ]
  toJSON MessageForumTopicIsHiddenToggled
    { is_hidden = is_hidden_
    }
      = A.object
        [ "@type"     A..= AT.String "messageForumTopicIsHiddenToggled"
        , "is_hidden" A..= is_hidden_
        ]
  toJSON MessageSuggestProfilePhoto
    { _photo = _photo_
    }
      = A.object
        [ "@type" A..= AT.String "messageSuggestProfilePhoto"
        , "photo" A..= _photo_
        ]
  toJSON MessageCustomServiceAction
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "messageCustomServiceAction"
        , "text"  A..= _text_
        ]
  toJSON MessageGameScore
    { game_message_id = game_message_id_
    , game_id         = game_id_
    , score           = score_
    }
      = A.object
        [ "@type"           A..= AT.String "messageGameScore"
        , "game_message_id" A..= game_message_id_
        , "game_id"         A..= fmap I.writeInt64  game_id_
        , "score"           A..= score_
        ]
  toJSON MessagePaymentSuccessful
    { invoice_chat_id    = invoice_chat_id_
    , invoice_message_id = invoice_message_id_
    , currency           = currency_
    , total_amount       = total_amount_
    , is_recurring       = is_recurring_
    , is_first_recurring = is_first_recurring_
    , invoice_name       = invoice_name_
    }
      = A.object
        [ "@type"              A..= AT.String "messagePaymentSuccessful"
        , "invoice_chat_id"    A..= invoice_chat_id_
        , "invoice_message_id" A..= invoice_message_id_
        , "currency"           A..= currency_
        , "total_amount"       A..= total_amount_
        , "is_recurring"       A..= is_recurring_
        , "is_first_recurring" A..= is_first_recurring_
        , "invoice_name"       A..= invoice_name_
        ]
  toJSON MessagePaymentSuccessfulBot
    { currency                   = currency_
    , total_amount               = total_amount_
    , is_recurring               = is_recurring_
    , is_first_recurring         = is_first_recurring_
    , invoice_payload            = invoice_payload_
    , shipping_option_id         = shipping_option_id_
    , order_info                 = order_info_
    , telegram_payment_charge_id = telegram_payment_charge_id_
    , provider_payment_charge_id = provider_payment_charge_id_
    }
      = A.object
        [ "@type"                      A..= AT.String "messagePaymentSuccessfulBot"
        , "currency"                   A..= currency_
        , "total_amount"               A..= total_amount_
        , "is_recurring"               A..= is_recurring_
        , "is_first_recurring"         A..= is_first_recurring_
        , "invoice_payload"            A..= fmap I.writeBytes  invoice_payload_
        , "shipping_option_id"         A..= shipping_option_id_
        , "order_info"                 A..= order_info_
        , "telegram_payment_charge_id" A..= telegram_payment_charge_id_
        , "provider_payment_charge_id" A..= provider_payment_charge_id_
        ]
  toJSON MessageGiftedPremium
    { gifter_user_id        = gifter_user_id_
    , currency              = currency_
    , amount                = amount_
    , cryptocurrency        = cryptocurrency_
    , cryptocurrency_amount = cryptocurrency_amount_
    , month_count           = month_count_
    , sticker               = sticker_
    }
      = A.object
        [ "@type"                 A..= AT.String "messageGiftedPremium"
        , "gifter_user_id"        A..= gifter_user_id_
        , "currency"              A..= currency_
        , "amount"                A..= amount_
        , "cryptocurrency"        A..= cryptocurrency_
        , "cryptocurrency_amount" A..= fmap I.writeInt64  cryptocurrency_amount_
        , "month_count"           A..= month_count_
        , "sticker"               A..= sticker_
        ]
  toJSON MessageContactRegistered
      = A.object
        [ "@type" A..= AT.String "messageContactRegistered"
        ]
  toJSON MessageUserShared
    { user_id   = user_id_
    , button_id = button_id_
    }
      = A.object
        [ "@type"     A..= AT.String "messageUserShared"
        , "user_id"   A..= user_id_
        , "button_id" A..= button_id_
        ]
  toJSON MessageChatShared
    { chat_id   = chat_id_
    , button_id = button_id_
    }
      = A.object
        [ "@type"     A..= AT.String "messageChatShared"
        , "chat_id"   A..= chat_id_
        , "button_id" A..= button_id_
        ]
  toJSON MessageWebsiteConnected
    { domain_name = domain_name_
    }
      = A.object
        [ "@type"       A..= AT.String "messageWebsiteConnected"
        , "domain_name" A..= domain_name_
        ]
  toJSON MessageBotWriteAccessAllowed
    { web_app = web_app_
    }
      = A.object
        [ "@type"   A..= AT.String "messageBotWriteAccessAllowed"
        , "web_app" A..= web_app_
        ]
  toJSON MessageWebAppDataSent
    { button_text = button_text_
    }
      = A.object
        [ "@type"       A..= AT.String "messageWebAppDataSent"
        , "button_text" A..= button_text_
        ]
  toJSON MessageWebAppDataReceived
    { button_text = button_text_
    , _data       = _data_
    }
      = A.object
        [ "@type"       A..= AT.String "messageWebAppDataReceived"
        , "button_text" A..= button_text_
        , "data"        A..= _data_
        ]
  toJSON MessagePassportDataSent
    { types = types_
    }
      = A.object
        [ "@type" A..= AT.String "messagePassportDataSent"
        , "types" A..= types_
        ]
  toJSON MessagePassportDataReceived
    { elements    = elements_
    , credentials = credentials_
    }
      = A.object
        [ "@type"       A..= AT.String "messagePassportDataReceived"
        , "elements"    A..= elements_
        , "credentials" A..= credentials_
        ]
  toJSON MessageProximityAlertTriggered
    { traveler_id = traveler_id_
    , watcher_id  = watcher_id_
    , distance    = distance_
    }
      = A.object
        [ "@type"       A..= AT.String "messageProximityAlertTriggered"
        , "traveler_id" A..= traveler_id_
        , "watcher_id"  A..= watcher_id_
        , "distance"    A..= distance_
        ]
  toJSON MessageUnsupported
      = A.object
        [ "@type" A..= AT.String "messageUnsupported"
        ]

defaultMessageText :: MessageContent
defaultMessageText =
  MessageText
    { text     = Nothing
    , web_page = Nothing
    }

defaultMessageAnimation :: MessageContent
defaultMessageAnimation =
  MessageAnimation
    { animation   = Nothing
    , caption     = Nothing
    , has_spoiler = Nothing
    , is_secret   = Nothing
    }

defaultMessageAudio :: MessageContent
defaultMessageAudio =
  MessageAudio
    { audio   = Nothing
    , caption = Nothing
    }

defaultMessageDocument :: MessageContent
defaultMessageDocument =
  MessageDocument
    { document = Nothing
    , caption  = Nothing
    }

defaultMessagePhoto :: MessageContent
defaultMessagePhoto =
  MessagePhoto
    { photo       = Nothing
    , caption     = Nothing
    , has_spoiler = Nothing
    , is_secret   = Nothing
    }

defaultMessageSticker :: MessageContent
defaultMessageSticker =
  MessageSticker
    { sticker    = Nothing
    , is_premium = Nothing
    }

defaultMessageVideo :: MessageContent
defaultMessageVideo =
  MessageVideo
    { video       = Nothing
    , caption     = Nothing
    , has_spoiler = Nothing
    , is_secret   = Nothing
    }

defaultMessageVideoNote :: MessageContent
defaultMessageVideoNote =
  MessageVideoNote
    { video_note = Nothing
    , is_viewed  = Nothing
    , is_secret  = Nothing
    }

defaultMessageVoiceNote :: MessageContent
defaultMessageVoiceNote =
  MessageVoiceNote
    { voice_note  = Nothing
    , caption     = Nothing
    , is_listened = Nothing
    }

defaultMessageLocation :: MessageContent
defaultMessageLocation =
  MessageLocation
    { location               = Nothing
    , live_period            = Nothing
    , expires_in             = Nothing
    , heading                = Nothing
    , proximity_alert_radius = Nothing
    }

defaultMessageVenue :: MessageContent
defaultMessageVenue =
  MessageVenue
    { venue = Nothing
    }

defaultMessageContact :: MessageContent
defaultMessageContact =
  MessageContact
    { contact = Nothing
    }

defaultMessageAnimatedEmoji :: MessageContent
defaultMessageAnimatedEmoji =
  MessageAnimatedEmoji
    { animated_emoji = Nothing
    , emoji          = Nothing
    }

defaultMessageDice :: MessageContent
defaultMessageDice =
  MessageDice
    { initial_state                  = Nothing
    , final_state                    = Nothing
    , emoji                          = Nothing
    , value                          = Nothing
    , success_animation_frame_number = Nothing
    }

defaultMessageGame :: MessageContent
defaultMessageGame =
  MessageGame
    { game = Nothing
    }

defaultMessagePoll :: MessageContent
defaultMessagePoll =
  MessagePoll
    { poll = Nothing
    }

defaultMessageStory :: MessageContent
defaultMessageStory =
  MessageStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , via_mention          = Nothing
    }

defaultMessageInvoice :: MessageContent
defaultMessageInvoice =
  MessageInvoice
    { title                 = Nothing
    , description           = Nothing
    , photo                 = Nothing
    , currency              = Nothing
    , total_amount          = Nothing
    , start_parameter       = Nothing
    , is_test               = Nothing
    , need_shipping_address = Nothing
    , receipt_message_id    = Nothing
    , extended_media        = Nothing
    }

defaultMessageCall :: MessageContent
defaultMessageCall =
  MessageCall
    { is_video       = Nothing
    , discard_reason = Nothing
    , duration       = Nothing
    }

defaultMessageVideoChatScheduled :: MessageContent
defaultMessageVideoChatScheduled =
  MessageVideoChatScheduled
    { group_call_id = Nothing
    , start_date    = Nothing
    }

defaultMessageVideoChatStarted :: MessageContent
defaultMessageVideoChatStarted =
  MessageVideoChatStarted
    { group_call_id = Nothing
    }

defaultMessageVideoChatEnded :: MessageContent
defaultMessageVideoChatEnded =
  MessageVideoChatEnded
    { duration = Nothing
    }

defaultMessageInviteVideoChatParticipants :: MessageContent
defaultMessageInviteVideoChatParticipants =
  MessageInviteVideoChatParticipants
    { group_call_id = Nothing
    , user_ids      = Nothing
    }

defaultMessageBasicGroupChatCreate :: MessageContent
defaultMessageBasicGroupChatCreate =
  MessageBasicGroupChatCreate
    { title           = Nothing
    , member_user_ids = Nothing
    }

defaultMessageSupergroupChatCreate :: MessageContent
defaultMessageSupergroupChatCreate =
  MessageSupergroupChatCreate
    { title = Nothing
    }

defaultMessageChatChangeTitle :: MessageContent
defaultMessageChatChangeTitle =
  MessageChatChangeTitle
    { title = Nothing
    }

defaultMessageChatChangePhoto :: MessageContent
defaultMessageChatChangePhoto =
  MessageChatChangePhoto
    { _photo = Nothing
    }

defaultMessageChatAddMembers :: MessageContent
defaultMessageChatAddMembers =
  MessageChatAddMembers
    { member_user_ids = Nothing
    }

defaultMessageChatDeleteMember :: MessageContent
defaultMessageChatDeleteMember =
  MessageChatDeleteMember
    { user_id = Nothing
    }

defaultMessageChatUpgradeTo :: MessageContent
defaultMessageChatUpgradeTo =
  MessageChatUpgradeTo
    { supergroup_id = Nothing
    }

defaultMessageChatUpgradeFrom :: MessageContent
defaultMessageChatUpgradeFrom =
  MessageChatUpgradeFrom
    { title          = Nothing
    , basic_group_id = Nothing
    }

defaultMessagePinMessage :: MessageContent
defaultMessagePinMessage =
  MessagePinMessage
    { message_id = Nothing
    }

defaultMessageChatSetBackground :: MessageContent
defaultMessageChatSetBackground =
  MessageChatSetBackground
    { old_background_message_id = Nothing
    , background                = Nothing
    }

defaultMessageChatSetTheme :: MessageContent
defaultMessageChatSetTheme =
  MessageChatSetTheme
    { theme_name = Nothing
    }

defaultMessageChatSetMessageAutoDeleteTime :: MessageContent
defaultMessageChatSetMessageAutoDeleteTime =
  MessageChatSetMessageAutoDeleteTime
    { message_auto_delete_time = Nothing
    , from_user_id             = Nothing
    }

defaultMessageForumTopicCreated :: MessageContent
defaultMessageForumTopicCreated =
  MessageForumTopicCreated
    { name = Nothing
    , icon = Nothing
    }

defaultMessageForumTopicEdited :: MessageContent
defaultMessageForumTopicEdited =
  MessageForumTopicEdited
    { name                      = Nothing
    , edit_icon_custom_emoji_id = Nothing
    , icon_custom_emoji_id      = Nothing
    }

defaultMessageForumTopicIsClosedToggled :: MessageContent
defaultMessageForumTopicIsClosedToggled =
  MessageForumTopicIsClosedToggled
    { is_closed = Nothing
    }

defaultMessageForumTopicIsHiddenToggled :: MessageContent
defaultMessageForumTopicIsHiddenToggled =
  MessageForumTopicIsHiddenToggled
    { is_hidden = Nothing
    }

defaultMessageSuggestProfilePhoto :: MessageContent
defaultMessageSuggestProfilePhoto =
  MessageSuggestProfilePhoto
    { _photo = Nothing
    }

defaultMessageCustomServiceAction :: MessageContent
defaultMessageCustomServiceAction =
  MessageCustomServiceAction
    { _text = Nothing
    }

defaultMessageGameScore :: MessageContent
defaultMessageGameScore =
  MessageGameScore
    { game_message_id = Nothing
    , game_id         = Nothing
    , score           = Nothing
    }

defaultMessagePaymentSuccessful :: MessageContent
defaultMessagePaymentSuccessful =
  MessagePaymentSuccessful
    { invoice_chat_id    = Nothing
    , invoice_message_id = Nothing
    , currency           = Nothing
    , total_amount       = Nothing
    , is_recurring       = Nothing
    , is_first_recurring = Nothing
    , invoice_name       = Nothing
    }

defaultMessagePaymentSuccessfulBot :: MessageContent
defaultMessagePaymentSuccessfulBot =
  MessagePaymentSuccessfulBot
    { currency                   = Nothing
    , total_amount               = Nothing
    , is_recurring               = Nothing
    , is_first_recurring         = Nothing
    , invoice_payload            = Nothing
    , shipping_option_id         = Nothing
    , order_info                 = Nothing
    , telegram_payment_charge_id = Nothing
    , provider_payment_charge_id = Nothing
    }

defaultMessageGiftedPremium :: MessageContent
defaultMessageGiftedPremium =
  MessageGiftedPremium
    { gifter_user_id        = Nothing
    , currency              = Nothing
    , amount                = Nothing
    , cryptocurrency        = Nothing
    , cryptocurrency_amount = Nothing
    , month_count           = Nothing
    , sticker               = Nothing
    }

defaultMessageUserShared :: MessageContent
defaultMessageUserShared =
  MessageUserShared
    { user_id   = Nothing
    , button_id = Nothing
    }

defaultMessageChatShared :: MessageContent
defaultMessageChatShared =
  MessageChatShared
    { chat_id   = Nothing
    , button_id = Nothing
    }

defaultMessageWebsiteConnected :: MessageContent
defaultMessageWebsiteConnected =
  MessageWebsiteConnected
    { domain_name = Nothing
    }

defaultMessageBotWriteAccessAllowed :: MessageContent
defaultMessageBotWriteAccessAllowed =
  MessageBotWriteAccessAllowed
    { web_app = Nothing
    }

defaultMessageWebAppDataSent :: MessageContent
defaultMessageWebAppDataSent =
  MessageWebAppDataSent
    { button_text = Nothing
    }

defaultMessageWebAppDataReceived :: MessageContent
defaultMessageWebAppDataReceived =
  MessageWebAppDataReceived
    { button_text = Nothing
    , _data       = Nothing
    }

defaultMessagePassportDataSent :: MessageContent
defaultMessagePassportDataSent =
  MessagePassportDataSent
    { types = Nothing
    }

defaultMessagePassportDataReceived :: MessageContent
defaultMessagePassportDataReceived =
  MessagePassportDataReceived
    { elements    = Nothing
    , credentials = Nothing
    }

defaultMessageProximityAlertTriggered :: MessageContent
defaultMessageProximityAlertTriggered =
  MessageProximityAlertTriggered
    { traveler_id = Nothing
    , watcher_id  = Nothing
    , distance    = Nothing
    }

