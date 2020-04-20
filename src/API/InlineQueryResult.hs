-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineQueryResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Venue as Venue
import {-# SOURCE #-} qualified API.Game as Game
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Document as Document
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote

--main = putStrLn "ok"

data InlineQueryResult = 
 InlineQueryResultArticle { thumbnail :: PhotoSize.PhotoSize, description :: String, title :: String, hide_url :: Bool, url :: String, _id :: String }  
 | InlineQueryResultContact { thumbnail :: PhotoSize.PhotoSize, contact :: Contact.Contact, _id :: String }  
 | InlineQueryResultLocation { thumbnail :: PhotoSize.PhotoSize, title :: String, location :: Location.Location, _id :: String }  
 | InlineQueryResultVenue { thumbnail :: PhotoSize.PhotoSize, venue :: Venue.Venue, _id :: String }  
 | InlineQueryResultGame { game :: Game.Game, _id :: String }  
 | InlineQueryResultAnimation { title :: String, animation :: Animation.Animation, _id :: String }  
 | InlineQueryResultAudio { audio :: Audio.Audio, _id :: String }  
 | InlineQueryResultDocument { description :: String, title :: String, document :: Document.Document, _id :: String }  
 | InlineQueryResultPhoto { description :: String, title :: String, photo :: Photo.Photo, _id :: String }  
 | InlineQueryResultSticker { sticker :: Sticker.Sticker, _id :: String }  
 | InlineQueryResultVideo { description :: String, title :: String, video :: Video.Video, _id :: String }  
 | InlineQueryResultVoiceNote { title :: String, voice_note :: VoiceNote.VoiceNote, _id :: String }  -- deriving (Show)

instance T.ToJSON InlineQueryResult where
 toJSON (InlineQueryResultArticle { thumbnail = thumbnail, description = description, title = title, hide_url = hide_url, url = url, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultArticle", "thumbnail" A..= thumbnail, "description" A..= description, "title" A..= title, "hide_url" A..= hide_url, "url" A..= url, "id" A..= _id ]

 toJSON (InlineQueryResultContact { thumbnail = thumbnail, contact = contact, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultContact", "thumbnail" A..= thumbnail, "contact" A..= contact, "id" A..= _id ]

 toJSON (InlineQueryResultLocation { thumbnail = thumbnail, title = title, location = location, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultLocation", "thumbnail" A..= thumbnail, "title" A..= title, "location" A..= location, "id" A..= _id ]

 toJSON (InlineQueryResultVenue { thumbnail = thumbnail, venue = venue, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultVenue", "thumbnail" A..= thumbnail, "venue" A..= venue, "id" A..= _id ]

 toJSON (InlineQueryResultGame { game = game, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultGame", "game" A..= game, "id" A..= _id ]

 toJSON (InlineQueryResultAnimation { title = title, animation = animation, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultAnimation", "title" A..= title, "animation" A..= animation, "id" A..= _id ]

 toJSON (InlineQueryResultAudio { audio = audio, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultAudio", "audio" A..= audio, "id" A..= _id ]

 toJSON (InlineQueryResultDocument { description = description, title = title, document = document, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultDocument", "description" A..= description, "title" A..= title, "document" A..= document, "id" A..= _id ]

 toJSON (InlineQueryResultPhoto { description = description, title = title, photo = photo, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultPhoto", "description" A..= description, "title" A..= title, "photo" A..= photo, "id" A..= _id ]

 toJSON (InlineQueryResultSticker { sticker = sticker, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultSticker", "sticker" A..= sticker, "id" A..= _id ]

 toJSON (InlineQueryResultVideo { description = description, title = title, video = video, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultVideo", "description" A..= description, "title" A..= title, "video" A..= video, "id" A..= _id ]

 toJSON (InlineQueryResultVoiceNote { title = title, voice_note = voice_note, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultVoiceNote", "title" A..= title, "voice_note" A..= voice_note, "id" A..= _id ]
-- inlineQueryResultArticle InlineQueryResult  { thumbnail :: PhotoSize.PhotoSize, description :: String, title :: String, hide_url :: Bool, url :: String, _id :: String } 

-- inlineQueryResultContact InlineQueryResult  { thumbnail :: PhotoSize.PhotoSize, contact :: Contact.Contact, _id :: String } 

-- inlineQueryResultLocation InlineQueryResult  { thumbnail :: PhotoSize.PhotoSize, title :: String, location :: Location.Location, _id :: String } 

-- inlineQueryResultVenue InlineQueryResult  { thumbnail :: PhotoSize.PhotoSize, venue :: Venue.Venue, _id :: String } 

-- inlineQueryResultGame InlineQueryResult  { game :: Game.Game, _id :: String } 

-- inlineQueryResultAnimation InlineQueryResult  { title :: String, animation :: Animation.Animation, _id :: String } 

-- inlineQueryResultAudio InlineQueryResult  { audio :: Audio.Audio, _id :: String } 

-- inlineQueryResultDocument InlineQueryResult  { description :: String, title :: String, document :: Document.Document, _id :: String } 

-- inlineQueryResultPhoto InlineQueryResult  { description :: String, title :: String, photo :: Photo.Photo, _id :: String } 

-- inlineQueryResultSticker InlineQueryResult  { sticker :: Sticker.Sticker, _id :: String } 

-- inlineQueryResultVideo InlineQueryResult  { description :: String, title :: String, video :: Video.Video, _id :: String } 

-- inlineQueryResultVoiceNote InlineQueryResult  { title :: String, voice_note :: VoiceNote.VoiceNote, _id :: String } 

