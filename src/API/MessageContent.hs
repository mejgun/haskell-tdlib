-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageContent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.WebPage as WebPage
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Document as Document
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VideoNote as VideoNote
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.Venue as Venue
import {-# SOURCE #-} qualified API.Contact as Contact
import {-# SOURCE #-} qualified API.AnimatedEmoji as AnimatedEmoji
import {-# SOURCE #-} qualified API.DiceStickers as DiceStickers
import {-# SOURCE #-} qualified API.Game as Game
import {-# SOURCE #-} qualified API.Poll as Poll
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.CallDiscardReason as CallDiscardReason
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType
import {-# SOURCE #-} qualified API.EncryptedCredentials as EncryptedCredentials
import {-# SOURCE #-} qualified API.EncryptedPassportElement as EncryptedPassportElement
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Contains the content of a message
data MessageContent = 
 -- |
 -- 
 -- A text message 
 -- 
 -- __text__ Text of the message
 -- 
 -- __web_page__ A preview of the web page that's mentioned in the text; may be null
 MessageText { web_page :: Maybe WebPage.WebPage, _text :: Maybe FormattedText.FormattedText }  |
 -- |
 -- 
 -- An animation message (GIF-style). 
 -- 
 -- __animation__ The animation description
 -- 
 -- __caption__ Animation caption
 -- 
 -- __is_secret__ True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
 MessageAnimation { is_secret :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, animation :: Maybe Animation.Animation }  |
 -- |
 -- 
 -- An audio message 
 -- 
 -- __audio__ The audio description
 -- 
 -- __caption__ Audio caption
 MessageAudio { caption :: Maybe FormattedText.FormattedText, audio :: Maybe Audio.Audio }  |
 -- |
 -- 
 -- A document message (general file) 
 -- 
 -- __document__ The document description
 -- 
 -- __caption__ Document caption
 MessageDocument { caption :: Maybe FormattedText.FormattedText, document :: Maybe Document.Document }  |
 -- |
 -- 
 -- A photo message 
 -- 
 -- __photo__ The photo description
 -- 
 -- __caption__ Photo caption
 -- 
 -- __is_secret__ True, if the photo must be blurred and must be shown only while tapped
 MessagePhoto { is_secret :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, _photo :: Maybe Photo.Photo }  |
 -- |
 -- 
 -- An expired photo message (self-destructed after TTL has elapsed)
 MessageExpiredPhoto |
 -- |
 -- 
 -- A sticker message 
 -- 
 -- __sticker__ The sticker description
 MessageSticker { sticker :: Maybe Sticker.Sticker }  |
 -- |
 -- 
 -- A video message 
 -- 
 -- __video__ The video description
 -- 
 -- __caption__ Video caption
 -- 
 -- __is_secret__ True, if the video thumbnail must be blurred and the video must be shown only while tapped
 MessageVideo { is_secret :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, video :: Maybe Video.Video }  |
 -- |
 -- 
 -- An expired video message (self-destructed after TTL has elapsed)
 MessageExpiredVideo |
 -- |
 -- 
 -- A video note message 
 -- 
 -- __video_note__ The video note description
 -- 
 -- __is_viewed__ True, if at least one of the recipients has viewed the video note
 -- 
 -- __is_secret__ True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
 MessageVideoNote { is_secret :: Maybe Bool, is_viewed :: Maybe Bool, video_note :: Maybe VideoNote.VideoNote }  |
 -- |
 -- 
 -- A voice note message 
 -- 
 -- __voice_note__ The voice note description
 -- 
 -- __caption__ Voice note caption
 -- 
 -- __is_listened__ True, if at least one of the recipients has listened to the voice note
 MessageVoiceNote { is_listened :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, voice_note :: Maybe VoiceNote.VoiceNote }  |
 -- |
 -- 
 -- A message with a location 
 -- 
 -- __location__ The location description
 -- 
 -- __live_period__ Time relative to the message send date, for which the location can be updated, in seconds
 -- 
 -- __expires_in__ Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
 -- 
 -- __heading__ For live locations, a direction in which the location moves, in degrees; 1-360. If 0 the direction is unknown
 -- 
 -- __proximity_alert_radius__ For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled. Available only for the message sender
 MessageLocation { proximity_alert_radius :: Maybe Int, heading :: Maybe Int, expires_in :: Maybe Int, live_period :: Maybe Int, location :: Maybe Location.Location }  |
 -- |
 -- 
 -- A message with information about a venue 
 -- 
 -- __venue__ The venue description
 MessageVenue { venue :: Maybe Venue.Venue }  |
 -- |
 -- 
 -- A message with a user contact 
 -- 
 -- __contact__ The contact description
 MessageContact { contact :: Maybe Contact.Contact }  |
 -- |
 -- 
 -- A message with an animated emoji 
 -- 
 -- __animated_emoji__ The animated emoji
 -- 
 -- __emoji__ The corresponding emoji
 MessageAnimatedEmoji { emoji :: Maybe String, animated_emoji :: Maybe AnimatedEmoji.AnimatedEmoji }  |
 -- |
 -- 
 -- A dice message. The dice value is randomly generated by the server
 -- 
 -- __initial_state__ The animated stickers with the initial dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
 -- 
 -- __final_state__ The animated stickers with the final dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
 -- 
 -- __emoji__ Emoji on which the dice throw animation is based
 -- 
 -- __value__ The dice value. If the value is 0, the dice don't have final state yet
 -- 
 -- __success_animation_frame_number__ Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
 MessageDice { success_animation_frame_number :: Maybe Int, value :: Maybe Int, emoji :: Maybe String, final_state :: Maybe DiceStickers.DiceStickers, initial_state :: Maybe DiceStickers.DiceStickers }  |
 -- |
 -- 
 -- A message with a game 
 -- 
 -- __game__ The game description
 MessageGame { game :: Maybe Game.Game }  |
 -- |
 -- 
 -- A message with a poll 
 -- 
 -- __poll__ The poll description
 MessagePoll { poll :: Maybe Poll.Poll }  |
 -- |
 -- 
 -- A message with an invoice from a bot 
 -- 
 -- __title__ Product title
 -- 
 -- __param_description__ Product description
 -- 
 -- __photo__ Product photo; may be null
 -- 
 -- __currency__ Currency for the product price
 -- 
 -- __total_amount__ Product total price in the smallest units of the currency
 -- 
 -- __start_parameter__ Unique invoice bot start_parameter. To share an invoice use the URL https://t.me/{bot_username}?start={start_parameter}
 -- 
 -- __is_test__ True, if the invoice is a test invoice
 -- 
 -- __need_shipping_address__ True, if the shipping address must be specified
 -- 
 -- __receipt_message_id__ The identifier of the message with the receipt, after the product has been purchased
 MessageInvoice { receipt_message_id :: Maybe Int, need_shipping_address :: Maybe Bool, is_test :: Maybe Bool, start_parameter :: Maybe String, total_amount :: Maybe Int, currency :: Maybe String, _photo :: Maybe Photo.Photo, description :: Maybe String, title :: Maybe String }  |
 -- |
 -- 
 -- A message with information about an ended call 
 -- 
 -- __is_video__ True, if the call was a video call
 -- 
 -- __discard_reason__ Reason why the call was discarded
 -- 
 -- __duration__ Call duration, in seconds
 MessageCall { duration :: Maybe Int, discard_reason :: Maybe CallDiscardReason.CallDiscardReason, is_video :: Maybe Bool }  |
 -- |
 -- 
 -- A new video chat was scheduled 
 -- 
 -- __group_call_id__ Identifier of the video chat. The video chat can be received through the method getGroupCall
 -- 
 -- __start_date__ Point in time (Unix timestamp) when the group call is supposed to be started by an administrator
 MessageVideoChatScheduled { start_date :: Maybe Int, group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- A newly created video chat 
 -- 
 -- __group_call_id__ Identifier of the video chat. The video chat can be received through the method getGroupCall
 MessageVideoChatStarted { group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- A message with information about an ended video chat 
 -- 
 -- __duration__ Call duration, in seconds
 MessageVideoChatEnded { duration :: Maybe Int }  |
 -- |
 -- 
 -- A message with information about an invite to a video chat 
 -- 
 -- __group_call_id__ Identifier of the video chat. The video chat can be received through the method getGroupCall
 -- 
 -- __user_ids__ Invited user identifiers
 MessageInviteVideoChatParticipants { user_ids :: Maybe [Int], group_call_id :: Maybe Int }  |
 -- |
 -- 
 -- A newly created basic group 
 -- 
 -- __title__ Title of the basic group
 -- 
 -- __member_user_ids__ User identifiers of members in the basic group
 MessageBasicGroupChatCreate { member_user_ids :: Maybe [Int], title :: Maybe String }  |
 -- |
 -- 
 -- A newly created supergroup or channel 
 -- 
 -- __title__ Title of the supergroup or channel
 MessageSupergroupChatCreate { title :: Maybe String }  |
 -- |
 -- 
 -- An updated chat title 
 -- 
 -- __title__ New chat title
 MessageChatChangeTitle { title :: Maybe String }  |
 -- |
 -- 
 -- An updated chat photo 
 -- 
 -- __photo__ New chat photo
 MessageChatChangePhoto { photo :: Maybe ChatPhoto.ChatPhoto }  |
 -- |
 -- 
 -- A deleted chat photo
 MessageChatDeletePhoto |
 -- |
 -- 
 -- New chat members were added 
 -- 
 -- __member_user_ids__ User identifiers of the new members
 MessageChatAddMembers { member_user_ids :: Maybe [Int] }  |
 -- |
 -- 
 -- A new member joined the chat via an invite link
 MessageChatJoinByLink |
 -- |
 -- 
 -- A new member was accepted to the chat by an administrator
 MessageChatJoinByRequest |
 -- |
 -- 
 -- A chat member was deleted 
 -- 
 -- __user_id__ User identifier of the deleted chat member
 MessageChatDeleteMember { user_id :: Maybe Int }  |
 -- |
 -- 
 -- A basic group was upgraded to a supergroup and was deactivated as the result 
 -- 
 -- __supergroup_id__ Identifier of the supergroup to which the basic group was upgraded
 MessageChatUpgradeTo { supergroup_id :: Maybe Int }  |
 -- |
 -- 
 -- A supergroup has been created from a basic group 
 -- 
 -- __title__ Title of the newly created supergroup
 -- 
 -- __basic_group_id__ The identifier of the original basic group
 MessageChatUpgradeFrom { basic_group_id :: Maybe Int, title :: Maybe String }  |
 -- |
 -- 
 -- A message has been pinned 
 -- 
 -- __message_id__ Identifier of the pinned message, can be an identifier of a deleted message or 0
 MessagePinMessage { message_id :: Maybe Int }  |
 -- |
 -- 
 -- A screenshot of a message in the chat has been taken
 MessageScreenshotTaken |
 -- |
 -- 
 -- A theme in the chat has been changed 
 -- 
 -- __theme_name__ If non-empty, name of a new theme, set for the chat. Otherwise chat theme was reset to the default one
 MessageChatSetTheme { theme_name :: Maybe String }  |
 -- |
 -- 
 -- The TTL (Time To Live) setting for messages in the chat has been changed 
 -- 
 -- __ttl__ New message TTL
 MessageChatSetTtl { ttl :: Maybe Int }  |
 -- |
 -- 
 -- A non-standard action has happened in the chat 
 -- 
 -- __text__ Message text to be shown in the chat
 MessageCustomServiceAction { text :: Maybe String }  |
 -- |
 -- 
 -- A new high score was achieved in a game 
 -- 
 -- __game_message_id__ Identifier of the message with the game, can be an identifier of a deleted message
 -- 
 -- __game_id__ Identifier of the game; may be different from the games presented in the message with the game
 -- 
 -- __score__ New score
 MessageGameScore { score :: Maybe Int, game_id :: Maybe Int, game_message_id :: Maybe Int }  |
 -- |
 -- 
 -- A payment has been completed 
 -- 
 -- __invoice_chat_id__ Identifier of the chat, containing the corresponding invoice message; 0 if unknown
 -- 
 -- __invoice_message_id__ Identifier of the message with the corresponding invoice; can be an identifier of a deleted message
 -- 
 -- __currency__ Currency for the price of the product
 -- 
 -- __total_amount__ Total price for the product, in the smallest units of the currency
 MessagePaymentSuccessful { total_amount :: Maybe Int, currency :: Maybe String, invoice_message_id :: Maybe Int, invoice_chat_id :: Maybe Int }  |
 -- |
 -- 
 -- A payment has been completed; for bots only 
 -- 
 -- __currency__ Currency for price of the product
 -- 
 -- __total_amount__ Total price for the product, in the smallest units of the currency
 -- 
 -- __invoice_payload__ Invoice payload
 -- 
 -- __shipping_option_id__ Identifier of the shipping option chosen by the user; may be empty if not applicable
 -- 
 -- __order_info__ Information about the order; may be null
 -- 
 -- __telegram_payment_charge_id__ Telegram payment identifier
 -- 
 -- __provider_payment_charge_id__ Provider payment identifier
 MessagePaymentSuccessfulBot { provider_payment_charge_id :: Maybe String, telegram_payment_charge_id :: Maybe String, order_info :: Maybe OrderInfo.OrderInfo, shipping_option_id :: Maybe String, invoice_payload :: Maybe String, total_amount :: Maybe Int, currency :: Maybe String }  |
 -- |
 -- 
 -- A contact has registered with Telegram
 MessageContactRegistered |
 -- |
 -- 
 -- The current user has connected a website by logging in using Telegram Login Widget on it 
 -- 
 -- __domain_name__ Domain name of the connected website
 MessageWebsiteConnected { domain_name :: Maybe String }  |
 -- |
 -- 
 -- Data from a web app has been sent to a bot 
 -- 
 -- __button_text__ Text of the keyboardButtonTypeWebApp button, which opened the web app
 MessageWebAppDataSent { button_text :: Maybe String }  |
 -- |
 -- 
 -- Data from a web app has been received; for bots only 
 -- 
 -- __button_text__ Text of the keyboardButtonTypeWebApp button, which opened the web app
 -- 
 -- __data__ Received data
 MessageWebAppDataReceived { _data :: Maybe String, button_text :: Maybe String }  |
 -- |
 -- 
 -- Telegram Passport data has been sent to a bot 
 -- 
 -- __types__ List of Telegram Passport element types sent
 MessagePassportDataSent { types :: Maybe [PassportElementType.PassportElementType] }  |
 -- |
 -- 
 -- Telegram Passport data has been received; for bots only 
 -- 
 -- __elements__ List of received Telegram Passport elements
 -- 
 -- __credentials__ Encrypted data credentials
 MessagePassportDataReceived { credentials :: Maybe EncryptedCredentials.EncryptedCredentials, elements :: Maybe [EncryptedPassportElement.EncryptedPassportElement] }  |
 -- |
 -- 
 -- A user in the chat came within proximity alert range 
 -- 
 -- __traveler_id__ The identifier of a user or chat that triggered the proximity alert
 -- 
 -- __watcher_id__ The identifier of a user or chat that subscribed for the proximity alert
 -- 
 -- __distance__ The distance between the users
 MessageProximityAlertTriggered { distance :: Maybe Int, watcher_id :: Maybe MessageSender.MessageSender, traveler_id :: Maybe MessageSender.MessageSender }  |
 -- |
 -- 
 -- Message content that is not supported in the current TDLib version
 MessageUnsupported deriving (Eq)

instance Show MessageContent where
 show MessageText { web_page=web_page, _text=_text } =
  "MessageText" ++ U.cc [U.p "web_page" web_page, U.p "_text" _text ]

 show MessageAnimation { is_secret=is_secret, caption=caption, animation=animation } =
  "MessageAnimation" ++ U.cc [U.p "is_secret" is_secret, U.p "caption" caption, U.p "animation" animation ]

 show MessageAudio { caption=caption, audio=audio } =
  "MessageAudio" ++ U.cc [U.p "caption" caption, U.p "audio" audio ]

 show MessageDocument { caption=caption, document=document } =
  "MessageDocument" ++ U.cc [U.p "caption" caption, U.p "document" document ]

 show MessagePhoto { is_secret=is_secret, caption=caption, _photo=_photo } =
  "MessagePhoto" ++ U.cc [U.p "is_secret" is_secret, U.p "caption" caption, U.p "_photo" _photo ]

 show MessageExpiredPhoto {  } =
  "MessageExpiredPhoto" ++ U.cc [ ]

 show MessageSticker { sticker=sticker } =
  "MessageSticker" ++ U.cc [U.p "sticker" sticker ]

 show MessageVideo { is_secret=is_secret, caption=caption, video=video } =
  "MessageVideo" ++ U.cc [U.p "is_secret" is_secret, U.p "caption" caption, U.p "video" video ]

 show MessageExpiredVideo {  } =
  "MessageExpiredVideo" ++ U.cc [ ]

 show MessageVideoNote { is_secret=is_secret, is_viewed=is_viewed, video_note=video_note } =
  "MessageVideoNote" ++ U.cc [U.p "is_secret" is_secret, U.p "is_viewed" is_viewed, U.p "video_note" video_note ]

 show MessageVoiceNote { is_listened=is_listened, caption=caption, voice_note=voice_note } =
  "MessageVoiceNote" ++ U.cc [U.p "is_listened" is_listened, U.p "caption" caption, U.p "voice_note" voice_note ]

 show MessageLocation { proximity_alert_radius=proximity_alert_radius, heading=heading, expires_in=expires_in, live_period=live_period, location=location } =
  "MessageLocation" ++ U.cc [U.p "proximity_alert_radius" proximity_alert_radius, U.p "heading" heading, U.p "expires_in" expires_in, U.p "live_period" live_period, U.p "location" location ]

 show MessageVenue { venue=venue } =
  "MessageVenue" ++ U.cc [U.p "venue" venue ]

 show MessageContact { contact=contact } =
  "MessageContact" ++ U.cc [U.p "contact" contact ]

 show MessageAnimatedEmoji { emoji=emoji, animated_emoji=animated_emoji } =
  "MessageAnimatedEmoji" ++ U.cc [U.p "emoji" emoji, U.p "animated_emoji" animated_emoji ]

 show MessageDice { success_animation_frame_number=success_animation_frame_number, value=value, emoji=emoji, final_state=final_state, initial_state=initial_state } =
  "MessageDice" ++ U.cc [U.p "success_animation_frame_number" success_animation_frame_number, U.p "value" value, U.p "emoji" emoji, U.p "final_state" final_state, U.p "initial_state" initial_state ]

 show MessageGame { game=game } =
  "MessageGame" ++ U.cc [U.p "game" game ]

 show MessagePoll { poll=poll } =
  "MessagePoll" ++ U.cc [U.p "poll" poll ]

 show MessageInvoice { receipt_message_id=receipt_message_id, need_shipping_address=need_shipping_address, is_test=is_test, start_parameter=start_parameter, total_amount=total_amount, currency=currency, _photo=_photo, description=description, title=title } =
  "MessageInvoice" ++ U.cc [U.p "receipt_message_id" receipt_message_id, U.p "need_shipping_address" need_shipping_address, U.p "is_test" is_test, U.p "start_parameter" start_parameter, U.p "total_amount" total_amount, U.p "currency" currency, U.p "_photo" _photo, U.p "description" description, U.p "title" title ]

 show MessageCall { duration=duration, discard_reason=discard_reason, is_video=is_video } =
  "MessageCall" ++ U.cc [U.p "duration" duration, U.p "discard_reason" discard_reason, U.p "is_video" is_video ]

 show MessageVideoChatScheduled { start_date=start_date, group_call_id=group_call_id } =
  "MessageVideoChatScheduled" ++ U.cc [U.p "start_date" start_date, U.p "group_call_id" group_call_id ]

 show MessageVideoChatStarted { group_call_id=group_call_id } =
  "MessageVideoChatStarted" ++ U.cc [U.p "group_call_id" group_call_id ]

 show MessageVideoChatEnded { duration=duration } =
  "MessageVideoChatEnded" ++ U.cc [U.p "duration" duration ]

 show MessageInviteVideoChatParticipants { user_ids=user_ids, group_call_id=group_call_id } =
  "MessageInviteVideoChatParticipants" ++ U.cc [U.p "user_ids" user_ids, U.p "group_call_id" group_call_id ]

 show MessageBasicGroupChatCreate { member_user_ids=member_user_ids, title=title } =
  "MessageBasicGroupChatCreate" ++ U.cc [U.p "member_user_ids" member_user_ids, U.p "title" title ]

 show MessageSupergroupChatCreate { title=title } =
  "MessageSupergroupChatCreate" ++ U.cc [U.p "title" title ]

 show MessageChatChangeTitle { title=title } =
  "MessageChatChangeTitle" ++ U.cc [U.p "title" title ]

 show MessageChatChangePhoto { photo=photo } =
  "MessageChatChangePhoto" ++ U.cc [U.p "photo" photo ]

 show MessageChatDeletePhoto {  } =
  "MessageChatDeletePhoto" ++ U.cc [ ]

 show MessageChatAddMembers { member_user_ids=member_user_ids } =
  "MessageChatAddMembers" ++ U.cc [U.p "member_user_ids" member_user_ids ]

 show MessageChatJoinByLink {  } =
  "MessageChatJoinByLink" ++ U.cc [ ]

 show MessageChatJoinByRequest {  } =
  "MessageChatJoinByRequest" ++ U.cc [ ]

 show MessageChatDeleteMember { user_id=user_id } =
  "MessageChatDeleteMember" ++ U.cc [U.p "user_id" user_id ]

 show MessageChatUpgradeTo { supergroup_id=supergroup_id } =
  "MessageChatUpgradeTo" ++ U.cc [U.p "supergroup_id" supergroup_id ]

 show MessageChatUpgradeFrom { basic_group_id=basic_group_id, title=title } =
  "MessageChatUpgradeFrom" ++ U.cc [U.p "basic_group_id" basic_group_id, U.p "title" title ]

 show MessagePinMessage { message_id=message_id } =
  "MessagePinMessage" ++ U.cc [U.p "message_id" message_id ]

 show MessageScreenshotTaken {  } =
  "MessageScreenshotTaken" ++ U.cc [ ]

 show MessageChatSetTheme { theme_name=theme_name } =
  "MessageChatSetTheme" ++ U.cc [U.p "theme_name" theme_name ]

 show MessageChatSetTtl { ttl=ttl } =
  "MessageChatSetTtl" ++ U.cc [U.p "ttl" ttl ]

 show MessageCustomServiceAction { text=text } =
  "MessageCustomServiceAction" ++ U.cc [U.p "text" text ]

 show MessageGameScore { score=score, game_id=game_id, game_message_id=game_message_id } =
  "MessageGameScore" ++ U.cc [U.p "score" score, U.p "game_id" game_id, U.p "game_message_id" game_message_id ]

 show MessagePaymentSuccessful { total_amount=total_amount, currency=currency, invoice_message_id=invoice_message_id, invoice_chat_id=invoice_chat_id } =
  "MessagePaymentSuccessful" ++ U.cc [U.p "total_amount" total_amount, U.p "currency" currency, U.p "invoice_message_id" invoice_message_id, U.p "invoice_chat_id" invoice_chat_id ]

 show MessagePaymentSuccessfulBot { provider_payment_charge_id=provider_payment_charge_id, telegram_payment_charge_id=telegram_payment_charge_id, order_info=order_info, shipping_option_id=shipping_option_id, invoice_payload=invoice_payload, total_amount=total_amount, currency=currency } =
  "MessagePaymentSuccessfulBot" ++ U.cc [U.p "provider_payment_charge_id" provider_payment_charge_id, U.p "telegram_payment_charge_id" telegram_payment_charge_id, U.p "order_info" order_info, U.p "shipping_option_id" shipping_option_id, U.p "invoice_payload" invoice_payload, U.p "total_amount" total_amount, U.p "currency" currency ]

 show MessageContactRegistered {  } =
  "MessageContactRegistered" ++ U.cc [ ]

 show MessageWebsiteConnected { domain_name=domain_name } =
  "MessageWebsiteConnected" ++ U.cc [U.p "domain_name" domain_name ]

 show MessageWebAppDataSent { button_text=button_text } =
  "MessageWebAppDataSent" ++ U.cc [U.p "button_text" button_text ]

 show MessageWebAppDataReceived { _data=_data, button_text=button_text } =
  "MessageWebAppDataReceived" ++ U.cc [U.p "_data" _data, U.p "button_text" button_text ]

 show MessagePassportDataSent { types=types } =
  "MessagePassportDataSent" ++ U.cc [U.p "types" types ]

 show MessagePassportDataReceived { credentials=credentials, elements=elements } =
  "MessagePassportDataReceived" ++ U.cc [U.p "credentials" credentials, U.p "elements" elements ]

 show MessageProximityAlertTriggered { distance=distance, watcher_id=watcher_id, traveler_id=traveler_id } =
  "MessageProximityAlertTriggered" ++ U.cc [U.p "distance" distance, U.p "watcher_id" watcher_id, U.p "traveler_id" traveler_id ]

 show MessageUnsupported {  } =
  "MessageUnsupported" ++ U.cc [ ]

instance T.ToJSON MessageContent where
 toJSON MessageText { web_page = web_page, _text = _text } =
  A.object [ "@type" A..= T.String "messageText", "web_page" A..= web_page, "text" A..= _text ]

 toJSON MessageAnimation { is_secret = is_secret, caption = caption, animation = animation } =
  A.object [ "@type" A..= T.String "messageAnimation", "is_secret" A..= is_secret, "caption" A..= caption, "animation" A..= animation ]

 toJSON MessageAudio { caption = caption, audio = audio } =
  A.object [ "@type" A..= T.String "messageAudio", "caption" A..= caption, "audio" A..= audio ]

 toJSON MessageDocument { caption = caption, document = document } =
  A.object [ "@type" A..= T.String "messageDocument", "caption" A..= caption, "document" A..= document ]

 toJSON MessagePhoto { is_secret = is_secret, caption = caption, _photo = _photo } =
  A.object [ "@type" A..= T.String "messagePhoto", "is_secret" A..= is_secret, "caption" A..= caption, "photo" A..= _photo ]

 toJSON MessageExpiredPhoto {  } =
  A.object [ "@type" A..= T.String "messageExpiredPhoto" ]

 toJSON MessageSticker { sticker = sticker } =
  A.object [ "@type" A..= T.String "messageSticker", "sticker" A..= sticker ]

 toJSON MessageVideo { is_secret = is_secret, caption = caption, video = video } =
  A.object [ "@type" A..= T.String "messageVideo", "is_secret" A..= is_secret, "caption" A..= caption, "video" A..= video ]

 toJSON MessageExpiredVideo {  } =
  A.object [ "@type" A..= T.String "messageExpiredVideo" ]

 toJSON MessageVideoNote { is_secret = is_secret, is_viewed = is_viewed, video_note = video_note } =
  A.object [ "@type" A..= T.String "messageVideoNote", "is_secret" A..= is_secret, "is_viewed" A..= is_viewed, "video_note" A..= video_note ]

 toJSON MessageVoiceNote { is_listened = is_listened, caption = caption, voice_note = voice_note } =
  A.object [ "@type" A..= T.String "messageVoiceNote", "is_listened" A..= is_listened, "caption" A..= caption, "voice_note" A..= voice_note ]

 toJSON MessageLocation { proximity_alert_radius = proximity_alert_radius, heading = heading, expires_in = expires_in, live_period = live_period, location = location } =
  A.object [ "@type" A..= T.String "messageLocation", "proximity_alert_radius" A..= proximity_alert_radius, "heading" A..= heading, "expires_in" A..= expires_in, "live_period" A..= live_period, "location" A..= location ]

 toJSON MessageVenue { venue = venue } =
  A.object [ "@type" A..= T.String "messageVenue", "venue" A..= venue ]

 toJSON MessageContact { contact = contact } =
  A.object [ "@type" A..= T.String "messageContact", "contact" A..= contact ]

 toJSON MessageAnimatedEmoji { emoji = emoji, animated_emoji = animated_emoji } =
  A.object [ "@type" A..= T.String "messageAnimatedEmoji", "emoji" A..= emoji, "animated_emoji" A..= animated_emoji ]

 toJSON MessageDice { success_animation_frame_number = success_animation_frame_number, value = value, emoji = emoji, final_state = final_state, initial_state = initial_state } =
  A.object [ "@type" A..= T.String "messageDice", "success_animation_frame_number" A..= success_animation_frame_number, "value" A..= value, "emoji" A..= emoji, "final_state" A..= final_state, "initial_state" A..= initial_state ]

 toJSON MessageGame { game = game } =
  A.object [ "@type" A..= T.String "messageGame", "game" A..= game ]

 toJSON MessagePoll { poll = poll } =
  A.object [ "@type" A..= T.String "messagePoll", "poll" A..= poll ]

 toJSON MessageInvoice { receipt_message_id = receipt_message_id, need_shipping_address = need_shipping_address, is_test = is_test, start_parameter = start_parameter, total_amount = total_amount, currency = currency, _photo = _photo, description = description, title = title } =
  A.object [ "@type" A..= T.String "messageInvoice", "receipt_message_id" A..= receipt_message_id, "need_shipping_address" A..= need_shipping_address, "is_test" A..= is_test, "start_parameter" A..= start_parameter, "total_amount" A..= total_amount, "currency" A..= currency, "photo" A..= _photo, "description" A..= description, "title" A..= title ]

 toJSON MessageCall { duration = duration, discard_reason = discard_reason, is_video = is_video } =
  A.object [ "@type" A..= T.String "messageCall", "duration" A..= duration, "discard_reason" A..= discard_reason, "is_video" A..= is_video ]

 toJSON MessageVideoChatScheduled { start_date = start_date, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "messageVideoChatScheduled", "start_date" A..= start_date, "group_call_id" A..= group_call_id ]

 toJSON MessageVideoChatStarted { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "messageVideoChatStarted", "group_call_id" A..= group_call_id ]

 toJSON MessageVideoChatEnded { duration = duration } =
  A.object [ "@type" A..= T.String "messageVideoChatEnded", "duration" A..= duration ]

 toJSON MessageInviteVideoChatParticipants { user_ids = user_ids, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "messageInviteVideoChatParticipants", "user_ids" A..= user_ids, "group_call_id" A..= group_call_id ]

 toJSON MessageBasicGroupChatCreate { member_user_ids = member_user_ids, title = title } =
  A.object [ "@type" A..= T.String "messageBasicGroupChatCreate", "member_user_ids" A..= member_user_ids, "title" A..= title ]

 toJSON MessageSupergroupChatCreate { title = title } =
  A.object [ "@type" A..= T.String "messageSupergroupChatCreate", "title" A..= title ]

 toJSON MessageChatChangeTitle { title = title } =
  A.object [ "@type" A..= T.String "messageChatChangeTitle", "title" A..= title ]

 toJSON MessageChatChangePhoto { photo = photo } =
  A.object [ "@type" A..= T.String "messageChatChangePhoto", "photo" A..= photo ]

 toJSON MessageChatDeletePhoto {  } =
  A.object [ "@type" A..= T.String "messageChatDeletePhoto" ]

 toJSON MessageChatAddMembers { member_user_ids = member_user_ids } =
  A.object [ "@type" A..= T.String "messageChatAddMembers", "member_user_ids" A..= member_user_ids ]

 toJSON MessageChatJoinByLink {  } =
  A.object [ "@type" A..= T.String "messageChatJoinByLink" ]

 toJSON MessageChatJoinByRequest {  } =
  A.object [ "@type" A..= T.String "messageChatJoinByRequest" ]

 toJSON MessageChatDeleteMember { user_id = user_id } =
  A.object [ "@type" A..= T.String "messageChatDeleteMember", "user_id" A..= user_id ]

 toJSON MessageChatUpgradeTo { supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "messageChatUpgradeTo", "supergroup_id" A..= supergroup_id ]

 toJSON MessageChatUpgradeFrom { basic_group_id = basic_group_id, title = title } =
  A.object [ "@type" A..= T.String "messageChatUpgradeFrom", "basic_group_id" A..= basic_group_id, "title" A..= title ]

 toJSON MessagePinMessage { message_id = message_id } =
  A.object [ "@type" A..= T.String "messagePinMessage", "message_id" A..= message_id ]

 toJSON MessageScreenshotTaken {  } =
  A.object [ "@type" A..= T.String "messageScreenshotTaken" ]

 toJSON MessageChatSetTheme { theme_name = theme_name } =
  A.object [ "@type" A..= T.String "messageChatSetTheme", "theme_name" A..= theme_name ]

 toJSON MessageChatSetTtl { ttl = ttl } =
  A.object [ "@type" A..= T.String "messageChatSetTtl", "ttl" A..= ttl ]

 toJSON MessageCustomServiceAction { text = text } =
  A.object [ "@type" A..= T.String "messageCustomServiceAction", "text" A..= text ]

 toJSON MessageGameScore { score = score, game_id = game_id, game_message_id = game_message_id } =
  A.object [ "@type" A..= T.String "messageGameScore", "score" A..= score, "game_id" A..= game_id, "game_message_id" A..= game_message_id ]

 toJSON MessagePaymentSuccessful { total_amount = total_amount, currency = currency, invoice_message_id = invoice_message_id, invoice_chat_id = invoice_chat_id } =
  A.object [ "@type" A..= T.String "messagePaymentSuccessful", "total_amount" A..= total_amount, "currency" A..= currency, "invoice_message_id" A..= invoice_message_id, "invoice_chat_id" A..= invoice_chat_id ]

 toJSON MessagePaymentSuccessfulBot { provider_payment_charge_id = provider_payment_charge_id, telegram_payment_charge_id = telegram_payment_charge_id, order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency } =
  A.object [ "@type" A..= T.String "messagePaymentSuccessfulBot", "provider_payment_charge_id" A..= provider_payment_charge_id, "telegram_payment_charge_id" A..= telegram_payment_charge_id, "order_info" A..= order_info, "shipping_option_id" A..= shipping_option_id, "invoice_payload" A..= invoice_payload, "total_amount" A..= total_amount, "currency" A..= currency ]

 toJSON MessageContactRegistered {  } =
  A.object [ "@type" A..= T.String "messageContactRegistered" ]

 toJSON MessageWebsiteConnected { domain_name = domain_name } =
  A.object [ "@type" A..= T.String "messageWebsiteConnected", "domain_name" A..= domain_name ]

 toJSON MessageWebAppDataSent { button_text = button_text } =
  A.object [ "@type" A..= T.String "messageWebAppDataSent", "button_text" A..= button_text ]

 toJSON MessageWebAppDataReceived { _data = _data, button_text = button_text } =
  A.object [ "@type" A..= T.String "messageWebAppDataReceived", "data" A..= _data, "button_text" A..= button_text ]

 toJSON MessagePassportDataSent { types = types } =
  A.object [ "@type" A..= T.String "messagePassportDataSent", "types" A..= types ]

 toJSON MessagePassportDataReceived { credentials = credentials, elements = elements } =
  A.object [ "@type" A..= T.String "messagePassportDataReceived", "credentials" A..= credentials, "elements" A..= elements ]

 toJSON MessageProximityAlertTriggered { distance = distance, watcher_id = watcher_id, traveler_id = traveler_id } =
  A.object [ "@type" A..= T.String "messageProximityAlertTriggered", "distance" A..= distance, "watcher_id" A..= watcher_id, "traveler_id" A..= traveler_id ]

 toJSON MessageUnsupported {  } =
  A.object [ "@type" A..= T.String "messageUnsupported" ]

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
    web_page <- o A..:? "web_page"
    _text <- o A..:? "text"
    return $ MessageText { web_page = web_page, _text = _text }

   parseMessageAnimation :: A.Value -> T.Parser MessageContent
   parseMessageAnimation = A.withObject "MessageAnimation" $ \o -> do
    is_secret <- o A..:? "is_secret"
    caption <- o A..:? "caption"
    animation <- o A..:? "animation"
    return $ MessageAnimation { is_secret = is_secret, caption = caption, animation = animation }

   parseMessageAudio :: A.Value -> T.Parser MessageContent
   parseMessageAudio = A.withObject "MessageAudio" $ \o -> do
    caption <- o A..:? "caption"
    audio <- o A..:? "audio"
    return $ MessageAudio { caption = caption, audio = audio }

   parseMessageDocument :: A.Value -> T.Parser MessageContent
   parseMessageDocument = A.withObject "MessageDocument" $ \o -> do
    caption <- o A..:? "caption"
    document <- o A..:? "document"
    return $ MessageDocument { caption = caption, document = document }

   parseMessagePhoto :: A.Value -> T.Parser MessageContent
   parseMessagePhoto = A.withObject "MessagePhoto" $ \o -> do
    is_secret <- o A..:? "is_secret"
    caption <- o A..:? "caption"
    _photo <- o A..:? "photo"
    return $ MessagePhoto { is_secret = is_secret, caption = caption, _photo = _photo }

   parseMessageExpiredPhoto :: A.Value -> T.Parser MessageContent
   parseMessageExpiredPhoto = A.withObject "MessageExpiredPhoto" $ \o -> do
    return $ MessageExpiredPhoto {  }

   parseMessageSticker :: A.Value -> T.Parser MessageContent
   parseMessageSticker = A.withObject "MessageSticker" $ \o -> do
    sticker <- o A..:? "sticker"
    return $ MessageSticker { sticker = sticker }

   parseMessageVideo :: A.Value -> T.Parser MessageContent
   parseMessageVideo = A.withObject "MessageVideo" $ \o -> do
    is_secret <- o A..:? "is_secret"
    caption <- o A..:? "caption"
    video <- o A..:? "video"
    return $ MessageVideo { is_secret = is_secret, caption = caption, video = video }

   parseMessageExpiredVideo :: A.Value -> T.Parser MessageContent
   parseMessageExpiredVideo = A.withObject "MessageExpiredVideo" $ \o -> do
    return $ MessageExpiredVideo {  }

   parseMessageVideoNote :: A.Value -> T.Parser MessageContent
   parseMessageVideoNote = A.withObject "MessageVideoNote" $ \o -> do
    is_secret <- o A..:? "is_secret"
    is_viewed <- o A..:? "is_viewed"
    video_note <- o A..:? "video_note"
    return $ MessageVideoNote { is_secret = is_secret, is_viewed = is_viewed, video_note = video_note }

   parseMessageVoiceNote :: A.Value -> T.Parser MessageContent
   parseMessageVoiceNote = A.withObject "MessageVoiceNote" $ \o -> do
    is_listened <- o A..:? "is_listened"
    caption <- o A..:? "caption"
    voice_note <- o A..:? "voice_note"
    return $ MessageVoiceNote { is_listened = is_listened, caption = caption, voice_note = voice_note }

   parseMessageLocation :: A.Value -> T.Parser MessageContent
   parseMessageLocation = A.withObject "MessageLocation" $ \o -> do
    proximity_alert_radius <- mconcat [ o A..:? "proximity_alert_radius", readMaybe <$> (o A..: "proximity_alert_radius" :: T.Parser String)] :: T.Parser (Maybe Int)
    heading <- mconcat [ o A..:? "heading", readMaybe <$> (o A..: "heading" :: T.Parser String)] :: T.Parser (Maybe Int)
    expires_in <- mconcat [ o A..:? "expires_in", readMaybe <$> (o A..: "expires_in" :: T.Parser String)] :: T.Parser (Maybe Int)
    live_period <- mconcat [ o A..:? "live_period", readMaybe <$> (o A..: "live_period" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    return $ MessageLocation { proximity_alert_radius = proximity_alert_radius, heading = heading, expires_in = expires_in, live_period = live_period, location = location }

   parseMessageVenue :: A.Value -> T.Parser MessageContent
   parseMessageVenue = A.withObject "MessageVenue" $ \o -> do
    venue <- o A..:? "venue"
    return $ MessageVenue { venue = venue }

   parseMessageContact :: A.Value -> T.Parser MessageContent
   parseMessageContact = A.withObject "MessageContact" $ \o -> do
    contact <- o A..:? "contact"
    return $ MessageContact { contact = contact }

   parseMessageAnimatedEmoji :: A.Value -> T.Parser MessageContent
   parseMessageAnimatedEmoji = A.withObject "MessageAnimatedEmoji" $ \o -> do
    emoji <- o A..:? "emoji"
    animated_emoji <- o A..:? "animated_emoji"
    return $ MessageAnimatedEmoji { emoji = emoji, animated_emoji = animated_emoji }

   parseMessageDice :: A.Value -> T.Parser MessageContent
   parseMessageDice = A.withObject "MessageDice" $ \o -> do
    success_animation_frame_number <- mconcat [ o A..:? "success_animation_frame_number", readMaybe <$> (o A..: "success_animation_frame_number" :: T.Parser String)] :: T.Parser (Maybe Int)
    value <- mconcat [ o A..:? "value", readMaybe <$> (o A..: "value" :: T.Parser String)] :: T.Parser (Maybe Int)
    emoji <- o A..:? "emoji"
    final_state <- o A..:? "final_state"
    initial_state <- o A..:? "initial_state"
    return $ MessageDice { success_animation_frame_number = success_animation_frame_number, value = value, emoji = emoji, final_state = final_state, initial_state = initial_state }

   parseMessageGame :: A.Value -> T.Parser MessageContent
   parseMessageGame = A.withObject "MessageGame" $ \o -> do
    game <- o A..:? "game"
    return $ MessageGame { game = game }

   parseMessagePoll :: A.Value -> T.Parser MessageContent
   parseMessagePoll = A.withObject "MessagePoll" $ \o -> do
    poll <- o A..:? "poll"
    return $ MessagePoll { poll = poll }

   parseMessageInvoice :: A.Value -> T.Parser MessageContent
   parseMessageInvoice = A.withObject "MessageInvoice" $ \o -> do
    receipt_message_id <- mconcat [ o A..:? "receipt_message_id", readMaybe <$> (o A..: "receipt_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    need_shipping_address <- o A..:? "need_shipping_address"
    is_test <- o A..:? "is_test"
    start_parameter <- o A..:? "start_parameter"
    total_amount <- mconcat [ o A..:? "total_amount", readMaybe <$> (o A..: "total_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    currency <- o A..:? "currency"
    _photo <- o A..:? "photo"
    description <- o A..:? "description"
    title <- o A..:? "title"
    return $ MessageInvoice { receipt_message_id = receipt_message_id, need_shipping_address = need_shipping_address, is_test = is_test, start_parameter = start_parameter, total_amount = total_amount, currency = currency, _photo = _photo, description = description, title = title }

   parseMessageCall :: A.Value -> T.Parser MessageContent
   parseMessageCall = A.withObject "MessageCall" $ \o -> do
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    discard_reason <- o A..:? "discard_reason"
    is_video <- o A..:? "is_video"
    return $ MessageCall { duration = duration, discard_reason = discard_reason, is_video = is_video }

   parseMessageVideoChatScheduled :: A.Value -> T.Parser MessageContent
   parseMessageVideoChatScheduled = A.withObject "MessageVideoChatScheduled" $ \o -> do
    start_date <- mconcat [ o A..:? "start_date", readMaybe <$> (o A..: "start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageVideoChatScheduled { start_date = start_date, group_call_id = group_call_id }

   parseMessageVideoChatStarted :: A.Value -> T.Parser MessageContent
   parseMessageVideoChatStarted = A.withObject "MessageVideoChatStarted" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageVideoChatStarted { group_call_id = group_call_id }

   parseMessageVideoChatEnded :: A.Value -> T.Parser MessageContent
   parseMessageVideoChatEnded = A.withObject "MessageVideoChatEnded" $ \o -> do
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageVideoChatEnded { duration = duration }

   parseMessageInviteVideoChatParticipants :: A.Value -> T.Parser MessageContent
   parseMessageInviteVideoChatParticipants = A.withObject "MessageInviteVideoChatParticipants" $ \o -> do
    user_ids <- o A..:? "user_ids"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageInviteVideoChatParticipants { user_ids = user_ids, group_call_id = group_call_id }

   parseMessageBasicGroupChatCreate :: A.Value -> T.Parser MessageContent
   parseMessageBasicGroupChatCreate = A.withObject "MessageBasicGroupChatCreate" $ \o -> do
    member_user_ids <- o A..:? "member_user_ids"
    title <- o A..:? "title"
    return $ MessageBasicGroupChatCreate { member_user_ids = member_user_ids, title = title }

   parseMessageSupergroupChatCreate :: A.Value -> T.Parser MessageContent
   parseMessageSupergroupChatCreate = A.withObject "MessageSupergroupChatCreate" $ \o -> do
    title <- o A..:? "title"
    return $ MessageSupergroupChatCreate { title = title }

   parseMessageChatChangeTitle :: A.Value -> T.Parser MessageContent
   parseMessageChatChangeTitle = A.withObject "MessageChatChangeTitle" $ \o -> do
    title <- o A..:? "title"
    return $ MessageChatChangeTitle { title = title }

   parseMessageChatChangePhoto :: A.Value -> T.Parser MessageContent
   parseMessageChatChangePhoto = A.withObject "MessageChatChangePhoto" $ \o -> do
    photo <- o A..:? "photo"
    return $ MessageChatChangePhoto { photo = photo }

   parseMessageChatDeletePhoto :: A.Value -> T.Parser MessageContent
   parseMessageChatDeletePhoto = A.withObject "MessageChatDeletePhoto" $ \o -> do
    return $ MessageChatDeletePhoto {  }

   parseMessageChatAddMembers :: A.Value -> T.Parser MessageContent
   parseMessageChatAddMembers = A.withObject "MessageChatAddMembers" $ \o -> do
    member_user_ids <- o A..:? "member_user_ids"
    return $ MessageChatAddMembers { member_user_ids = member_user_ids }

   parseMessageChatJoinByLink :: A.Value -> T.Parser MessageContent
   parseMessageChatJoinByLink = A.withObject "MessageChatJoinByLink" $ \o -> do
    return $ MessageChatJoinByLink {  }

   parseMessageChatJoinByRequest :: A.Value -> T.Parser MessageContent
   parseMessageChatJoinByRequest = A.withObject "MessageChatJoinByRequest" $ \o -> do
    return $ MessageChatJoinByRequest {  }

   parseMessageChatDeleteMember :: A.Value -> T.Parser MessageContent
   parseMessageChatDeleteMember = A.withObject "MessageChatDeleteMember" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageChatDeleteMember { user_id = user_id }

   parseMessageChatUpgradeTo :: A.Value -> T.Parser MessageContent
   parseMessageChatUpgradeTo = A.withObject "MessageChatUpgradeTo" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageChatUpgradeTo { supergroup_id = supergroup_id }

   parseMessageChatUpgradeFrom :: A.Value -> T.Parser MessageContent
   parseMessageChatUpgradeFrom = A.withObject "MessageChatUpgradeFrom" $ \o -> do
    basic_group_id <- mconcat [ o A..:? "basic_group_id", readMaybe <$> (o A..: "basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    title <- o A..:? "title"
    return $ MessageChatUpgradeFrom { basic_group_id = basic_group_id, title = title }

   parseMessagePinMessage :: A.Value -> T.Parser MessageContent
   parseMessagePinMessage = A.withObject "MessagePinMessage" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessagePinMessage { message_id = message_id }

   parseMessageScreenshotTaken :: A.Value -> T.Parser MessageContent
   parseMessageScreenshotTaken = A.withObject "MessageScreenshotTaken" $ \o -> do
    return $ MessageScreenshotTaken {  }

   parseMessageChatSetTheme :: A.Value -> T.Parser MessageContent
   parseMessageChatSetTheme = A.withObject "MessageChatSetTheme" $ \o -> do
    theme_name <- o A..:? "theme_name"
    return $ MessageChatSetTheme { theme_name = theme_name }

   parseMessageChatSetTtl :: A.Value -> T.Parser MessageContent
   parseMessageChatSetTtl = A.withObject "MessageChatSetTtl" $ \o -> do
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageChatSetTtl { ttl = ttl }

   parseMessageCustomServiceAction :: A.Value -> T.Parser MessageContent
   parseMessageCustomServiceAction = A.withObject "MessageCustomServiceAction" $ \o -> do
    text <- o A..:? "text"
    return $ MessageCustomServiceAction { text = text }

   parseMessageGameScore :: A.Value -> T.Parser MessageContent
   parseMessageGameScore = A.withObject "MessageGameScore" $ \o -> do
    score <- mconcat [ o A..:? "score", readMaybe <$> (o A..: "score" :: T.Parser String)] :: T.Parser (Maybe Int)
    game_id <- mconcat [ o A..:? "game_id", readMaybe <$> (o A..: "game_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    game_message_id <- mconcat [ o A..:? "game_message_id", readMaybe <$> (o A..: "game_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageGameScore { score = score, game_id = game_id, game_message_id = game_message_id }

   parseMessagePaymentSuccessful :: A.Value -> T.Parser MessageContent
   parseMessagePaymentSuccessful = A.withObject "MessagePaymentSuccessful" $ \o -> do
    total_amount <- mconcat [ o A..:? "total_amount", readMaybe <$> (o A..: "total_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    currency <- o A..:? "currency"
    invoice_message_id <- mconcat [ o A..:? "invoice_message_id", readMaybe <$> (o A..: "invoice_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    invoice_chat_id <- mconcat [ o A..:? "invoice_chat_id", readMaybe <$> (o A..: "invoice_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessagePaymentSuccessful { total_amount = total_amount, currency = currency, invoice_message_id = invoice_message_id, invoice_chat_id = invoice_chat_id }

   parseMessagePaymentSuccessfulBot :: A.Value -> T.Parser MessageContent
   parseMessagePaymentSuccessfulBot = A.withObject "MessagePaymentSuccessfulBot" $ \o -> do
    provider_payment_charge_id <- o A..:? "provider_payment_charge_id"
    telegram_payment_charge_id <- o A..:? "telegram_payment_charge_id"
    order_info <- o A..:? "order_info"
    shipping_option_id <- o A..:? "shipping_option_id"
    invoice_payload <- o A..:? "invoice_payload"
    total_amount <- mconcat [ o A..:? "total_amount", readMaybe <$> (o A..: "total_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    currency <- o A..:? "currency"
    return $ MessagePaymentSuccessfulBot { provider_payment_charge_id = provider_payment_charge_id, telegram_payment_charge_id = telegram_payment_charge_id, order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency }

   parseMessageContactRegistered :: A.Value -> T.Parser MessageContent
   parseMessageContactRegistered = A.withObject "MessageContactRegistered" $ \o -> do
    return $ MessageContactRegistered {  }

   parseMessageWebsiteConnected :: A.Value -> T.Parser MessageContent
   parseMessageWebsiteConnected = A.withObject "MessageWebsiteConnected" $ \o -> do
    domain_name <- o A..:? "domain_name"
    return $ MessageWebsiteConnected { domain_name = domain_name }

   parseMessageWebAppDataSent :: A.Value -> T.Parser MessageContent
   parseMessageWebAppDataSent = A.withObject "MessageWebAppDataSent" $ \o -> do
    button_text <- o A..:? "button_text"
    return $ MessageWebAppDataSent { button_text = button_text }

   parseMessageWebAppDataReceived :: A.Value -> T.Parser MessageContent
   parseMessageWebAppDataReceived = A.withObject "MessageWebAppDataReceived" $ \o -> do
    _data <- o A..:? "data"
    button_text <- o A..:? "button_text"
    return $ MessageWebAppDataReceived { _data = _data, button_text = button_text }

   parseMessagePassportDataSent :: A.Value -> T.Parser MessageContent
   parseMessagePassportDataSent = A.withObject "MessagePassportDataSent" $ \o -> do
    types <- o A..:? "types"
    return $ MessagePassportDataSent { types = types }

   parseMessagePassportDataReceived :: A.Value -> T.Parser MessageContent
   parseMessagePassportDataReceived = A.withObject "MessagePassportDataReceived" $ \o -> do
    credentials <- o A..:? "credentials"
    elements <- o A..:? "elements"
    return $ MessagePassportDataReceived { credentials = credentials, elements = elements }

   parseMessageProximityAlertTriggered :: A.Value -> T.Parser MessageContent
   parseMessageProximityAlertTriggered = A.withObject "MessageProximityAlertTriggered" $ \o -> do
    distance <- mconcat [ o A..:? "distance", readMaybe <$> (o A..: "distance" :: T.Parser String)] :: T.Parser (Maybe Int)
    watcher_id <- o A..:? "watcher_id"
    traveler_id <- o A..:? "traveler_id"
    return $ MessageProximityAlertTriggered { distance = distance, watcher_id = watcher_id, traveler_id = traveler_id }

   parseMessageUnsupported :: A.Value -> T.Parser MessageContent
   parseMessageUnsupported = A.withObject "MessageUnsupported" $ \o -> do
    return $ MessageUnsupported {  }
 parseJSON _ = mempty
