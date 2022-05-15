{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AnimatedEmoji as AnimatedEmoji
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.CallDiscardReason as CallDiscardReason
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.Contact as Contact
import qualified TD.Data.DiceStickers as DiceStickers
import qualified TD.Data.Document as Document
import qualified TD.Data.EncryptedCredentials as EncryptedCredentials
import qualified TD.Data.EncryptedPassportElement as EncryptedPassportElement
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Game as Game
import qualified TD.Data.Location as Location
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.PassportElementType as PassportElementType
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Poll as Poll
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Venue as Venue
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote
import qualified TD.Data.WebPage as WebPage
import qualified Utils as U

-- | Contains the content of a message
data MessageContent
  = -- | A text message @text Text of the message @web_page A preview of the web page that's mentioned in the text; may be null
    MessageText
      { -- |
        web_page :: Maybe WebPage.WebPage,
        -- |
        text :: Maybe FormattedText.FormattedText
      }
  | -- | An animation message (GIF-style). @animation The animation description @caption Animation caption @is_secret True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
    MessageAnimation
      { -- |
        is_secret :: Maybe Bool,
        -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        animation :: Maybe Animation.Animation
      }
  | -- | An audio message @audio The audio description @caption Audio caption
    MessageAudio
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        audio :: Maybe Audio.Audio
      }
  | -- | A document message (general file) @document The document description @caption Document caption
    MessageDocument
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        document :: Maybe Document.Document
      }
  | -- | A photo message @photo The photo description @caption Photo caption @is_secret True, if the photo must be blurred and must be shown only while tapped
    MessagePhoto
      { -- |
        is_secret :: Maybe Bool,
        -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        photo :: Maybe Photo.Photo
      }
  | -- | An expired photo message (self-destructed after TTL has elapsed)
    MessageExpiredPhoto
  | -- | A sticker message @sticker The sticker description
    MessageSticker
      { -- |
        sticker :: Maybe Sticker.Sticker
      }
  | -- | A video message @video The video description @caption Video caption @is_secret True, if the video thumbnail must be blurred and the video must be shown only while tapped
    MessageVideo
      { -- |
        is_secret :: Maybe Bool,
        -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        video :: Maybe Video.Video
      }
  | -- | An expired video message (self-destructed after TTL has elapsed)
    MessageExpiredVideo
  | -- | A video note message @video_note The video note description @is_viewed True, if at least one of the recipients has viewed the video note @is_secret True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
    MessageVideoNote
      { -- |
        is_secret :: Maybe Bool,
        -- |
        is_viewed :: Maybe Bool,
        -- |
        video_note :: Maybe VideoNote.VideoNote
      }
  | -- | A voice note message @voice_note The voice note description @caption Voice note caption @is_listened True, if at least one of the recipients has listened to the voice note
    MessageVoiceNote
      { -- |
        is_listened :: Maybe Bool,
        -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        voice_note :: Maybe VoiceNote.VoiceNote
      }
  | -- | A message with a location @location The location description @live_period Time relative to the message send date, for which the location can be updated, in seconds
    MessageLocation
      { -- | For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled. Available only for the message sender
        proximity_alert_radius :: Maybe Int,
        -- | For live locations, a direction in which the location moves, in degrees; 1-360. If 0 the direction is unknown
        heading :: Maybe Int,
        -- | Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
        expires_in :: Maybe Int,
        -- |
        live_period :: Maybe Int,
        -- |
        location :: Maybe Location.Location
      }
  | -- | A message with information about a venue @venue The venue description
    MessageVenue
      { -- |
        venue :: Maybe Venue.Venue
      }
  | -- | A message with a user contact @contact The contact description
    MessageContact
      { -- |
        contact :: Maybe Contact.Contact
      }
  | -- | A message with an animated emoji @animated_emoji The animated emoji @emoji The corresponding emoji
    MessageAnimatedEmoji
      { -- |
        emoji :: Maybe String,
        -- |
        animated_emoji :: Maybe AnimatedEmoji.AnimatedEmoji
      }
  | -- | A dice message. The dice value is randomly generated by the server
    MessageDice
      { -- | Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
        success_animation_frame_number :: Maybe Int,
        -- | The dice value. If the value is 0, the dice don't have final state yet
        value :: Maybe Int,
        -- | Emoji on which the dice throw animation is based
        emoji :: Maybe String,
        -- | The animated stickers with the final dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
        final_state :: Maybe DiceStickers.DiceStickers,
        -- | The animated stickers with the initial dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
        initial_state :: Maybe DiceStickers.DiceStickers
      }
  | -- | A message with a game @game The game description
    MessageGame
      { -- |
        game :: Maybe Game.Game
      }
  | -- | A message with a poll @poll The poll description
    MessagePoll
      { -- |
        poll :: Maybe Poll.Poll
      }
  | -- | A message with an invoice from a bot @title Product title @param_description Product description @photo Product photo; may be null @currency Currency for the product price @total_amount Product total price in the smallest units of the currency
    MessageInvoice
      { -- |
        receipt_message_id :: Maybe Int,
        -- | True, if the shipping address must be specified @receipt_message_id The identifier of the message with the receipt, after the product has been purchased
        need_shipping_address :: Maybe Bool,
        -- |
        is_test :: Maybe Bool,
        -- | Unique invoice bot start_parameter. To share an invoice use the URL https://t.me/{bot_username}?start={start_parameter} @is_test True, if the invoice is a test invoice
        start_parameter :: Maybe String,
        -- |
        total_amount :: Maybe Int,
        -- |
        currency :: Maybe String,
        -- |
        photo :: Maybe Photo.Photo,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String
      }
  | -- | A message with information about an ended call @is_video True, if the call was a video call @discard_reason Reason why the call was discarded @duration Call duration, in seconds
    MessageCall
      { -- |
        duration :: Maybe Int,
        -- |
        discard_reason :: Maybe CallDiscardReason.CallDiscardReason,
        -- |
        is_video :: Maybe Bool
      }
  | -- | A new video chat was scheduled @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall @start_date Point in time (Unix timestamp) when the group call is supposed to be started by an administrator
    MessageVideoChatScheduled
      { -- |
        start_date :: Maybe Int,
        -- |
        group_call_id :: Maybe Int
      }
  | -- | A newly created video chat @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall
    MessageVideoChatStarted
      { -- |
        group_call_id :: Maybe Int
      }
  | -- | A message with information about an ended video chat @duration Call duration, in seconds
    MessageVideoChatEnded
      { -- |
        duration :: Maybe Int
      }
  | -- | A message with information about an invite to a video chat @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall @user_ids Invited user identifiers
    MessageInviteVideoChatParticipants
      { -- |
        user_ids :: Maybe [Int],
        -- |
        group_call_id :: Maybe Int
      }
  | -- | A newly created basic group @title Title of the basic group @member_user_ids User identifiers of members in the basic group
    MessageBasicGroupChatCreate
      { -- |
        member_user_ids :: Maybe [Int],
        -- |
        title :: Maybe String
      }
  | -- | A newly created supergroup or channel @title Title of the supergroup or channel
    MessageSupergroupChatCreate
      { -- |
        title :: Maybe String
      }
  | -- | An updated chat title @title New chat title
    MessageChatChangeTitle
      { -- |
        title :: Maybe String
      }
  | -- | An updated chat photo @photo New chat photo
    MessageChatChangePhoto
      { -- |
        _photo :: Maybe ChatPhoto.ChatPhoto
      }
  | -- | A deleted chat photo
    MessageChatDeletePhoto
  | -- | New chat members were added @member_user_ids User identifiers of the new members
    MessageChatAddMembers
      { -- |
        member_user_ids :: Maybe [Int]
      }
  | -- | A new member joined the chat via an invite link
    MessageChatJoinByLink
  | -- | A new member was accepted to the chat by an administrator
    MessageChatJoinByRequest
  | -- | A chat member was deleted @user_id User identifier of the deleted chat member
    MessageChatDeleteMember
      { -- |
        user_id :: Maybe Int
      }
  | -- | A basic group was upgraded to a supergroup and was deactivated as the result @supergroup_id Identifier of the supergroup to which the basic group was upgraded
    MessageChatUpgradeTo
      { -- |
        supergroup_id :: Maybe Int
      }
  | -- | A supergroup has been created from a basic group @title Title of the newly created supergroup @basic_group_id The identifier of the original basic group
    MessageChatUpgradeFrom
      { -- |
        basic_group_id :: Maybe Int,
        -- |
        title :: Maybe String
      }
  | -- | A message has been pinned @message_id Identifier of the pinned message, can be an identifier of a deleted message or 0
    MessagePinMessage
      { -- |
        message_id :: Maybe Int
      }
  | -- | A screenshot of a message in the chat has been taken
    MessageScreenshotTaken
  | -- | A theme in the chat has been changed @theme_name If non-empty, name of a new theme, set for the chat. Otherwise chat theme was reset to the default one
    MessageChatSetTheme
      { -- |
        theme_name :: Maybe String
      }
  | -- | The TTL (Time To Live) setting for messages in the chat has been changed @ttl New message TTL
    MessageChatSetTtl
      { -- |
        ttl :: Maybe Int
      }
  | -- | A non-standard action has happened in the chat @text Message text to be shown in the chat
    MessageCustomServiceAction
      { -- |
        _text :: Maybe String
      }
  | -- | A new high score was achieved in a game @game_message_id Identifier of the message with the game, can be an identifier of a deleted message @game_id Identifier of the game; may be different from the games presented in the message with the game @score New score
    MessageGameScore
      { -- |
        score :: Maybe Int,
        -- |
        game_id :: Maybe Int,
        -- |
        game_message_id :: Maybe Int
      }
  | -- | A payment has been completed @invoice_chat_id Identifier of the chat, containing the corresponding invoice message; 0 if unknown @invoice_message_id Identifier of the message with the corresponding invoice; can be an identifier of a deleted message @currency Currency for the price of the product @total_amount Total price for the product, in the smallest units of the currency
    MessagePaymentSuccessful
      { -- |
        total_amount :: Maybe Int,
        -- |
        currency :: Maybe String,
        -- |
        invoice_message_id :: Maybe Int,
        -- |
        invoice_chat_id :: Maybe Int
      }
  | -- | A payment has been completed; for bots only @currency Currency for price of the product
    MessagePaymentSuccessfulBot
      { -- |
        provider_payment_charge_id :: Maybe String,
        -- | Telegram payment identifier @provider_payment_charge_id Provider payment identifier
        telegram_payment_charge_id :: Maybe String,
        -- |
        order_info :: Maybe OrderInfo.OrderInfo,
        -- |
        shipping_option_id :: Maybe String,
        -- |
        invoice_payload :: Maybe String,
        -- | Total price for the product, in the smallest units of the currency @invoice_payload Invoice payload @shipping_option_id Identifier of the shipping option chosen by the user; may be empty if not applicable @order_info Information about the order; may be null
        total_amount :: Maybe Int,
        -- |
        currency :: Maybe String
      }
  | -- | A contact has registered with Telegram
    MessageContactRegistered
  | -- | The current user has connected a website by logging in using Telegram Login Widget on it @domain_name Domain name of the connected website
    MessageWebsiteConnected
      { -- |
        domain_name :: Maybe String
      }
  | -- | Data from a web app has been sent to a bot @button_text Text of the keyboardButtonTypeWebApp button, which opened the web app
    MessageWebAppDataSent
      { -- |
        button_text :: Maybe String
      }
  | -- | Data from a web app has been received; for bots only @button_text Text of the keyboardButtonTypeWebApp button, which opened the web app @data Received data
    MessageWebAppDataReceived
      { -- |
        _data :: Maybe String,
        -- |
        button_text :: Maybe String
      }
  | -- | Telegram Passport data has been sent to a bot @types List of Telegram Passport element types sent
    MessagePassportDataSent
      { -- |
        types :: Maybe [PassportElementType.PassportElementType]
      }
  | -- | Telegram Passport data has been received; for bots only @elements List of received Telegram Passport elements @credentials Encrypted data credentials
    MessagePassportDataReceived
      { -- |
        credentials :: Maybe EncryptedCredentials.EncryptedCredentials,
        -- |
        elements :: Maybe [EncryptedPassportElement.EncryptedPassportElement]
      }
  | -- | A user in the chat came within proximity alert range @traveler_id The identifier of a user or chat that triggered the proximity alert @watcher_id The identifier of a user or chat that subscribed for the proximity alert @distance The distance between the users
    MessageProximityAlertTriggered
      { -- |
        distance :: Maybe Int,
        -- |
        watcher_id :: Maybe MessageSender.MessageSender,
        -- |
        traveler_id :: Maybe MessageSender.MessageSender
      }
  | -- | Message content that is not supported in the current TDLib version
    MessageUnsupported
  deriving (Eq)

