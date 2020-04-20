-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PushMessageContent where

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

--main = putStrLn "ok"

data PushMessageContent = 
 PushMessageContentHidden { is_pinned :: Bool }  
 | PushMessageContentAnimation { is_pinned :: Bool, caption :: String, animation :: Animation.Animation }  
 | PushMessageContentAudio { is_pinned :: Bool, audio :: Audio.Audio }  
 | PushMessageContentContact { is_pinned :: Bool, name :: String }  
 | PushMessageContentContactRegistered 
 | PushMessageContentDocument { is_pinned :: Bool, document :: Document.Document }  
 | PushMessageContentGame { is_pinned :: Bool, title :: String }  
 | PushMessageContentGameScore { is_pinned :: Bool, score :: Int, title :: String }  
 | PushMessageContentInvoice { is_pinned :: Bool, price :: String }  
 | PushMessageContentLocation { is_pinned :: Bool, is_live :: Bool }  
 | PushMessageContentPhoto { is_pinned :: Bool, is_secret :: Bool, caption :: String, photo :: Photo.Photo }  
 | PushMessageContentPoll { is_pinned :: Bool, is_regular :: Bool, question :: String }  
 | PushMessageContentScreenshotTaken 
 | PushMessageContentSticker { is_pinned :: Bool, emoji :: String, sticker :: Sticker.Sticker }  
 | PushMessageContentText { is_pinned :: Bool, text :: String }  
 | PushMessageContentVideo { is_pinned :: Bool, is_secret :: Bool, caption :: String, video :: Video.Video }  
 | PushMessageContentVideoNote { is_pinned :: Bool, video_note :: VideoNote.VideoNote }  
 | PushMessageContentVoiceNote { is_pinned :: Bool, voice_note :: VoiceNote.VoiceNote }  
 | PushMessageContentBasicGroupChatCreate 
 | PushMessageContentChatAddMembers { is_returned :: Bool, is_current_user :: Bool, member_name :: String }  
 | PushMessageContentChatChangePhoto 
 | PushMessageContentChatChangeTitle { title :: String }  
 | PushMessageContentChatDeleteMember { is_left :: Bool, is_current_user :: Bool, member_name :: String }  
 | PushMessageContentChatJoinByLink 
 | PushMessageContentMessageForwards { total_count :: Int }  
 | PushMessageContentMediaAlbum { has_videos :: Bool, has_photos :: Bool, total_count :: Int }  -- deriving (Show)

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
-- pushMessageContentHidden PushMessageContent  { is_pinned :: Bool } 

-- pushMessageContentAnimation PushMessageContent  { is_pinned :: Bool, caption :: String, animation :: Animation.Animation } 

-- pushMessageContentAudio PushMessageContent  { is_pinned :: Bool, audio :: Audio.Audio } 

-- pushMessageContentContact PushMessageContent  { is_pinned :: Bool, name :: String } 

-- pushMessageContentContactRegistered PushMessageContent 

-- pushMessageContentDocument PushMessageContent  { is_pinned :: Bool, document :: Document.Document } 

-- pushMessageContentGame PushMessageContent  { is_pinned :: Bool, title :: String } 

-- pushMessageContentGameScore PushMessageContent  { is_pinned :: Bool, score :: Int, title :: String } 

-- pushMessageContentInvoice PushMessageContent  { is_pinned :: Bool, price :: String } 

-- pushMessageContentLocation PushMessageContent  { is_pinned :: Bool, is_live :: Bool } 

-- pushMessageContentPhoto PushMessageContent  { is_pinned :: Bool, is_secret :: Bool, caption :: String, photo :: Photo.Photo } 

-- pushMessageContentPoll PushMessageContent  { is_pinned :: Bool, is_regular :: Bool, question :: String } 

-- pushMessageContentScreenshotTaken PushMessageContent 

-- pushMessageContentSticker PushMessageContent  { is_pinned :: Bool, emoji :: String, sticker :: Sticker.Sticker } 

-- pushMessageContentText PushMessageContent  { is_pinned :: Bool, text :: String } 

-- pushMessageContentVideo PushMessageContent  { is_pinned :: Bool, is_secret :: Bool, caption :: String, video :: Video.Video } 

-- pushMessageContentVideoNote PushMessageContent  { is_pinned :: Bool, video_note :: VideoNote.VideoNote } 

-- pushMessageContentVoiceNote PushMessageContent  { is_pinned :: Bool, voice_note :: VoiceNote.VoiceNote } 

-- pushMessageContentBasicGroupChatCreate PushMessageContent 

-- pushMessageContentChatAddMembers PushMessageContent  { is_returned :: Bool, is_current_user :: Bool, member_name :: String } 

-- pushMessageContentChatChangePhoto PushMessageContent 

-- pushMessageContentChatChangeTitle PushMessageContent  { title :: String } 

-- pushMessageContentChatDeleteMember PushMessageContent  { is_left :: Bool, is_current_user :: Bool, member_name :: String } 

-- pushMessageContentChatJoinByLink PushMessageContent 

-- pushMessageContentMessageForwards PushMessageContent  { total_count :: Int } 

-- pushMessageContentMediaAlbum PushMessageContent  { has_videos :: Bool, has_photos :: Bool, total_count :: Int } 

