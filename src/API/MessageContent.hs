-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
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
import {-# SOURCE #-} qualified API.Game as Game
import {-# SOURCE #-} qualified API.Poll as Poll
import {-# SOURCE #-} qualified API.CallDiscardReason as CallDiscardReason
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType
import {-# SOURCE #-} qualified API.EncryptedCredentials as EncryptedCredentials
import {-# SOURCE #-} qualified API.EncryptedPassportElement as EncryptedPassportElement

--main = putStrLn "ok"

data MessageContent = 
 MessageText { web_page :: WebPage.WebPage, _text :: FormattedText.FormattedText }  
 | MessageAnimation { is_secret :: Bool, caption :: FormattedText.FormattedText, animation :: Animation.Animation }  
 | MessageAudio { caption :: FormattedText.FormattedText, audio :: Audio.Audio }  
 | MessageDocument { caption :: FormattedText.FormattedText, document :: Document.Document }  
 | MessagePhoto { is_secret :: Bool, caption :: FormattedText.FormattedText, photo :: Photo.Photo }  
 | MessageExpiredPhoto 
 | MessageSticker { sticker :: Sticker.Sticker }  
 | MessageVideo { is_secret :: Bool, caption :: FormattedText.FormattedText, video :: Video.Video }  
 | MessageExpiredVideo 
 | MessageVideoNote { is_secret :: Bool, is_viewed :: Bool, video_note :: VideoNote.VideoNote }  
 | MessageVoiceNote { is_listened :: Bool, caption :: FormattedText.FormattedText, voice_note :: VoiceNote.VoiceNote }  
 | MessageLocation { expires_in :: Int, live_period :: Int, location :: Location.Location }  
 | MessageVenue { venue :: Venue.Venue }  
 | MessageContact { contact :: Contact.Contact }  
 | MessageDice { value :: Int }  
 | MessageGame { game :: Game.Game }  
 | MessagePoll { poll :: Poll.Poll }  
 | MessageInvoice { receipt_message_id :: Int, need_shipping_address :: Bool, is_test :: Bool, start_parameter :: String, total_amount :: Int, currency :: String, photo :: Photo.Photo, description :: String, title :: String }  
 | MessageCall { duration :: Int, discard_reason :: CallDiscardReason.CallDiscardReason }  
 | MessageBasicGroupChatCreate { member_user_ids :: [Int], title :: String }  
 | MessageSupergroupChatCreate { title :: String }  
 | MessageChatChangeTitle { title :: String }  
 | MessageChatChangePhoto { photo :: Photo.Photo }  
 | MessageChatDeletePhoto 
 | MessageChatAddMembers { member_user_ids :: [Int] }  
 | MessageChatJoinByLink 
 | MessageChatDeleteMember { user_id :: Int }  
 | MessageChatUpgradeTo { supergroup_id :: Int }  
 | MessageChatUpgradeFrom { basic_group_id :: Int, title :: String }  
 | MessagePinMessage { message_id :: Int }  
 | MessageScreenshotTaken 
 | MessageChatSetTtl { ttl :: Int }  
 | MessageCustomServiceAction { text :: String }  
 | MessageGameScore { score :: Int, game_id :: Int, game_message_id :: Int }  
 | MessagePaymentSuccessful { total_amount :: Int, currency :: String, invoice_message_id :: Int }  
 | MessagePaymentSuccessfulBot { provider_payment_charge_id :: String, telegram_payment_charge_id :: String, order_info :: OrderInfo.OrderInfo, shipping_option_id :: String, invoice_payload :: String, total_amount :: Int, currency :: String, invoice_message_id :: Int }  
 | MessageContactRegistered 
 | MessageWebsiteConnected { domain_name :: String }  
 | MessagePassportDataSent { types :: [PassportElementType.PassportElementType] }  
 | MessagePassportDataReceived { credentials :: EncryptedCredentials.EncryptedCredentials, elements :: [EncryptedPassportElement.EncryptedPassportElement] }  
 | MessageUnsupported -- deriving (Show)

instance T.ToJSON MessageContent where
 toJSON (MessageText { web_page = web_page, _text = _text }) =
  A.object [ "@type" A..= T.String "messageText", "web_page" A..= web_page, "text" A..= _text ]

 toJSON (MessageAnimation { is_secret = is_secret, caption = caption, animation = animation }) =
  A.object [ "@type" A..= T.String "messageAnimation", "is_secret" A..= is_secret, "caption" A..= caption, "animation" A..= animation ]

 toJSON (MessageAudio { caption = caption, audio = audio }) =
  A.object [ "@type" A..= T.String "messageAudio", "caption" A..= caption, "audio" A..= audio ]

 toJSON (MessageDocument { caption = caption, document = document }) =
  A.object [ "@type" A..= T.String "messageDocument", "caption" A..= caption, "document" A..= document ]

 toJSON (MessagePhoto { is_secret = is_secret, caption = caption, photo = photo }) =
  A.object [ "@type" A..= T.String "messagePhoto", "is_secret" A..= is_secret, "caption" A..= caption, "photo" A..= photo ]

 toJSON (MessageExpiredPhoto {  }) =
  A.object [ "@type" A..= T.String "messageExpiredPhoto" ]

 toJSON (MessageSticker { sticker = sticker }) =
  A.object [ "@type" A..= T.String "messageSticker", "sticker" A..= sticker ]

 toJSON (MessageVideo { is_secret = is_secret, caption = caption, video = video }) =
  A.object [ "@type" A..= T.String "messageVideo", "is_secret" A..= is_secret, "caption" A..= caption, "video" A..= video ]

 toJSON (MessageExpiredVideo {  }) =
  A.object [ "@type" A..= T.String "messageExpiredVideo" ]

 toJSON (MessageVideoNote { is_secret = is_secret, is_viewed = is_viewed, video_note = video_note }) =
  A.object [ "@type" A..= T.String "messageVideoNote", "is_secret" A..= is_secret, "is_viewed" A..= is_viewed, "video_note" A..= video_note ]

 toJSON (MessageVoiceNote { is_listened = is_listened, caption = caption, voice_note = voice_note }) =
  A.object [ "@type" A..= T.String "messageVoiceNote", "is_listened" A..= is_listened, "caption" A..= caption, "voice_note" A..= voice_note ]

 toJSON (MessageLocation { expires_in = expires_in, live_period = live_period, location = location }) =
  A.object [ "@type" A..= T.String "messageLocation", "expires_in" A..= expires_in, "live_period" A..= live_period, "location" A..= location ]

 toJSON (MessageVenue { venue = venue }) =
  A.object [ "@type" A..= T.String "messageVenue", "venue" A..= venue ]

 toJSON (MessageContact { contact = contact }) =
  A.object [ "@type" A..= T.String "messageContact", "contact" A..= contact ]

 toJSON (MessageDice { value = value }) =
  A.object [ "@type" A..= T.String "messageDice", "value" A..= value ]

 toJSON (MessageGame { game = game }) =
  A.object [ "@type" A..= T.String "messageGame", "game" A..= game ]

 toJSON (MessagePoll { poll = poll }) =
  A.object [ "@type" A..= T.String "messagePoll", "poll" A..= poll ]

 toJSON (MessageInvoice { receipt_message_id = receipt_message_id, need_shipping_address = need_shipping_address, is_test = is_test, start_parameter = start_parameter, total_amount = total_amount, currency = currency, photo = photo, description = description, title = title }) =
  A.object [ "@type" A..= T.String "messageInvoice", "receipt_message_id" A..= receipt_message_id, "need_shipping_address" A..= need_shipping_address, "is_test" A..= is_test, "start_parameter" A..= start_parameter, "total_amount" A..= total_amount, "currency" A..= currency, "photo" A..= photo, "description" A..= description, "title" A..= title ]

 toJSON (MessageCall { duration = duration, discard_reason = discard_reason }) =
  A.object [ "@type" A..= T.String "messageCall", "duration" A..= duration, "discard_reason" A..= discard_reason ]

 toJSON (MessageBasicGroupChatCreate { member_user_ids = member_user_ids, title = title }) =
  A.object [ "@type" A..= T.String "messageBasicGroupChatCreate", "member_user_ids" A..= member_user_ids, "title" A..= title ]

 toJSON (MessageSupergroupChatCreate { title = title }) =
  A.object [ "@type" A..= T.String "messageSupergroupChatCreate", "title" A..= title ]

 toJSON (MessageChatChangeTitle { title = title }) =
  A.object [ "@type" A..= T.String "messageChatChangeTitle", "title" A..= title ]

 toJSON (MessageChatChangePhoto { photo = photo }) =
  A.object [ "@type" A..= T.String "messageChatChangePhoto", "photo" A..= photo ]

 toJSON (MessageChatDeletePhoto {  }) =
  A.object [ "@type" A..= T.String "messageChatDeletePhoto" ]

 toJSON (MessageChatAddMembers { member_user_ids = member_user_ids }) =
  A.object [ "@type" A..= T.String "messageChatAddMembers", "member_user_ids" A..= member_user_ids ]

 toJSON (MessageChatJoinByLink {  }) =
  A.object [ "@type" A..= T.String "messageChatJoinByLink" ]

 toJSON (MessageChatDeleteMember { user_id = user_id }) =
  A.object [ "@type" A..= T.String "messageChatDeleteMember", "user_id" A..= user_id ]

 toJSON (MessageChatUpgradeTo { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "messageChatUpgradeTo", "supergroup_id" A..= supergroup_id ]

 toJSON (MessageChatUpgradeFrom { basic_group_id = basic_group_id, title = title }) =
  A.object [ "@type" A..= T.String "messageChatUpgradeFrom", "basic_group_id" A..= basic_group_id, "title" A..= title ]

 toJSON (MessagePinMessage { message_id = message_id }) =
  A.object [ "@type" A..= T.String "messagePinMessage", "message_id" A..= message_id ]

 toJSON (MessageScreenshotTaken {  }) =
  A.object [ "@type" A..= T.String "messageScreenshotTaken" ]

 toJSON (MessageChatSetTtl { ttl = ttl }) =
  A.object [ "@type" A..= T.String "messageChatSetTtl", "ttl" A..= ttl ]

 toJSON (MessageCustomServiceAction { text = text }) =
  A.object [ "@type" A..= T.String "messageCustomServiceAction", "text" A..= text ]

 toJSON (MessageGameScore { score = score, game_id = game_id, game_message_id = game_message_id }) =
  A.object [ "@type" A..= T.String "messageGameScore", "score" A..= score, "game_id" A..= game_id, "game_message_id" A..= game_message_id ]

 toJSON (MessagePaymentSuccessful { total_amount = total_amount, currency = currency, invoice_message_id = invoice_message_id }) =
  A.object [ "@type" A..= T.String "messagePaymentSuccessful", "total_amount" A..= total_amount, "currency" A..= currency, "invoice_message_id" A..= invoice_message_id ]

 toJSON (MessagePaymentSuccessfulBot { provider_payment_charge_id = provider_payment_charge_id, telegram_payment_charge_id = telegram_payment_charge_id, order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency, invoice_message_id = invoice_message_id }) =
  A.object [ "@type" A..= T.String "messagePaymentSuccessfulBot", "provider_payment_charge_id" A..= provider_payment_charge_id, "telegram_payment_charge_id" A..= telegram_payment_charge_id, "order_info" A..= order_info, "shipping_option_id" A..= shipping_option_id, "invoice_payload" A..= invoice_payload, "total_amount" A..= total_amount, "currency" A..= currency, "invoice_message_id" A..= invoice_message_id ]

 toJSON (MessageContactRegistered {  }) =
  A.object [ "@type" A..= T.String "messageContactRegistered" ]

 toJSON (MessageWebsiteConnected { domain_name = domain_name }) =
  A.object [ "@type" A..= T.String "messageWebsiteConnected", "domain_name" A..= domain_name ]

 toJSON (MessagePassportDataSent { types = types }) =
  A.object [ "@type" A..= T.String "messagePassportDataSent", "types" A..= types ]

 toJSON (MessagePassportDataReceived { credentials = credentials, elements = elements }) =
  A.object [ "@type" A..= T.String "messagePassportDataReceived", "credentials" A..= credentials, "elements" A..= elements ]

 toJSON (MessageUnsupported {  }) =
  A.object [ "@type" A..= T.String "messageUnsupported" ]
-- messageText MessageContent  { web_page :: WebPage.WebPage, _text :: FormattedText.FormattedText } 

-- messageAnimation MessageContent  { is_secret :: Bool, caption :: FormattedText.FormattedText, animation :: Animation.Animation } 

-- messageAudio MessageContent  { caption :: FormattedText.FormattedText, audio :: Audio.Audio } 

-- messageDocument MessageContent  { caption :: FormattedText.FormattedText, document :: Document.Document } 

-- messagePhoto MessageContent  { is_secret :: Bool, caption :: FormattedText.FormattedText, photo :: Photo.Photo } 

-- messageExpiredPhoto MessageContent 

-- messageSticker MessageContent  { sticker :: Sticker.Sticker } 

-- messageVideo MessageContent  { is_secret :: Bool, caption :: FormattedText.FormattedText, video :: Video.Video } 

-- messageExpiredVideo MessageContent 

-- messageVideoNote MessageContent  { is_secret :: Bool, is_viewed :: Bool, video_note :: VideoNote.VideoNote } 

-- messageVoiceNote MessageContent  { is_listened :: Bool, caption :: FormattedText.FormattedText, voice_note :: VoiceNote.VoiceNote } 

-- messageLocation MessageContent  { expires_in :: Int, live_period :: Int, location :: Location.Location } 

-- messageVenue MessageContent  { venue :: Venue.Venue } 

-- messageContact MessageContent  { contact :: Contact.Contact } 

-- messageDice MessageContent  { value :: Int } 

-- messageGame MessageContent  { game :: Game.Game } 

-- messagePoll MessageContent  { poll :: Poll.Poll } 

-- messageInvoice MessageContent  { receipt_message_id :: Int, need_shipping_address :: Bool, is_test :: Bool, start_parameter :: String, total_amount :: Int, currency :: String, photo :: Photo.Photo, description :: String, title :: String } 

-- messageCall MessageContent  { duration :: Int, discard_reason :: CallDiscardReason.CallDiscardReason } 

-- messageBasicGroupChatCreate MessageContent  { member_user_ids :: [Int], title :: String } 

-- messageSupergroupChatCreate MessageContent  { title :: String } 

-- messageChatChangeTitle MessageContent  { title :: String } 

-- messageChatChangePhoto MessageContent  { photo :: Photo.Photo } 

-- messageChatDeletePhoto MessageContent 

-- messageChatAddMembers MessageContent  { member_user_ids :: [Int] } 

-- messageChatJoinByLink MessageContent 

-- messageChatDeleteMember MessageContent  { user_id :: Int } 

-- messageChatUpgradeTo MessageContent  { supergroup_id :: Int } 

-- messageChatUpgradeFrom MessageContent  { basic_group_id :: Int, title :: String } 

-- messagePinMessage MessageContent  { message_id :: Int } 

-- messageScreenshotTaken MessageContent 

-- messageChatSetTtl MessageContent  { ttl :: Int } 

-- messageCustomServiceAction MessageContent  { text :: String } 

-- messageGameScore MessageContent  { score :: Int, game_id :: Int, game_message_id :: Int } 

-- messagePaymentSuccessful MessageContent  { total_amount :: Int, currency :: String, invoice_message_id :: Int } 

-- messagePaymentSuccessfulBot MessageContent  { provider_payment_charge_id :: String, telegram_payment_charge_id :: String, order_info :: OrderInfo.OrderInfo, shipping_option_id :: String, invoice_payload :: String, total_amount :: Int, currency :: String, invoice_message_id :: Int } 

-- messageContactRegistered MessageContent 

-- messageWebsiteConnected MessageContent  { domain_name :: String } 

-- messagePassportDataSent MessageContent  { types :: [PassportElementType.PassportElementType] } 

-- messagePassportDataReceived MessageContent  { credentials :: EncryptedCredentials.EncryptedCredentials, elements :: [EncryptedPassportElement.EncryptedPassportElement] } 

-- messageUnsupported MessageContent 

