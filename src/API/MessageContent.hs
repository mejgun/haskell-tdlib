-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageContent where

import Control.Applicative (optional)
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

data MessageContent = 
 MessageText { web_page :: Maybe WebPage.WebPage, _text :: Maybe FormattedText.FormattedText }  
 | MessageAnimation { is_secret :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, animation :: Maybe Animation.Animation }  
 | MessageAudio { caption :: Maybe FormattedText.FormattedText, audio :: Maybe Audio.Audio }  
 | MessageDocument { caption :: Maybe FormattedText.FormattedText, document :: Maybe Document.Document }  
 | MessagePhoto { is_secret :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, photo :: Maybe Photo.Photo }  
 | MessageExpiredPhoto 
 | MessageSticker { sticker :: Maybe Sticker.Sticker }  
 | MessageVideo { is_secret :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, video :: Maybe Video.Video }  
 | MessageExpiredVideo 
 | MessageVideoNote { is_secret :: Maybe Bool, is_viewed :: Maybe Bool, video_note :: Maybe VideoNote.VideoNote }  
 | MessageVoiceNote { is_listened :: Maybe Bool, caption :: Maybe FormattedText.FormattedText, voice_note :: Maybe VoiceNote.VoiceNote }  
 | MessageLocation { expires_in :: Maybe Int, live_period :: Maybe Int, location :: Maybe Location.Location }  
 | MessageVenue { venue :: Maybe Venue.Venue }  
 | MessageContact { contact :: Maybe Contact.Contact }  
 | MessageDice { value :: Maybe Int }  
 | MessageGame { game :: Maybe Game.Game }  
 | MessagePoll { poll :: Maybe Poll.Poll }  
 | MessageInvoice { receipt_message_id :: Maybe Int, need_shipping_address :: Maybe Bool, is_test :: Maybe Bool, start_parameter :: Maybe String, total_amount :: Maybe Int, currency :: Maybe String, photo :: Maybe Photo.Photo, description :: Maybe String, title :: Maybe String }  
 | MessageCall { duration :: Maybe Int, discard_reason :: Maybe CallDiscardReason.CallDiscardReason }  
 | MessageBasicGroupChatCreate { member_user_ids :: Maybe [Int], title :: Maybe String }  
 | MessageSupergroupChatCreate { title :: Maybe String }  
 | MessageChatChangeTitle { title :: Maybe String }  
 | MessageChatChangePhoto { photo :: Maybe Photo.Photo }  
 | MessageChatDeletePhoto 
 | MessageChatAddMembers { member_user_ids :: Maybe [Int] }  
 | MessageChatJoinByLink 
 | MessageChatDeleteMember { user_id :: Maybe Int }  
 | MessageChatUpgradeTo { supergroup_id :: Maybe Int }  
 | MessageChatUpgradeFrom { basic_group_id :: Maybe Int, title :: Maybe String }  
 | MessagePinMessage { message_id :: Maybe Int }  
 | MessageScreenshotTaken 
 | MessageChatSetTtl { ttl :: Maybe Int }  
 | MessageCustomServiceAction { text :: Maybe String }  
 | MessageGameScore { score :: Maybe Int, game_id :: Maybe Int, game_message_id :: Maybe Int }  
 | MessagePaymentSuccessful { total_amount :: Maybe Int, currency :: Maybe String, invoice_message_id :: Maybe Int }  
 | MessagePaymentSuccessfulBot { provider_payment_charge_id :: Maybe String, telegram_payment_charge_id :: Maybe String, order_info :: Maybe OrderInfo.OrderInfo, shipping_option_id :: Maybe String, invoice_payload :: Maybe String, total_amount :: Maybe Int, currency :: Maybe String, invoice_message_id :: Maybe Int }  
 | MessageContactRegistered 
 | MessageWebsiteConnected { domain_name :: Maybe String }  
 | MessagePassportDataSent { types :: Maybe [PassportElementType.PassportElementType] }  
 | MessagePassportDataReceived { credentials :: Maybe EncryptedCredentials.EncryptedCredentials, elements :: Maybe [EncryptedPassportElement.EncryptedPassportElement] }  
 | MessageUnsupported deriving (Show)

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
   "messageDice" -> parseMessageDice v
   "messageGame" -> parseMessageGame v
   "messagePoll" -> parseMessagePoll v
   "messageInvoice" -> parseMessageInvoice v
   "messageCall" -> parseMessageCall v
   "messageBasicGroupChatCreate" -> parseMessageBasicGroupChatCreate v
   "messageSupergroupChatCreate" -> parseMessageSupergroupChatCreate v
   "messageChatChangeTitle" -> parseMessageChatChangeTitle v
   "messageChatChangePhoto" -> parseMessageChatChangePhoto v
   "messageChatDeletePhoto" -> parseMessageChatDeletePhoto v
   "messageChatAddMembers" -> parseMessageChatAddMembers v
   "messageChatJoinByLink" -> parseMessageChatJoinByLink v
   "messageChatDeleteMember" -> parseMessageChatDeleteMember v
   "messageChatUpgradeTo" -> parseMessageChatUpgradeTo v
   "messageChatUpgradeFrom" -> parseMessageChatUpgradeFrom v
   "messagePinMessage" -> parseMessagePinMessage v
   "messageScreenshotTaken" -> parseMessageScreenshotTaken v
   "messageChatSetTtl" -> parseMessageChatSetTtl v
   "messageCustomServiceAction" -> parseMessageCustomServiceAction v
   "messageGameScore" -> parseMessageGameScore v
   "messagePaymentSuccessful" -> parseMessagePaymentSuccessful v
   "messagePaymentSuccessfulBot" -> parseMessagePaymentSuccessfulBot v
   "messageContactRegistered" -> parseMessageContactRegistered v
   "messageWebsiteConnected" -> parseMessageWebsiteConnected v
   "messagePassportDataSent" -> parseMessagePassportDataSent v
   "messagePassportDataReceived" -> parseMessagePassportDataReceived v
   "messageUnsupported" -> parseMessageUnsupported v
   _ -> mempty
  where
   parseMessageText :: A.Value -> T.Parser MessageContent
   parseMessageText = A.withObject "MessageText" $ \o -> do
    web_page <- optional $ o A..: "web_page"
    _text <- optional $ o A..: "text"
    return $ MessageText { web_page = web_page, _text = _text }

   parseMessageAnimation :: A.Value -> T.Parser MessageContent
   parseMessageAnimation = A.withObject "MessageAnimation" $ \o -> do
    is_secret <- optional $ o A..: "is_secret"
    caption <- optional $ o A..: "caption"
    animation <- optional $ o A..: "animation"
    return $ MessageAnimation { is_secret = is_secret, caption = caption, animation = animation }

   parseMessageAudio :: A.Value -> T.Parser MessageContent
   parseMessageAudio = A.withObject "MessageAudio" $ \o -> do
    caption <- optional $ o A..: "caption"
    audio <- optional $ o A..: "audio"
    return $ MessageAudio { caption = caption, audio = audio }

   parseMessageDocument :: A.Value -> T.Parser MessageContent
   parseMessageDocument = A.withObject "MessageDocument" $ \o -> do
    caption <- optional $ o A..: "caption"
    document <- optional $ o A..: "document"
    return $ MessageDocument { caption = caption, document = document }

   parseMessagePhoto :: A.Value -> T.Parser MessageContent
   parseMessagePhoto = A.withObject "MessagePhoto" $ \o -> do
    is_secret <- optional $ o A..: "is_secret"
    caption <- optional $ o A..: "caption"
    photo <- optional $ o A..: "photo"
    return $ MessagePhoto { is_secret = is_secret, caption = caption, photo = photo }

   parseMessageExpiredPhoto :: A.Value -> T.Parser MessageContent
   parseMessageExpiredPhoto = A.withObject "MessageExpiredPhoto" $ \o -> do
    return $ MessageExpiredPhoto {  }

   parseMessageSticker :: A.Value -> T.Parser MessageContent
   parseMessageSticker = A.withObject "MessageSticker" $ \o -> do
    sticker <- optional $ o A..: "sticker"
    return $ MessageSticker { sticker = sticker }

   parseMessageVideo :: A.Value -> T.Parser MessageContent
   parseMessageVideo = A.withObject "MessageVideo" $ \o -> do
    is_secret <- optional $ o A..: "is_secret"
    caption <- optional $ o A..: "caption"
    video <- optional $ o A..: "video"
    return $ MessageVideo { is_secret = is_secret, caption = caption, video = video }

   parseMessageExpiredVideo :: A.Value -> T.Parser MessageContent
   parseMessageExpiredVideo = A.withObject "MessageExpiredVideo" $ \o -> do
    return $ MessageExpiredVideo {  }

   parseMessageVideoNote :: A.Value -> T.Parser MessageContent
   parseMessageVideoNote = A.withObject "MessageVideoNote" $ \o -> do
    is_secret <- optional $ o A..: "is_secret"
    is_viewed <- optional $ o A..: "is_viewed"
    video_note <- optional $ o A..: "video_note"
    return $ MessageVideoNote { is_secret = is_secret, is_viewed = is_viewed, video_note = video_note }

   parseMessageVoiceNote :: A.Value -> T.Parser MessageContent
   parseMessageVoiceNote = A.withObject "MessageVoiceNote" $ \o -> do
    is_listened <- optional $ o A..: "is_listened"
    caption <- optional $ o A..: "caption"
    voice_note <- optional $ o A..: "voice_note"
    return $ MessageVoiceNote { is_listened = is_listened, caption = caption, voice_note = voice_note }

   parseMessageLocation :: A.Value -> T.Parser MessageContent
   parseMessageLocation = A.withObject "MessageLocation" $ \o -> do
    expires_in <- optional $ o A..: "expires_in"
    live_period <- optional $ o A..: "live_period"
    location <- optional $ o A..: "location"
    return $ MessageLocation { expires_in = expires_in, live_period = live_period, location = location }

   parseMessageVenue :: A.Value -> T.Parser MessageContent
   parseMessageVenue = A.withObject "MessageVenue" $ \o -> do
    venue <- optional $ o A..: "venue"
    return $ MessageVenue { venue = venue }

   parseMessageContact :: A.Value -> T.Parser MessageContent
   parseMessageContact = A.withObject "MessageContact" $ \o -> do
    contact <- optional $ o A..: "contact"
    return $ MessageContact { contact = contact }

   parseMessageDice :: A.Value -> T.Parser MessageContent
   parseMessageDice = A.withObject "MessageDice" $ \o -> do
    value <- optional $ o A..: "value"
    return $ MessageDice { value = value }

   parseMessageGame :: A.Value -> T.Parser MessageContent
   parseMessageGame = A.withObject "MessageGame" $ \o -> do
    game <- optional $ o A..: "game"
    return $ MessageGame { game = game }

   parseMessagePoll :: A.Value -> T.Parser MessageContent
   parseMessagePoll = A.withObject "MessagePoll" $ \o -> do
    poll <- optional $ o A..: "poll"
    return $ MessagePoll { poll = poll }

   parseMessageInvoice :: A.Value -> T.Parser MessageContent
   parseMessageInvoice = A.withObject "MessageInvoice" $ \o -> do
    receipt_message_id <- optional $ o A..: "receipt_message_id"
    need_shipping_address <- optional $ o A..: "need_shipping_address"
    is_test <- optional $ o A..: "is_test"
    start_parameter <- optional $ o A..: "start_parameter"
    total_amount <- optional $ o A..: "total_amount"
    currency <- optional $ o A..: "currency"
    photo <- optional $ o A..: "photo"
    description <- optional $ o A..: "description"
    title <- optional $ o A..: "title"
    return $ MessageInvoice { receipt_message_id = receipt_message_id, need_shipping_address = need_shipping_address, is_test = is_test, start_parameter = start_parameter, total_amount = total_amount, currency = currency, photo = photo, description = description, title = title }

   parseMessageCall :: A.Value -> T.Parser MessageContent
   parseMessageCall = A.withObject "MessageCall" $ \o -> do
    duration <- optional $ o A..: "duration"
    discard_reason <- optional $ o A..: "discard_reason"
    return $ MessageCall { duration = duration, discard_reason = discard_reason }

   parseMessageBasicGroupChatCreate :: A.Value -> T.Parser MessageContent
   parseMessageBasicGroupChatCreate = A.withObject "MessageBasicGroupChatCreate" $ \o -> do
    member_user_ids <- optional $ o A..: "member_user_ids"
    title <- optional $ o A..: "title"
    return $ MessageBasicGroupChatCreate { member_user_ids = member_user_ids, title = title }

   parseMessageSupergroupChatCreate :: A.Value -> T.Parser MessageContent
   parseMessageSupergroupChatCreate = A.withObject "MessageSupergroupChatCreate" $ \o -> do
    title <- optional $ o A..: "title"
    return $ MessageSupergroupChatCreate { title = title }

   parseMessageChatChangeTitle :: A.Value -> T.Parser MessageContent
   parseMessageChatChangeTitle = A.withObject "MessageChatChangeTitle" $ \o -> do
    title <- optional $ o A..: "title"
    return $ MessageChatChangeTitle { title = title }

   parseMessageChatChangePhoto :: A.Value -> T.Parser MessageContent
   parseMessageChatChangePhoto = A.withObject "MessageChatChangePhoto" $ \o -> do
    photo <- optional $ o A..: "photo"
    return $ MessageChatChangePhoto { photo = photo }

   parseMessageChatDeletePhoto :: A.Value -> T.Parser MessageContent
   parseMessageChatDeletePhoto = A.withObject "MessageChatDeletePhoto" $ \o -> do
    return $ MessageChatDeletePhoto {  }

   parseMessageChatAddMembers :: A.Value -> T.Parser MessageContent
   parseMessageChatAddMembers = A.withObject "MessageChatAddMembers" $ \o -> do
    member_user_ids <- optional $ o A..: "member_user_ids"
    return $ MessageChatAddMembers { member_user_ids = member_user_ids }

   parseMessageChatJoinByLink :: A.Value -> T.Parser MessageContent
   parseMessageChatJoinByLink = A.withObject "MessageChatJoinByLink" $ \o -> do
    return $ MessageChatJoinByLink {  }

   parseMessageChatDeleteMember :: A.Value -> T.Parser MessageContent
   parseMessageChatDeleteMember = A.withObject "MessageChatDeleteMember" $ \o -> do
    user_id <- optional $ o A..: "user_id"
    return $ MessageChatDeleteMember { user_id = user_id }

   parseMessageChatUpgradeTo :: A.Value -> T.Parser MessageContent
   parseMessageChatUpgradeTo = A.withObject "MessageChatUpgradeTo" $ \o -> do
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ MessageChatUpgradeTo { supergroup_id = supergroup_id }

   parseMessageChatUpgradeFrom :: A.Value -> T.Parser MessageContent
   parseMessageChatUpgradeFrom = A.withObject "MessageChatUpgradeFrom" $ \o -> do
    basic_group_id <- optional $ o A..: "basic_group_id"
    title <- optional $ o A..: "title"
    return $ MessageChatUpgradeFrom { basic_group_id = basic_group_id, title = title }

   parseMessagePinMessage :: A.Value -> T.Parser MessageContent
   parseMessagePinMessage = A.withObject "MessagePinMessage" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    return $ MessagePinMessage { message_id = message_id }

   parseMessageScreenshotTaken :: A.Value -> T.Parser MessageContent
   parseMessageScreenshotTaken = A.withObject "MessageScreenshotTaken" $ \o -> do
    return $ MessageScreenshotTaken {  }

   parseMessageChatSetTtl :: A.Value -> T.Parser MessageContent
   parseMessageChatSetTtl = A.withObject "MessageChatSetTtl" $ \o -> do
    ttl <- optional $ o A..: "ttl"
    return $ MessageChatSetTtl { ttl = ttl }

   parseMessageCustomServiceAction :: A.Value -> T.Parser MessageContent
   parseMessageCustomServiceAction = A.withObject "MessageCustomServiceAction" $ \o -> do
    text <- optional $ o A..: "text"
    return $ MessageCustomServiceAction { text = text }

   parseMessageGameScore :: A.Value -> T.Parser MessageContent
   parseMessageGameScore = A.withObject "MessageGameScore" $ \o -> do
    score <- optional $ o A..: "score"
    game_id <- optional $ o A..: "game_id"
    game_message_id <- optional $ o A..: "game_message_id"
    return $ MessageGameScore { score = score, game_id = game_id, game_message_id = game_message_id }

   parseMessagePaymentSuccessful :: A.Value -> T.Parser MessageContent
   parseMessagePaymentSuccessful = A.withObject "MessagePaymentSuccessful" $ \o -> do
    total_amount <- optional $ o A..: "total_amount"
    currency <- optional $ o A..: "currency"
    invoice_message_id <- optional $ o A..: "invoice_message_id"
    return $ MessagePaymentSuccessful { total_amount = total_amount, currency = currency, invoice_message_id = invoice_message_id }

   parseMessagePaymentSuccessfulBot :: A.Value -> T.Parser MessageContent
   parseMessagePaymentSuccessfulBot = A.withObject "MessagePaymentSuccessfulBot" $ \o -> do
    provider_payment_charge_id <- optional $ o A..: "provider_payment_charge_id"
    telegram_payment_charge_id <- optional $ o A..: "telegram_payment_charge_id"
    order_info <- optional $ o A..: "order_info"
    shipping_option_id <- optional $ o A..: "shipping_option_id"
    invoice_payload <- optional $ o A..: "invoice_payload"
    total_amount <- optional $ o A..: "total_amount"
    currency <- optional $ o A..: "currency"
    invoice_message_id <- optional $ o A..: "invoice_message_id"
    return $ MessagePaymentSuccessfulBot { provider_payment_charge_id = provider_payment_charge_id, telegram_payment_charge_id = telegram_payment_charge_id, order_info = order_info, shipping_option_id = shipping_option_id, invoice_payload = invoice_payload, total_amount = total_amount, currency = currency, invoice_message_id = invoice_message_id }

   parseMessageContactRegistered :: A.Value -> T.Parser MessageContent
   parseMessageContactRegistered = A.withObject "MessageContactRegistered" $ \o -> do
    return $ MessageContactRegistered {  }

   parseMessageWebsiteConnected :: A.Value -> T.Parser MessageContent
   parseMessageWebsiteConnected = A.withObject "MessageWebsiteConnected" $ \o -> do
    domain_name <- optional $ o A..: "domain_name"
    return $ MessageWebsiteConnected { domain_name = domain_name }

   parseMessagePassportDataSent :: A.Value -> T.Parser MessageContent
   parseMessagePassportDataSent = A.withObject "MessagePassportDataSent" $ \o -> do
    types <- optional $ o A..: "types"
    return $ MessagePassportDataSent { types = types }

   parseMessagePassportDataReceived :: A.Value -> T.Parser MessageContent
   parseMessagePassportDataReceived = A.withObject "MessagePassportDataReceived" $ \o -> do
    credentials <- optional $ o A..: "credentials"
    elements <- optional $ o A..: "elements"
    return $ MessagePassportDataReceived { credentials = credentials, elements = elements }

   parseMessageUnsupported :: A.Value -> T.Parser MessageContent
   parseMessageUnsupported = A.withObject "MessageUnsupported" $ \o -> do
    return $ MessageUnsupported {  }