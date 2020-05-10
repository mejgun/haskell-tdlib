-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PushMessageContent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Document as Document
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VideoNote as VideoNote
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote

-- |
-- 
-- Contains content of a push message notification
data PushMessageContent = 
 -- |
 -- 
 -- A general message with hidden content 
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentHidden { is_pinned :: Maybe Bool }  |
 -- |
 -- 
 -- An animation message (GIF-style). 
 -- 
 -- __animation__ Message content; may be null
 -- 
 -- __caption__ Animation caption
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentAnimation { is_pinned :: Maybe Bool, caption :: Maybe String, animation :: Maybe Animation.Animation }  |
 -- |
 -- 
 -- An audio message 
 -- 
 -- __audio__ Message content; may be null
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentAudio { is_pinned :: Maybe Bool, audio :: Maybe Audio.Audio }  |
 -- |
 -- 
 -- A message with a user contact 
 -- 
 -- __name__ Contact's name
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentContact { is_pinned :: Maybe Bool, name :: Maybe String }  |
 -- |
 -- 
 -- A contact has registered with Telegram
 PushMessageContentContactRegistered |
 -- |
 -- 
 -- A document message (a general file) 
 -- 
 -- __document__ Message content; may be null
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentDocument { is_pinned :: Maybe Bool, document :: Maybe Document.Document }  |
 -- |
 -- 
 -- A message with a game 
 -- 
 -- __title__ Game title, empty for pinned game message
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentGame { is_pinned :: Maybe Bool, title :: Maybe String }  |
 -- |
 -- 
 -- A new high score was achieved in a game 
 -- 
 -- __title__ Game title, empty for pinned message
 -- 
 -- __score__ New score, 0 for pinned message
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentGameScore { is_pinned :: Maybe Bool, score :: Maybe Int, title :: Maybe String }  |
 -- |
 -- 
 -- A message with an invoice from a bot 
 -- 
 -- __price__ Product price
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentInvoice { is_pinned :: Maybe Bool, price :: Maybe String }  |
 -- |
 -- 
 -- A message with a location 
 -- 
 -- __is_live__ True, if the location is live
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentLocation { is_pinned :: Maybe Bool, is_live :: Maybe Bool }  |
 -- |
 -- 
 -- A photo message 
 -- 
 -- __photo__ Message content; may be null
 -- 
 -- __caption__ Photo caption
 -- 
 -- __is_secret__ True, if the photo is secret
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentPhoto { is_pinned :: Maybe Bool, is_secret :: Maybe Bool, caption :: Maybe String, photo :: Maybe Photo.Photo }  |
 -- |
 -- 
 -- A message with a poll 
 -- 
 -- __question__ Poll question
 -- 
 -- __is_regular__ True, if the poll is regular and not in quiz mode
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentPoll { is_pinned :: Maybe Bool, is_regular :: Maybe Bool, question :: Maybe String }  |
 -- |
 -- 
 -- A screenshot of a message in the chat has been taken
 PushMessageContentScreenshotTaken |
 -- |
 -- 
 -- A message with a sticker 
 -- 
 -- __sticker__ Message content; may be null
 -- 
 -- __emoji__ Emoji corresponding to the sticker; may be empty
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentSticker { is_pinned :: Maybe Bool, emoji :: Maybe String, sticker :: Maybe Sticker.Sticker }  |
 -- |
 -- 
 -- A text message 
 -- 
 -- __text__ Message text
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentText { is_pinned :: Maybe Bool, text :: Maybe String }  |
 -- |
 -- 
 -- A video message 
 -- 
 -- __video__ Message content; may be null
 -- 
 -- __caption__ Video caption
 -- 
 -- __is_secret__ True, if the video is secret
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentVideo { is_pinned :: Maybe Bool, is_secret :: Maybe Bool, caption :: Maybe String, video :: Maybe Video.Video }  |
 -- |
 -- 
 -- A video note message 
 -- 
 -- __video_note__ Message content; may be null
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentVideoNote { is_pinned :: Maybe Bool, video_note :: Maybe VideoNote.VideoNote }  |
 -- |
 -- 
 -- A voice note message 
 -- 
 -- __voice_note__ Message content; may be null
 -- 
 -- __is_pinned__ True, if the message is a pinned message with the specified content
 PushMessageContentVoiceNote { is_pinned :: Maybe Bool, voice_note :: Maybe VoiceNote.VoiceNote }  |
 -- |
 -- 
 -- A newly created basic group
 PushMessageContentBasicGroupChatCreate |
 -- |
 -- 
 -- New chat members were invited to a group 
 -- 
 -- __member_name__ Name of the added member
 -- 
 -- __is_current_user__ True, if the current user was added to the group
 -- 
 -- __is_returned__ True, if the user has returned to the group themself
 PushMessageContentChatAddMembers { is_returned :: Maybe Bool, is_current_user :: Maybe Bool, member_name :: Maybe String }  |
 -- |
 -- 
 -- A chat photo was edited
 PushMessageContentChatChangePhoto |
 -- |
 -- 
 -- A chat title was edited 
 -- 
 -- __title__ New chat title
 PushMessageContentChatChangeTitle { title :: Maybe String }  |
 -- |
 -- 
 -- A chat member was deleted 
 -- 
 -- __member_name__ Name of the deleted member
 -- 
 -- __is_current_user__ True, if the current user was deleted from the group
 -- 
 -- __is_left__ True, if the user has left the group themself
 PushMessageContentChatDeleteMember { is_left :: Maybe Bool, is_current_user :: Maybe Bool, member_name :: Maybe String }  |
 -- |
 -- 
 -- A new member joined the chat by invite link
 PushMessageContentChatJoinByLink |
 -- |
 -- 
 -- A forwarded messages 
 -- 
 -- __total_count__ Number of forwarded messages
 PushMessageContentMessageForwards { total_count :: Maybe Int }  |
 -- |
 -- 
 -- A media album 
 -- 
 -- __total_count__ Number of messages in the album
 -- 
 -- __has_photos__ True, if the album has at least one photo
 -- 
 -- __has_videos__ True, if the album has at least one video
 PushMessageContentMediaAlbum { has_videos :: Maybe Bool, has_photos :: Maybe Bool, total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON PushMessageContent where
 toJSON (PushMessageContentHidden { is_pinned = is_pinned }) =
  A.object [ "@type" A..= T.String "pushMessageContentHidden", "is_pinned" A..= is_pinned ]

 toJSON (PushMessageContentAnimation { is_pinned = is_pinned, caption = caption, animation = animation }) =
  A.object [ "@type" A..= T.String "pushMessageContentAnimation", "is_pinned" A..= is_pinned, "caption" A..= caption, "animation" A..= animation ]

 toJSON (PushMessageContentAudio { is_pinned = is_pinned, audio = audio }) =
  A.object [ "@type" A..= T.String "pushMessageContentAudio", "is_pinned" A..= is_pinned, "audio" A..= audio ]

 toJSON (PushMessageContentContact { is_pinned = is_pinned, name = name }) =
  A.object [ "@type" A..= T.String "pushMessageContentContact", "is_pinned" A..= is_pinned, "name" A..= name ]

 toJSON (PushMessageContentContactRegistered {  }) =
  A.object [ "@type" A..= T.String "pushMessageContentContactRegistered" ]

 toJSON (PushMessageContentDocument { is_pinned = is_pinned, document = document }) =
  A.object [ "@type" A..= T.String "pushMessageContentDocument", "is_pinned" A..= is_pinned, "document" A..= document ]

 toJSON (PushMessageContentGame { is_pinned = is_pinned, title = title }) =
  A.object [ "@type" A..= T.String "pushMessageContentGame", "is_pinned" A..= is_pinned, "title" A..= title ]

 toJSON (PushMessageContentGameScore { is_pinned = is_pinned, score = score, title = title }) =
  A.object [ "@type" A..= T.String "pushMessageContentGameScore", "is_pinned" A..= is_pinned, "score" A..= score, "title" A..= title ]

 toJSON (PushMessageContentInvoice { is_pinned = is_pinned, price = price }) =
  A.object [ "@type" A..= T.String "pushMessageContentInvoice", "is_pinned" A..= is_pinned, "price" A..= price ]

 toJSON (PushMessageContentLocation { is_pinned = is_pinned, is_live = is_live }) =
  A.object [ "@type" A..= T.String "pushMessageContentLocation", "is_pinned" A..= is_pinned, "is_live" A..= is_live ]

 toJSON (PushMessageContentPhoto { is_pinned = is_pinned, is_secret = is_secret, caption = caption, photo = photo }) =
  A.object [ "@type" A..= T.String "pushMessageContentPhoto", "is_pinned" A..= is_pinned, "is_secret" A..= is_secret, "caption" A..= caption, "photo" A..= photo ]

 toJSON (PushMessageContentPoll { is_pinned = is_pinned, is_regular = is_regular, question = question }) =
  A.object [ "@type" A..= T.String "pushMessageContentPoll", "is_pinned" A..= is_pinned, "is_regular" A..= is_regular, "question" A..= question ]

 toJSON (PushMessageContentScreenshotTaken {  }) =
  A.object [ "@type" A..= T.String "pushMessageContentScreenshotTaken" ]

 toJSON (PushMessageContentSticker { is_pinned = is_pinned, emoji = emoji, sticker = sticker }) =
  A.object [ "@type" A..= T.String "pushMessageContentSticker", "is_pinned" A..= is_pinned, "emoji" A..= emoji, "sticker" A..= sticker ]

 toJSON (PushMessageContentText { is_pinned = is_pinned, text = text }) =
  A.object [ "@type" A..= T.String "pushMessageContentText", "is_pinned" A..= is_pinned, "text" A..= text ]

 toJSON (PushMessageContentVideo { is_pinned = is_pinned, is_secret = is_secret, caption = caption, video = video }) =
  A.object [ "@type" A..= T.String "pushMessageContentVideo", "is_pinned" A..= is_pinned, "is_secret" A..= is_secret, "caption" A..= caption, "video" A..= video ]

 toJSON (PushMessageContentVideoNote { is_pinned = is_pinned, video_note = video_note }) =
  A.object [ "@type" A..= T.String "pushMessageContentVideoNote", "is_pinned" A..= is_pinned, "video_note" A..= video_note ]

 toJSON (PushMessageContentVoiceNote { is_pinned = is_pinned, voice_note = voice_note }) =
  A.object [ "@type" A..= T.String "pushMessageContentVoiceNote", "is_pinned" A..= is_pinned, "voice_note" A..= voice_note ]

 toJSON (PushMessageContentBasicGroupChatCreate {  }) =
  A.object [ "@type" A..= T.String "pushMessageContentBasicGroupChatCreate" ]

 toJSON (PushMessageContentChatAddMembers { is_returned = is_returned, is_current_user = is_current_user, member_name = member_name }) =
  A.object [ "@type" A..= T.String "pushMessageContentChatAddMembers", "is_returned" A..= is_returned, "is_current_user" A..= is_current_user, "member_name" A..= member_name ]

 toJSON (PushMessageContentChatChangePhoto {  }) =
  A.object [ "@type" A..= T.String "pushMessageContentChatChangePhoto" ]

 toJSON (PushMessageContentChatChangeTitle { title = title }) =
  A.object [ "@type" A..= T.String "pushMessageContentChatChangeTitle", "title" A..= title ]

 toJSON (PushMessageContentChatDeleteMember { is_left = is_left, is_current_user = is_current_user, member_name = member_name }) =
  A.object [ "@type" A..= T.String "pushMessageContentChatDeleteMember", "is_left" A..= is_left, "is_current_user" A..= is_current_user, "member_name" A..= member_name ]

 toJSON (PushMessageContentChatJoinByLink {  }) =
  A.object [ "@type" A..= T.String "pushMessageContentChatJoinByLink" ]

 toJSON (PushMessageContentMessageForwards { total_count = total_count }) =
  A.object [ "@type" A..= T.String "pushMessageContentMessageForwards", "total_count" A..= total_count ]

 toJSON (PushMessageContentMediaAlbum { has_videos = has_videos, has_photos = has_photos, total_count = total_count }) =
  A.object [ "@type" A..= T.String "pushMessageContentMediaAlbum", "has_videos" A..= has_videos, "has_photos" A..= has_photos, "total_count" A..= total_count ]

instance T.FromJSON PushMessageContent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pushMessageContentHidden" -> parsePushMessageContentHidden v
   "pushMessageContentAnimation" -> parsePushMessageContentAnimation v
   "pushMessageContentAudio" -> parsePushMessageContentAudio v
   "pushMessageContentContact" -> parsePushMessageContentContact v
   "pushMessageContentContactRegistered" -> parsePushMessageContentContactRegistered v
   "pushMessageContentDocument" -> parsePushMessageContentDocument v
   "pushMessageContentGame" -> parsePushMessageContentGame v
   "pushMessageContentGameScore" -> parsePushMessageContentGameScore v
   "pushMessageContentInvoice" -> parsePushMessageContentInvoice v
   "pushMessageContentLocation" -> parsePushMessageContentLocation v
   "pushMessageContentPhoto" -> parsePushMessageContentPhoto v
   "pushMessageContentPoll" -> parsePushMessageContentPoll v
   "pushMessageContentScreenshotTaken" -> parsePushMessageContentScreenshotTaken v
   "pushMessageContentSticker" -> parsePushMessageContentSticker v
   "pushMessageContentText" -> parsePushMessageContentText v
   "pushMessageContentVideo" -> parsePushMessageContentVideo v
   "pushMessageContentVideoNote" -> parsePushMessageContentVideoNote v
   "pushMessageContentVoiceNote" -> parsePushMessageContentVoiceNote v
   "pushMessageContentBasicGroupChatCreate" -> parsePushMessageContentBasicGroupChatCreate v
   "pushMessageContentChatAddMembers" -> parsePushMessageContentChatAddMembers v
   "pushMessageContentChatChangePhoto" -> parsePushMessageContentChatChangePhoto v
   "pushMessageContentChatChangeTitle" -> parsePushMessageContentChatChangeTitle v
   "pushMessageContentChatDeleteMember" -> parsePushMessageContentChatDeleteMember v
   "pushMessageContentChatJoinByLink" -> parsePushMessageContentChatJoinByLink v
   "pushMessageContentMessageForwards" -> parsePushMessageContentMessageForwards v
   "pushMessageContentMediaAlbum" -> parsePushMessageContentMediaAlbum v
   _ -> mempty
  where
   parsePushMessageContentHidden :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentHidden = A.withObject "PushMessageContentHidden" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    return $ PushMessageContentHidden { is_pinned = is_pinned }

   parsePushMessageContentAnimation :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentAnimation = A.withObject "PushMessageContentAnimation" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    caption <- o A..:? "caption"
    animation <- o A..:? "animation"
    return $ PushMessageContentAnimation { is_pinned = is_pinned, caption = caption, animation = animation }

   parsePushMessageContentAudio :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentAudio = A.withObject "PushMessageContentAudio" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    audio <- o A..:? "audio"
    return $ PushMessageContentAudio { is_pinned = is_pinned, audio = audio }

   parsePushMessageContentContact :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentContact = A.withObject "PushMessageContentContact" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    name <- o A..:? "name"
    return $ PushMessageContentContact { is_pinned = is_pinned, name = name }

   parsePushMessageContentContactRegistered :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentContactRegistered = A.withObject "PushMessageContentContactRegistered" $ \o -> do
    return $ PushMessageContentContactRegistered {  }

   parsePushMessageContentDocument :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentDocument = A.withObject "PushMessageContentDocument" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    document <- o A..:? "document"
    return $ PushMessageContentDocument { is_pinned = is_pinned, document = document }

   parsePushMessageContentGame :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentGame = A.withObject "PushMessageContentGame" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    title <- o A..:? "title"
    return $ PushMessageContentGame { is_pinned = is_pinned, title = title }

   parsePushMessageContentGameScore :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentGameScore = A.withObject "PushMessageContentGameScore" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    score <- mconcat [ o A..:? "score", readMaybe <$> (o A..: "score" :: T.Parser String)] :: T.Parser (Maybe Int)
    title <- o A..:? "title"
    return $ PushMessageContentGameScore { is_pinned = is_pinned, score = score, title = title }

   parsePushMessageContentInvoice :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentInvoice = A.withObject "PushMessageContentInvoice" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    price <- o A..:? "price"
    return $ PushMessageContentInvoice { is_pinned = is_pinned, price = price }

   parsePushMessageContentLocation :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentLocation = A.withObject "PushMessageContentLocation" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    is_live <- o A..:? "is_live"
    return $ PushMessageContentLocation { is_pinned = is_pinned, is_live = is_live }

   parsePushMessageContentPhoto :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentPhoto = A.withObject "PushMessageContentPhoto" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    is_secret <- o A..:? "is_secret"
    caption <- o A..:? "caption"
    photo <- o A..:? "photo"
    return $ PushMessageContentPhoto { is_pinned = is_pinned, is_secret = is_secret, caption = caption, photo = photo }

   parsePushMessageContentPoll :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentPoll = A.withObject "PushMessageContentPoll" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    is_regular <- o A..:? "is_regular"
    question <- o A..:? "question"
    return $ PushMessageContentPoll { is_pinned = is_pinned, is_regular = is_regular, question = question }

   parsePushMessageContentScreenshotTaken :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentScreenshotTaken = A.withObject "PushMessageContentScreenshotTaken" $ \o -> do
    return $ PushMessageContentScreenshotTaken {  }

   parsePushMessageContentSticker :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentSticker = A.withObject "PushMessageContentSticker" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    emoji <- o A..:? "emoji"
    sticker <- o A..:? "sticker"
    return $ PushMessageContentSticker { is_pinned = is_pinned, emoji = emoji, sticker = sticker }

   parsePushMessageContentText :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentText = A.withObject "PushMessageContentText" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    text <- o A..:? "text"
    return $ PushMessageContentText { is_pinned = is_pinned, text = text }

   parsePushMessageContentVideo :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentVideo = A.withObject "PushMessageContentVideo" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    is_secret <- o A..:? "is_secret"
    caption <- o A..:? "caption"
    video <- o A..:? "video"
    return $ PushMessageContentVideo { is_pinned = is_pinned, is_secret = is_secret, caption = caption, video = video }

   parsePushMessageContentVideoNote :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentVideoNote = A.withObject "PushMessageContentVideoNote" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    video_note <- o A..:? "video_note"
    return $ PushMessageContentVideoNote { is_pinned = is_pinned, video_note = video_note }

   parsePushMessageContentVoiceNote :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentVoiceNote = A.withObject "PushMessageContentVoiceNote" $ \o -> do
    is_pinned <- o A..:? "is_pinned"
    voice_note <- o A..:? "voice_note"
    return $ PushMessageContentVoiceNote { is_pinned = is_pinned, voice_note = voice_note }

   parsePushMessageContentBasicGroupChatCreate :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentBasicGroupChatCreate = A.withObject "PushMessageContentBasicGroupChatCreate" $ \o -> do
    return $ PushMessageContentBasicGroupChatCreate {  }

   parsePushMessageContentChatAddMembers :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentChatAddMembers = A.withObject "PushMessageContentChatAddMembers" $ \o -> do
    is_returned <- o A..:? "is_returned"
    is_current_user <- o A..:? "is_current_user"
    member_name <- o A..:? "member_name"
    return $ PushMessageContentChatAddMembers { is_returned = is_returned, is_current_user = is_current_user, member_name = member_name }

   parsePushMessageContentChatChangePhoto :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentChatChangePhoto = A.withObject "PushMessageContentChatChangePhoto" $ \o -> do
    return $ PushMessageContentChatChangePhoto {  }

   parsePushMessageContentChatChangeTitle :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentChatChangeTitle = A.withObject "PushMessageContentChatChangeTitle" $ \o -> do
    title <- o A..:? "title"
    return $ PushMessageContentChatChangeTitle { title = title }

   parsePushMessageContentChatDeleteMember :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentChatDeleteMember = A.withObject "PushMessageContentChatDeleteMember" $ \o -> do
    is_left <- o A..:? "is_left"
    is_current_user <- o A..:? "is_current_user"
    member_name <- o A..:? "member_name"
    return $ PushMessageContentChatDeleteMember { is_left = is_left, is_current_user = is_current_user, member_name = member_name }

   parsePushMessageContentChatJoinByLink :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentChatJoinByLink = A.withObject "PushMessageContentChatJoinByLink" $ \o -> do
    return $ PushMessageContentChatJoinByLink {  }

   parsePushMessageContentMessageForwards :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentMessageForwards = A.withObject "PushMessageContentMessageForwards" $ \o -> do
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PushMessageContentMessageForwards { total_count = total_count }

   parsePushMessageContentMediaAlbum :: A.Value -> T.Parser PushMessageContent
   parsePushMessageContentMediaAlbum = A.withObject "PushMessageContentMediaAlbum" $ \o -> do
    has_videos <- o A..:? "has_videos"
    has_photos <- o A..:? "has_photos"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PushMessageContentMediaAlbum { has_videos = has_videos, has_photos = has_photos, total_count = total_count }