instance Show MessageContent where
  show
    MessageText
      { web_page = web_page_,
        text = text_
      } =
      "MessageText"
        ++ U.cc
          [ U.p "web_page" web_page_,
            U.p "text" text_
          ]
  show
    MessageAnimation
      { is_secret = is_secret_,
        caption = caption_,
        animation = animation_
      } =
      "MessageAnimation"
        ++ U.cc
          [ U.p "is_secret" is_secret_,
            U.p "caption" caption_,
            U.p "animation" animation_
          ]
  show
    MessageAudio
      { caption = caption_,
        audio = audio_
      } =
      "MessageAudio"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "audio" audio_
          ]
  show
    MessageDocument
      { caption = caption_,
        document = document_
      } =
      "MessageDocument"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "document" document_
          ]
  show
    MessagePhoto
      { is_secret = is_secret_,
        caption = caption_,
        photo = photo_
      } =
      "MessagePhoto"
        ++ U.cc
          [ U.p "is_secret" is_secret_,
            U.p "caption" caption_,
            U.p "photo" photo_
          ]
  show MessageExpiredPhoto =
    "MessageExpiredPhoto"
      ++ U.cc
        []
  show
    MessageSticker
      { sticker = sticker_
      } =
      "MessageSticker"
        ++ U.cc
          [ U.p "sticker" sticker_
          ]
  show
    MessageVideo
      { is_secret = is_secret_,
        caption = caption_,
        video = video_
      } =
      "MessageVideo"
        ++ U.cc
          [ U.p "is_secret" is_secret_,
            U.p "caption" caption_,
            U.p "video" video_
          ]
  show MessageExpiredVideo =
    "MessageExpiredVideo"
      ++ U.cc
        []
  show
    MessageVideoNote
      { is_secret = is_secret_,
        is_viewed = is_viewed_,
        video_note = video_note_
      } =
      "MessageVideoNote"
        ++ U.cc
          [ U.p "is_secret" is_secret_,
            U.p "is_viewed" is_viewed_,
            U.p "video_note" video_note_
          ]
  show
    MessageVoiceNote
      { is_listened = is_listened_,
        caption = caption_,
        voice_note = voice_note_
      } =
      "MessageVoiceNote"
        ++ U.cc
          [ U.p "is_listened" is_listened_,
            U.p "caption" caption_,
            U.p "voice_note" voice_note_
          ]
  show
    MessageLocation
      { proximity_alert_radius = proximity_alert_radius_,
        heading = heading_,
        expires_in = expires_in_,
        live_period = live_period_,
        location = location_
      } =
      "MessageLocation"
        ++ U.cc
          [ U.p "proximity_alert_radius" proximity_alert_radius_,
            U.p "heading" heading_,
            U.p "expires_in" expires_in_,
            U.p "live_period" live_period_,
            U.p "location" location_
          ]
  show
    MessageVenue
      { venue = venue_
      } =
      "MessageVenue"
        ++ U.cc
          [ U.p "venue" venue_
          ]
  show
    MessageContact
      { contact = contact_
      } =
      "MessageContact"
        ++ U.cc
          [ U.p "contact" contact_
          ]
  show
    MessageAnimatedEmoji
      { emoji = emoji_,
        animated_emoji = animated_emoji_
      } =
      "MessageAnimatedEmoji"
        ++ U.cc
          [ U.p "emoji" emoji_,
            U.p "animated_emoji" animated_emoji_
          ]
  show
    MessageDice
      { success_animation_frame_number = success_animation_frame_number_,
        value = value_,
        emoji = emoji_,
        final_state = final_state_,
        initial_state = initial_state_
      } =
      "MessageDice"
        ++ U.cc
          [ U.p "success_animation_frame_number" success_animation_frame_number_,
            U.p "value" value_,
            U.p "emoji" emoji_,
            U.p "final_state" final_state_,
            U.p "initial_state" initial_state_
          ]
  show
    MessageGame
      { game = game_
      } =
      "MessageGame"
        ++ U.cc
          [ U.p "game" game_
          ]
  show
    MessagePoll
      { poll = poll_
      } =
      "MessagePoll"
        ++ U.cc
          [ U.p "poll" poll_
          ]
  show
    MessageInvoice
      { receipt_message_id = receipt_message_id_,
        need_shipping_address = need_shipping_address_,
        is_test = is_test_,
        start_parameter = start_parameter_,
        total_amount = total_amount_,
        currency = currency_,
        photo = photo_,
        description = description_,
        title = title_
      } =
      "MessageInvoice"
        ++ U.cc
          [ U.p "receipt_message_id" receipt_message_id_,
            U.p "need_shipping_address" need_shipping_address_,
            U.p "is_test" is_test_,
            U.p "start_parameter" start_parameter_,
            U.p "total_amount" total_amount_,
            U.p "currency" currency_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "title" title_
          ]
  show
    MessageCall
      { duration = duration_,
        discard_reason = discard_reason_,
        is_video = is_video_
      } =
      "MessageCall"
        ++ U.cc
          [ U.p "duration" duration_,
            U.p "discard_reason" discard_reason_,
            U.p "is_video" is_video_
          ]
  show
    MessageVideoChatScheduled
      { start_date = start_date_,
        group_call_id = group_call_id_
      } =
      "MessageVideoChatScheduled"
        ++ U.cc
          [ U.p "start_date" start_date_,
            U.p "group_call_id" group_call_id_
          ]
  show
    MessageVideoChatStarted
      { group_call_id = group_call_id_
      } =
      "MessageVideoChatStarted"
        ++ U.cc
          [ U.p "group_call_id" group_call_id_
          ]
  show
    MessageVideoChatEnded
      { duration = duration_
      } =
      "MessageVideoChatEnded"
        ++ U.cc
          [ U.p "duration" duration_
          ]
  show
    MessageInviteVideoChatParticipants
      { user_ids = user_ids_,
        group_call_id = group_call_id_
      } =
      "MessageInviteVideoChatParticipants"
        ++ U.cc
          [ U.p "user_ids" user_ids_,
            U.p "group_call_id" group_call_id_
          ]
  show
    MessageBasicGroupChatCreate
      { member_user_ids = member_user_ids_,
        title = title_
      } =
      "MessageBasicGroupChatCreate"
        ++ U.cc
          [ U.p "member_user_ids" member_user_ids_,
            U.p "title" title_
          ]
  show
    MessageSupergroupChatCreate
      { title = title_
      } =
      "MessageSupergroupChatCreate"
        ++ U.cc
          [ U.p "title" title_
          ]
  show
    MessageChatChangeTitle
      { title = title_
      } =
      "MessageChatChangeTitle"
        ++ U.cc
          [ U.p "title" title_
          ]
  show
    MessageChatChangePhoto
      { _photo = _photo_
      } =
      "MessageChatChangePhoto"
        ++ U.cc
          [ U.p "_photo" _photo_
          ]
  show MessageChatDeletePhoto =
    "MessageChatDeletePhoto"
      ++ U.cc
        []
  show
    MessageChatAddMembers
      { member_user_ids = member_user_ids_
      } =
      "MessageChatAddMembers"
        ++ U.cc
          [ U.p "member_user_ids" member_user_ids_
          ]
  show MessageChatJoinByLink =
    "MessageChatJoinByLink"
      ++ U.cc
        []
  show MessageChatJoinByRequest =
    "MessageChatJoinByRequest"
      ++ U.cc
        []
  show
    MessageChatDeleteMember
      { user_id = user_id_
      } =
      "MessageChatDeleteMember"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]
  show
    MessageChatUpgradeTo
      { supergroup_id = supergroup_id_
      } =
      "MessageChatUpgradeTo"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id_
          ]
  show
    MessageChatUpgradeFrom
      { basic_group_id = basic_group_id_,
        title = title_
      } =
      "MessageChatUpgradeFrom"
        ++ U.cc
          [ U.p "basic_group_id" basic_group_id_,
            U.p "title" title_
          ]
  show
    MessagePinMessage
      { message_id = message_id_
      } =
      "MessagePinMessage"
        ++ U.cc
          [ U.p "message_id" message_id_
          ]
  show MessageScreenshotTaken =
    "MessageScreenshotTaken"
      ++ U.cc
        []
  show
    MessageChatSetTheme
      { theme_name = theme_name_
      } =
      "MessageChatSetTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name_
          ]
  show
    MessageChatSetTtl
      { ttl = ttl_
      } =
      "MessageChatSetTtl"
        ++ U.cc
          [ U.p "ttl" ttl_
          ]
  show
    MessageCustomServiceAction
      { _text = _text_
      } =
      "MessageCustomServiceAction"
        ++ U.cc
          [ U.p "_text" _text_
          ]
  show
    MessageGameScore
      { score = score_,
        game_id = game_id_,
        game_message_id = game_message_id_
      } =
      "MessageGameScore"
        ++ U.cc
          [ U.p "score" score_,
            U.p "game_id" game_id_,
            U.p "game_message_id" game_message_id_
          ]
  show
    MessagePaymentSuccessful
      { total_amount = total_amount_,
        currency = currency_,
        invoice_message_id = invoice_message_id_,
        invoice_chat_id = invoice_chat_id_
      } =
      "MessagePaymentSuccessful"
        ++ U.cc
          [ U.p "total_amount" total_amount_,
            U.p "currency" currency_,
            U.p "invoice_message_id" invoice_message_id_,
            U.p "invoice_chat_id" invoice_chat_id_
          ]
  show
    MessagePaymentSuccessfulBot
      { provider_payment_charge_id = provider_payment_charge_id_,
        telegram_payment_charge_id = telegram_payment_charge_id_,
        order_info = order_info_,
        shipping_option_id = shipping_option_id_,
        invoice_payload = invoice_payload_,
        total_amount = total_amount_,
        currency = currency_
      } =
      "MessagePaymentSuccessfulBot"
        ++ U.cc
          [ U.p "provider_payment_charge_id" provider_payment_charge_id_,
            U.p "telegram_payment_charge_id" telegram_payment_charge_id_,
            U.p "order_info" order_info_,
            U.p "shipping_option_id" shipping_option_id_,
            U.p "invoice_payload" invoice_payload_,
            U.p "total_amount" total_amount_,
            U.p "currency" currency_
          ]
  show MessageContactRegistered =
    "MessageContactRegistered"
      ++ U.cc
        []
  show
    MessageWebsiteConnected
      { domain_name = domain_name_
      } =
      "MessageWebsiteConnected"
        ++ U.cc
          [ U.p "domain_name" domain_name_
          ]
  show
    MessageWebAppDataSent
      { button_text = button_text_
      } =
      "MessageWebAppDataSent"
        ++ U.cc
          [ U.p "button_text" button_text_
          ]
  show
    MessageWebAppDataReceived
      { _data = _data_,
        button_text = button_text_
      } =
      "MessageWebAppDataReceived"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "button_text" button_text_
          ]
  show
    MessagePassportDataSent
      { types = types_
      } =
      "MessagePassportDataSent"
        ++ U.cc
          [ U.p "types" types_
          ]
  show
    MessagePassportDataReceived
      { credentials = credentials_,
        elements = elements_
      } =
      "MessagePassportDataReceived"
        ++ U.cc
          [ U.p "credentials" credentials_,
            U.p "elements" elements_
          ]
  show
    MessageProximityAlertTriggered
      { distance = distance_,
        watcher_id = watcher_id_,
        traveler_id = traveler_id_
      } =
      "MessageProximityAlertTriggered"
        ++ U.cc
          [ U.p "distance" distance_,
            U.p "watcher_id" watcher_id_,
            U.p "traveler_id" traveler_id_
          ]
  show MessageUnsupported =
    "MessageUnsupported"
      ++ U.cc
        []

instance T.FromJSON MessageContent where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageText" -> parseMessageText v
      "messageAnimation" -> parseMessageAnimation v
      "messageAudio" -> parseMessageAudio v
      "messageDocument" -> parseMessageDocument v
      "messagePhoto" -> parseMessagePhoto v
      "messageExpiredPhoto" -> parseMessageExpiredPhoto v
      "messageSticker" -> parseMessageSticker v
      "messageVideo" -> parseMessageVideo v
      "messageExpiredVideo" -> parseMessageExpiredVideo v
      "messageVideoNote" -> parseMessageVideoNote v
      "messageVoiceNote" -> parseMessageVoiceNote v
      "messageLocation" -> parseMessageLocation v
      "messageVenue" -> parseMessageVenue v
      "messageContact" -> parseMessageContact v
      "messageAnimatedEmoji" -> parseMessageAnimatedEmoji v
      "messageDice" -> parseMessageDice v
      "messageGame" -> parseMessageGame v
      "messagePoll" -> parseMessagePoll v
      "messageInvoice" -> parseMessageInvoice v
      "messageCall" -> parseMessageCall v
      "messageVideoChatScheduled" -> parseMessageVideoChatScheduled v
      "messageVideoChatStarted" -> parseMessageVideoChatStarted v
      "messageVideoChatEnded" -> parseMessageVideoChatEnded v
      "messageInviteVideoChatParticipants" -> parseMessageInviteVideoChatParticipants v
      "messageBasicGroupChatCreate" -> parseMessageBasicGroupChatCreate v
      "messageSupergroupChatCreate" -> parseMessageSupergroupChatCreate v
      "messageChatChangeTitle" -> parseMessageChatChangeTitle v
      "messageChatChangePhoto" -> parseMessageChatChangePhoto v
      "messageChatDeletePhoto" -> parseMessageChatDeletePhoto v
      "messageChatAddMembers" -> parseMessageChatAddMembers v
      "messageChatJoinByLink" -> parseMessageChatJoinByLink v
      "messageChatJoinByRequest" -> parseMessageChatJoinByRequest v
      "messageChatDeleteMember" -> parseMessageChatDeleteMember v
      "messageChatUpgradeTo" -> parseMessageChatUpgradeTo v
      "messageChatUpgradeFrom" -> parseMessageChatUpgradeFrom v
      "messagePinMessage" -> parseMessagePinMessage v
      "messageScreenshotTaken" -> parseMessageScreenshotTaken v
      "messageChatSetTheme" -> parseMessageChatSetTheme v
      "messageChatSetTtl" -> parseMessageChatSetTtl v
      "messageCustomServiceAction" -> parseMessageCustomServiceAction v
      "messageGameScore" -> parseMessageGameScore v
      "messagePaymentSuccessful" -> parseMessagePaymentSuccessful v
      "messagePaymentSuccessfulBot" -> parseMessagePaymentSuccessfulBot v
      "messageContactRegistered" -> parseMessageContactRegistered v
      "messageWebsiteConnected" -> parseMessageWebsiteConnected v
      "messageWebAppDataSent" -> parseMessageWebAppDataSent v
      "messageWebAppDataReceived" -> parseMessageWebAppDataReceived v
      "messagePassportDataSent" -> parseMessagePassportDataSent v
      "messagePassportDataReceived" -> parseMessagePassportDataReceived v
      "messageProximityAlertTriggered" -> parseMessageProximityAlertTriggered v
      "messageUnsupported" -> parseMessageUnsupported v
      _ -> mempty
    where
      parseMessageText :: A.Value -> T.Parser MessageContent
      parseMessageText = A.withObject "MessageText" $ \o -> do
        web_page_ <- o A..:? "web_page"
        text_ <- o A..:? "text"
        return $ MessageText {web_page = web_page_, text = text_}

      parseMessageAnimation :: A.Value -> T.Parser MessageContent
      parseMessageAnimation = A.withObject "MessageAnimation" $ \o -> do
        is_secret_ <- o A..:? "is_secret"
        caption_ <- o A..:? "caption"
        animation_ <- o A..:? "animation"
        return $ MessageAnimation {is_secret = is_secret_, caption = caption_, animation = animation_}

      parseMessageAudio :: A.Value -> T.Parser MessageContent
      parseMessageAudio = A.withObject "MessageAudio" $ \o -> do
        caption_ <- o A..:? "caption"
        audio_ <- o A..:? "audio"
        return $ MessageAudio {caption = caption_, audio = audio_}

      parseMessageDocument :: A.Value -> T.Parser MessageContent
      parseMessageDocument = A.withObject "MessageDocument" $ \o -> do
        caption_ <- o A..:? "caption"
        document_ <- o A..:? "document"
        return $ MessageDocument {caption = caption_, document = document_}

      parseMessagePhoto :: A.Value -> T.Parser MessageContent
      parseMessagePhoto = A.withObject "MessagePhoto" $ \o -> do
        is_secret_ <- o A..:? "is_secret"
        caption_ <- o A..:? "caption"
        photo_ <- o A..:? "photo"
        return $ MessagePhoto {is_secret = is_secret_, caption = caption_, photo = photo_}

      parseMessageExpiredPhoto :: A.Value -> T.Parser MessageContent
      parseMessageExpiredPhoto = A.withObject "MessageExpiredPhoto" $ \_ -> return MessageExpiredPhoto

      parseMessageSticker :: A.Value -> T.Parser MessageContent
      parseMessageSticker = A.withObject "MessageSticker" $ \o -> do
        sticker_ <- o A..:? "sticker"
        return $ MessageSticker {sticker = sticker_}

      parseMessageVideo :: A.Value -> T.Parser MessageContent
      parseMessageVideo = A.withObject "MessageVideo" $ \o -> do
        is_secret_ <- o A..:? "is_secret"
        caption_ <- o A..:? "caption"
        video_ <- o A..:? "video"
        return $ MessageVideo {is_secret = is_secret_, caption = caption_, video = video_}

      parseMessageExpiredVideo :: A.Value -> T.Parser MessageContent
      parseMessageExpiredVideo = A.withObject "MessageExpiredVideo" $ \_ -> return MessageExpiredVideo

      parseMessageVideoNote :: A.Value -> T.Parser MessageContent
      parseMessageVideoNote = A.withObject "MessageVideoNote" $ \o -> do
        is_secret_ <- o A..:? "is_secret"
        is_viewed_ <- o A..:? "is_viewed"
        video_note_ <- o A..:? "video_note"
        return $ MessageVideoNote {is_secret = is_secret_, is_viewed = is_viewed_, video_note = video_note_}

      parseMessageVoiceNote :: A.Value -> T.Parser MessageContent
      parseMessageVoiceNote = A.withObject "MessageVoiceNote" $ \o -> do
        is_listened_ <- o A..:? "is_listened"
        caption_ <- o A..:? "caption"
        voice_note_ <- o A..:? "voice_note"
        return $ MessageVoiceNote {is_listened = is_listened_, caption = caption_, voice_note = voice_note_}

      parseMessageLocation :: A.Value -> T.Parser MessageContent
      parseMessageLocation = A.withObject "MessageLocation" $ \o -> do
        proximity_alert_radius_ <- o A..:? "proximity_alert_radius"
        heading_ <- o A..:? "heading"
        expires_in_ <- o A..:? "expires_in"
        live_period_ <- o A..:? "live_period"
        location_ <- o A..:? "location"
        return $ MessageLocation {proximity_alert_radius = proximity_alert_radius_, heading = heading_, expires_in = expires_in_, live_period = live_period_, location = location_}

      parseMessageVenue :: A.Value -> T.Parser MessageContent
      parseMessageVenue = A.withObject "MessageVenue" $ \o -> do
        venue_ <- o A..:? "venue"
        return $ MessageVenue {venue = venue_}

      parseMessageContact :: A.Value -> T.Parser MessageContent
      parseMessageContact = A.withObject "MessageContact" $ \o -> do
        contact_ <- o A..:? "contact"
        return $ MessageContact {contact = contact_}

      parseMessageAnimatedEmoji :: A.Value -> T.Parser MessageContent
      parseMessageAnimatedEmoji = A.withObject "MessageAnimatedEmoji" $ \o -> do
        emoji_ <- o A..:? "emoji"
        animated_emoji_ <- o A..:? "animated_emoji"
        return $ MessageAnimatedEmoji {emoji = emoji_, animated_emoji = animated_emoji_}

      parseMessageDice :: A.Value -> T.Parser MessageContent
      parseMessageDice = A.withObject "MessageDice" $ \o -> do
        success_animation_frame_number_ <- o A..:? "success_animation_frame_number"
        value_ <- o A..:? "value"
        emoji_ <- o A..:? "emoji"
        final_state_ <- o A..:? "final_state"
        initial_state_ <- o A..:? "initial_state"
        return $ MessageDice {success_animation_frame_number = success_animation_frame_number_, value = value_, emoji = emoji_, final_state = final_state_, initial_state = initial_state_}

      parseMessageGame :: A.Value -> T.Parser MessageContent
      parseMessageGame = A.withObject "MessageGame" $ \o -> do
        game_ <- o A..:? "game"
        return $ MessageGame {game = game_}

      parseMessagePoll :: A.Value -> T.Parser MessageContent
      parseMessagePoll = A.withObject "MessagePoll" $ \o -> do
        poll_ <- o A..:? "poll"
        return $ MessagePoll {poll = poll_}

      parseMessageInvoice :: A.Value -> T.Parser MessageContent
      parseMessageInvoice = A.withObject "MessageInvoice" $ \o -> do
        receipt_message_id_ <- o A..:? "receipt_message_id"
        need_shipping_address_ <- o A..:? "need_shipping_address"
        is_test_ <- o A..:? "is_test"
        start_parameter_ <- o A..:? "start_parameter"
        total_amount_ <- o A..:? "total_amount"
        currency_ <- o A..:? "currency"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        return $ MessageInvoice {receipt_message_id = receipt_message_id_, need_shipping_address = need_shipping_address_, is_test = is_test_, start_parameter = start_parameter_, total_amount = total_amount_, currency = currency_, photo = photo_, description = description_, title = title_}

      parseMessageCall :: A.Value -> T.Parser MessageContent
      parseMessageCall = A.withObject "MessageCall" $ \o -> do
        duration_ <- o A..:? "duration"
        discard_reason_ <- o A..:? "discard_reason"
        is_video_ <- o A..:? "is_video"
        return $ MessageCall {duration = duration_, discard_reason = discard_reason_, is_video = is_video_}

      parseMessageVideoChatScheduled :: A.Value -> T.Parser MessageContent
      parseMessageVideoChatScheduled = A.withObject "MessageVideoChatScheduled" $ \o -> do
        start_date_ <- o A..:? "start_date"
        group_call_id_ <- o A..:? "group_call_id"
        return $ MessageVideoChatScheduled {start_date = start_date_, group_call_id = group_call_id_}

      parseMessageVideoChatStarted :: A.Value -> T.Parser MessageContent
      parseMessageVideoChatStarted = A.withObject "MessageVideoChatStarted" $ \o -> do
        group_call_id_ <- o A..:? "group_call_id"
        return $ MessageVideoChatStarted {group_call_id = group_call_id_}

      parseMessageVideoChatEnded :: A.Value -> T.Parser MessageContent
      parseMessageVideoChatEnded = A.withObject "MessageVideoChatEnded" $ \o -> do
        duration_ <- o A..:? "duration"
        return $ MessageVideoChatEnded {duration = duration_}

      parseMessageInviteVideoChatParticipants :: A.Value -> T.Parser MessageContent
      parseMessageInviteVideoChatParticipants = A.withObject "MessageInviteVideoChatParticipants" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        group_call_id_ <- o A..:? "group_call_id"
        return $ MessageInviteVideoChatParticipants {user_ids = user_ids_, group_call_id = group_call_id_}

      parseMessageBasicGroupChatCreate :: A.Value -> T.Parser MessageContent
      parseMessageBasicGroupChatCreate = A.withObject "MessageBasicGroupChatCreate" $ \o -> do
        member_user_ids_ <- o A..:? "member_user_ids"
        title_ <- o A..:? "title"
        return $ MessageBasicGroupChatCreate {member_user_ids = member_user_ids_, title = title_}

      parseMessageSupergroupChatCreate :: A.Value -> T.Parser MessageContent
      parseMessageSupergroupChatCreate = A.withObject "MessageSupergroupChatCreate" $ \o -> do
        title_ <- o A..:? "title"
        return $ MessageSupergroupChatCreate {title = title_}

      parseMessageChatChangeTitle :: A.Value -> T.Parser MessageContent
      parseMessageChatChangeTitle = A.withObject "MessageChatChangeTitle" $ \o -> do
        title_ <- o A..:? "title"
        return $ MessageChatChangeTitle {title = title_}

      parseMessageChatChangePhoto :: A.Value -> T.Parser MessageContent
      parseMessageChatChangePhoto = A.withObject "MessageChatChangePhoto" $ \o -> do
        _photo_ <- o A..:? "photo"
        return $ MessageChatChangePhoto {_photo = _photo_}

      parseMessageChatDeletePhoto :: A.Value -> T.Parser MessageContent
      parseMessageChatDeletePhoto = A.withObject "MessageChatDeletePhoto" $ \_ -> return MessageChatDeletePhoto

      parseMessageChatAddMembers :: A.Value -> T.Parser MessageContent
      parseMessageChatAddMembers = A.withObject "MessageChatAddMembers" $ \o -> do
        member_user_ids_ <- o A..:? "member_user_ids"
        return $ MessageChatAddMembers {member_user_ids = member_user_ids_}

      parseMessageChatJoinByLink :: A.Value -> T.Parser MessageContent
      parseMessageChatJoinByLink = A.withObject "MessageChatJoinByLink" $ \_ -> return MessageChatJoinByLink

      parseMessageChatJoinByRequest :: A.Value -> T.Parser MessageContent
      parseMessageChatJoinByRequest = A.withObject "MessageChatJoinByRequest" $ \_ -> return MessageChatJoinByRequest

      parseMessageChatDeleteMember :: A.Value -> T.Parser MessageContent
      parseMessageChatDeleteMember = A.withObject "MessageChatDeleteMember" $ \o -> do
        user_id_ <- o A..:? "user_id"
        return $ MessageChatDeleteMember {user_id = user_id_}

      parseMessageChatUpgradeTo :: A.Value -> T.Parser MessageContent
      parseMessageChatUpgradeTo = A.withObject "MessageChatUpgradeTo" $ \o -> do
        supergroup_id_ <- o A..:? "supergroup_id"
        return $ MessageChatUpgradeTo {supergroup_id = supergroup_id_}

      parseMessageChatUpgradeFrom :: A.Value -> T.Parser MessageContent
      parseMessageChatUpgradeFrom = A.withObject "MessageChatUpgradeFrom" $ \o -> do
        basic_group_id_ <- o A..:? "basic_group_id"
        title_ <- o A..:? "title"
        return $ MessageChatUpgradeFrom {basic_group_id = basic_group_id_, title = title_}

      parseMessagePinMessage :: A.Value -> T.Parser MessageContent
      parseMessagePinMessage = A.withObject "MessagePinMessage" $ \o -> do
        message_id_ <- o A..:? "message_id"
        return $ MessagePinMessage {message_id = message_id_}

      parseMessageScreenshotTaken :: A.Value -> T.Parser MessageContent
      parseMessageScreenshotTaken = A.withObject "MessageScreenshotTaken" $ \_ -> return MessageScreenshotTaken

      parseMessageChatSetTheme :: A.Value -> T.Parser MessageContent
      parseMessageChatSetTheme = A.withObject "MessageChatSetTheme" $ \o -> do
        theme_name_ <- o A..:? "theme_name"
        return $ MessageChatSetTheme {theme_name = theme_name_}

      parseMessageChatSetTtl :: A.Value -> T.Parser MessageContent
      parseMessageChatSetTtl = A.withObject "MessageChatSetTtl" $ \o -> do
        ttl_ <- o A..:? "ttl"
        return $ MessageChatSetTtl {ttl = ttl_}

      parseMessageCustomServiceAction :: A.Value -> T.Parser MessageContent
      parseMessageCustomServiceAction = A.withObject "MessageCustomServiceAction" $ \o -> do
        _text_ <- o A..:? "text"
        return $ MessageCustomServiceAction {_text = _text_}

      parseMessageGameScore :: A.Value -> T.Parser MessageContent
      parseMessageGameScore = A.withObject "MessageGameScore" $ \o -> do
        score_ <- o A..:? "score"
        game_id_ <- U.rm <$> (o A..:? "game_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        game_message_id_ <- o A..:? "game_message_id"
        return $ MessageGameScore {score = score_, game_id = game_id_, game_message_id = game_message_id_}

      parseMessagePaymentSuccessful :: A.Value -> T.Parser MessageContent
      parseMessagePaymentSuccessful = A.withObject "MessagePaymentSuccessful" $ \o -> do
        total_amount_ <- o A..:? "total_amount"
        currency_ <- o A..:? "currency"
        invoice_message_id_ <- o A..:? "invoice_message_id"
        invoice_chat_id_ <- o A..:? "invoice_chat_id"
        return $ MessagePaymentSuccessful {total_amount = total_amount_, currency = currency_, invoice_message_id = invoice_message_id_, invoice_chat_id = invoice_chat_id_}

      parseMessagePaymentSuccessfulBot :: A.Value -> T.Parser MessageContent
      parseMessagePaymentSuccessfulBot = A.withObject "MessagePaymentSuccessfulBot" $ \o -> do
        provider_payment_charge_id_ <- o A..:? "provider_payment_charge_id"
        telegram_payment_charge_id_ <- o A..:? "telegram_payment_charge_id"
        order_info_ <- o A..:? "order_info"
        shipping_option_id_ <- o A..:? "shipping_option_id"
        invoice_payload_ <- o A..:? "invoice_payload"
        total_amount_ <- o A..:? "total_amount"
        currency_ <- o A..:? "currency"
        return $ MessagePaymentSuccessfulBot {provider_payment_charge_id = provider_payment_charge_id_, telegram_payment_charge_id = telegram_payment_charge_id_, order_info = order_info_, shipping_option_id = shipping_option_id_, invoice_payload = invoice_payload_, total_amount = total_amount_, currency = currency_}

      parseMessageContactRegistered :: A.Value -> T.Parser MessageContent
      parseMessageContactRegistered = A.withObject "MessageContactRegistered" $ \_ -> return MessageContactRegistered

      parseMessageWebsiteConnected :: A.Value -> T.Parser MessageContent
      parseMessageWebsiteConnected = A.withObject "MessageWebsiteConnected" $ \o -> do
        domain_name_ <- o A..:? "domain_name"
        return $ MessageWebsiteConnected {domain_name = domain_name_}

      parseMessageWebAppDataSent :: A.Value -> T.Parser MessageContent
      parseMessageWebAppDataSent = A.withObject "MessageWebAppDataSent" $ \o -> do
        button_text_ <- o A..:? "button_text"
        return $ MessageWebAppDataSent {button_text = button_text_}

      parseMessageWebAppDataReceived :: A.Value -> T.Parser MessageContent
      parseMessageWebAppDataReceived = A.withObject "MessageWebAppDataReceived" $ \o -> do
        _data_ <- o A..:? "data"
        button_text_ <- o A..:? "button_text"
        return $ MessageWebAppDataReceived {_data = _data_, button_text = button_text_}

      parseMessagePassportDataSent :: A.Value -> T.Parser MessageContent
      parseMessagePassportDataSent = A.withObject "MessagePassportDataSent" $ \o -> do
        types_ <- o A..:? "types"
        return $ MessagePassportDataSent {types = types_}

      parseMessagePassportDataReceived :: A.Value -> T.Parser MessageContent
      parseMessagePassportDataReceived = A.withObject "MessagePassportDataReceived" $ \o -> do
        credentials_ <- o A..:? "credentials"
        elements_ <- o A..:? "elements"
        return $ MessagePassportDataReceived {credentials = credentials_, elements = elements_}

      parseMessageProximityAlertTriggered :: A.Value -> T.Parser MessageContent
      parseMessageProximityAlertTriggered = A.withObject "MessageProximityAlertTriggered" $ \o -> do
        distance_ <- o A..:? "distance"
        watcher_id_ <- o A..:? "watcher_id"
        traveler_id_ <- o A..:? "traveler_id"
        return $ MessageProximityAlertTriggered {distance = distance_, watcher_id = watcher_id_, traveler_id = traveler_id_}

      parseMessageUnsupported :: A.Value -> T.Parser MessageContent
      parseMessageUnsupported = A.withObject "MessageUnsupported" $ \_ -> return MessageUnsupported
  parseJSON _ = mempty

instance T.ToJSON MessageContent where
  toJSON
    MessageText
      { web_page = web_page_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "messageText",
          "web_page" A..= web_page_,
          "text" A..= text_
        ]
  toJSON
    MessageAnimation
      { is_secret = is_secret_,
        caption = caption_,
        animation = animation_
      } =
      A.object
        [ "@type" A..= T.String "messageAnimation",
          "is_secret" A..= is_secret_,
          "caption" A..= caption_,
          "animation" A..= animation_
        ]
  toJSON
    MessageAudio
      { caption = caption_,
        audio = audio_
      } =
      A.object
        [ "@type" A..= T.String "messageAudio",
          "caption" A..= caption_,
          "audio" A..= audio_
        ]
  toJSON
    MessageDocument
      { caption = caption_,
        document = document_
      } =
      A.object
        [ "@type" A..= T.String "messageDocument",
          "caption" A..= caption_,
          "document" A..= document_
        ]
  toJSON
    MessagePhoto
      { is_secret = is_secret_,
        caption = caption_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "messagePhoto",
          "is_secret" A..= is_secret_,
          "caption" A..= caption_,
          "photo" A..= photo_
        ]
  toJSON MessageExpiredPhoto =
    A.object
      [ "@type" A..= T.String "messageExpiredPhoto"
      ]
  toJSON
    MessageSticker
      { sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "messageSticker",
          "sticker" A..= sticker_
        ]
  toJSON
    MessageVideo
      { is_secret = is_secret_,
        caption = caption_,
        video = video_
      } =
      A.object
        [ "@type" A..= T.String "messageVideo",
          "is_secret" A..= is_secret_,
          "caption" A..= caption_,
          "video" A..= video_
        ]
  toJSON MessageExpiredVideo =
    A.object
      [ "@type" A..= T.String "messageExpiredVideo"
      ]
  toJSON
    MessageVideoNote
      { is_secret = is_secret_,
        is_viewed = is_viewed_,
        video_note = video_note_
      } =
      A.object
        [ "@type" A..= T.String "messageVideoNote",
          "is_secret" A..= is_secret_,
          "is_viewed" A..= is_viewed_,
          "video_note" A..= video_note_
        ]
  toJSON
    MessageVoiceNote
      { is_listened = is_listened_,
        caption = caption_,
        voice_note = voice_note_
      } =
      A.object
        [ "@type" A..= T.String "messageVoiceNote",
          "is_listened" A..= is_listened_,
          "caption" A..= caption_,
          "voice_note" A..= voice_note_
        ]
  toJSON
    MessageLocation
      { proximity_alert_radius = proximity_alert_radius_,
        heading = heading_,
        expires_in = expires_in_,
        live_period = live_period_,
        location = location_
      } =
      A.object
        [ "@type" A..= T.String "messageLocation",
          "proximity_alert_radius" A..= proximity_alert_radius_,
          "heading" A..= heading_,
          "expires_in" A..= expires_in_,
          "live_period" A..= live_period_,
          "location" A..= location_
        ]
  toJSON
    MessageVenue
      { venue = venue_
      } =
      A.object
        [ "@type" A..= T.String "messageVenue",
          "venue" A..= venue_
        ]
  toJSON
    MessageContact
      { contact = contact_
      } =
      A.object
        [ "@type" A..= T.String "messageContact",
          "contact" A..= contact_
        ]
  toJSON
    MessageAnimatedEmoji
      { emoji = emoji_,
        animated_emoji = animated_emoji_
      } =
      A.object
        [ "@type" A..= T.String "messageAnimatedEmoji",
          "emoji" A..= emoji_,
          "animated_emoji" A..= animated_emoji_
        ]
  toJSON
    MessageDice
      { success_animation_frame_number = success_animation_frame_number_,
        value = value_,
        emoji = emoji_,
        final_state = final_state_,
        initial_state = initial_state_
      } =
      A.object
        [ "@type" A..= T.String "messageDice",
          "success_animation_frame_number" A..= success_animation_frame_number_,
          "value" A..= value_,
          "emoji" A..= emoji_,
          "final_state" A..= final_state_,
          "initial_state" A..= initial_state_
        ]
  toJSON
    MessageGame
      { game = game_
      } =
      A.object
        [ "@type" A..= T.String "messageGame",
          "game" A..= game_
        ]
  toJSON
    MessagePoll
      { poll = poll_
      } =
      A.object
        [ "@type" A..= T.String "messagePoll",
          "poll" A..= poll_
        ]
  toJSON
    MessageInvoice
      { receipt_message_id = receipt_message_id_,
        need_shipping_address = need_shipping_address_,
        is_test = is_test_,
        start_parameter = start_parameter_,
        total_amount = total_amount_,
        currency = currency_,
        photo = photo_,
        description = description_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "messageInvoice",
          "receipt_message_id" A..= receipt_message_id_,
          "need_shipping_address" A..= need_shipping_address_,
          "is_test" A..= is_test_,
          "start_parameter" A..= start_parameter_,
          "total_amount" A..= total_amount_,
          "currency" A..= currency_,
          "photo" A..= photo_,
          "description" A..= description_,
          "title" A..= title_
        ]
  toJSON
    MessageCall
      { duration = duration_,
        discard_reason = discard_reason_,
        is_video = is_video_
      } =
      A.object
        [ "@type" A..= T.String "messageCall",
          "duration" A..= duration_,
          "discard_reason" A..= discard_reason_,
          "is_video" A..= is_video_
        ]
  toJSON
    MessageVideoChatScheduled
      { start_date = start_date_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "messageVideoChatScheduled",
          "start_date" A..= start_date_,
          "group_call_id" A..= group_call_id_
        ]
  toJSON
    MessageVideoChatStarted
      { group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "messageVideoChatStarted",
          "group_call_id" A..= group_call_id_
        ]
  toJSON
    MessageVideoChatEnded
      { duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "messageVideoChatEnded",
          "duration" A..= duration_
        ]
  toJSON
    MessageInviteVideoChatParticipants
      { user_ids = user_ids_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "messageInviteVideoChatParticipants",
          "user_ids" A..= user_ids_,
          "group_call_id" A..= group_call_id_
        ]
  toJSON
    MessageBasicGroupChatCreate
      { member_user_ids = member_user_ids_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "messageBasicGroupChatCreate",
          "member_user_ids" A..= member_user_ids_,
          "title" A..= title_
        ]
  toJSON
    MessageSupergroupChatCreate
      { title = title_
      } =
      A.object
        [ "@type" A..= T.String "messageSupergroupChatCreate",
          "title" A..= title_
        ]
  toJSON
    MessageChatChangeTitle
      { title = title_
      } =
      A.object
        [ "@type" A..= T.String "messageChatChangeTitle",
          "title" A..= title_
        ]
  toJSON
    MessageChatChangePhoto
      { _photo = _photo_
      } =
      A.object
        [ "@type" A..= T.String "messageChatChangePhoto",
          "photo" A..= _photo_
        ]
  toJSON MessageChatDeletePhoto =
    A.object
      [ "@type" A..= T.String "messageChatDeletePhoto"
      ]
  toJSON
    MessageChatAddMembers
      { member_user_ids = member_user_ids_
      } =
      A.object
        [ "@type" A..= T.String "messageChatAddMembers",
          "member_user_ids" A..= member_user_ids_
        ]
  toJSON MessageChatJoinByLink =
    A.object
      [ "@type" A..= T.String "messageChatJoinByLink"
      ]
  toJSON MessageChatJoinByRequest =
    A.object
      [ "@type" A..= T.String "messageChatJoinByRequest"
      ]
  toJSON
    MessageChatDeleteMember
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "messageChatDeleteMember",
          "user_id" A..= user_id_
        ]
  toJSON
    MessageChatUpgradeTo
      { supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "messageChatUpgradeTo",
          "supergroup_id" A..= supergroup_id_
        ]
  toJSON
    MessageChatUpgradeFrom
      { basic_group_id = basic_group_id_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "messageChatUpgradeFrom",
          "basic_group_id" A..= basic_group_id_,
          "title" A..= title_
        ]
  toJSON
    MessagePinMessage
      { message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "messagePinMessage",
          "message_id" A..= message_id_
        ]
  toJSON MessageScreenshotTaken =
    A.object
      [ "@type" A..= T.String "messageScreenshotTaken"
      ]
  toJSON
    MessageChatSetTheme
      { theme_name = theme_name_
      } =
      A.object
        [ "@type" A..= T.String "messageChatSetTheme",
          "theme_name" A..= theme_name_
        ]
  toJSON
    MessageChatSetTtl
      { ttl = ttl_
      } =
      A.object
        [ "@type" A..= T.String "messageChatSetTtl",
          "ttl" A..= ttl_
        ]
  toJSON
    MessageCustomServiceAction
      { _text = _text_
      } =
      A.object
        [ "@type" A..= T.String "messageCustomServiceAction",
          "text" A..= _text_
        ]
  toJSON
    MessageGameScore
      { score = score_,
        game_id = game_id_,
        game_message_id = game_message_id_
      } =
      A.object
        [ "@type" A..= T.String "messageGameScore",
          "score" A..= score_,
          "game_id" A..= U.toS game_id_,
          "game_message_id" A..= game_message_id_
        ]
  toJSON
    MessagePaymentSuccessful
      { total_amount = total_amount_,
        currency = currency_,
        invoice_message_id = invoice_message_id_,
        invoice_chat_id = invoice_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messagePaymentSuccessful",
          "total_amount" A..= total_amount_,
          "currency" A..= currency_,
          "invoice_message_id" A..= invoice_message_id_,
          "invoice_chat_id" A..= invoice_chat_id_
        ]
  toJSON
    MessagePaymentSuccessfulBot
      { provider_payment_charge_id = provider_payment_charge_id_,
        telegram_payment_charge_id = telegram_payment_charge_id_,
        order_info = order_info_,
        shipping_option_id = shipping_option_id_,
        invoice_payload = invoice_payload_,
        total_amount = total_amount_,
        currency = currency_
      } =
      A.object
        [ "@type" A..= T.String "messagePaymentSuccessfulBot",
          "provider_payment_charge_id" A..= provider_payment_charge_id_,
          "telegram_payment_charge_id" A..= telegram_payment_charge_id_,
          "order_info" A..= order_info_,
          "shipping_option_id" A..= shipping_option_id_,
          "invoice_payload" A..= invoice_payload_,
          "total_amount" A..= total_amount_,
          "currency" A..= currency_
        ]
  toJSON MessageContactRegistered =
    A.object
      [ "@type" A..= T.String "messageContactRegistered"
      ]
  toJSON
    MessageWebsiteConnected
      { domain_name = domain_name_
      } =
      A.object
        [ "@type" A..= T.String "messageWebsiteConnected",
          "domain_name" A..= domain_name_
        ]
  toJSON
    MessageWebAppDataSent
      { button_text = button_text_
      } =
      A.object
        [ "@type" A..= T.String "messageWebAppDataSent",
          "button_text" A..= button_text_
        ]
  toJSON
    MessageWebAppDataReceived
      { _data = _data_,
        button_text = button_text_
      } =
      A.object
        [ "@type" A..= T.String "messageWebAppDataReceived",
          "data" A..= _data_,
          "button_text" A..= button_text_
        ]
  toJSON
    MessagePassportDataSent
      { types = types_
      } =
      A.object
        [ "@type" A..= T.String "messagePassportDataSent",
          "types" A..= types_
        ]
  toJSON
    MessagePassportDataReceived
      { credentials = credentials_,
        elements = elements_
      } =
      A.object
        [ "@type" A..= T.String "messagePassportDataReceived",
          "credentials" A..= credentials_,
          "elements" A..= elements_
        ]
  toJSON
    MessageProximityAlertTriggered
      { distance = distance_,
        watcher_id = watcher_id_,
        traveler_id = traveler_id_
      } =
      A.object
        [ "@type" A..= T.String "messageProximityAlertTriggered",
          "distance" A..= distance_,
          "watcher_id" A..= watcher_id_,
          "traveler_id" A..= traveler_id_
        ]
  toJSON MessageUnsupported =
    A.object
      [ "@type" A..= T.String "messageUnsupported"
      ]
