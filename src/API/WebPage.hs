-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebPage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote
import {-# SOURCE #-} qualified API.VideoNote as VideoNote
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.Document as Document
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

data WebPage = 
 WebPage { instant_view_version :: Int, voice_note :: VoiceNote.VoiceNote, video_note :: VideoNote.VideoNote, video :: Video.Video, sticker :: Sticker.Sticker, document :: Document.Document, audio :: Audio.Audio, animation :: Animation.Animation, author :: String, duration :: Int, embed_height :: Int, embed_width :: Int, embed_type :: String, embed_url :: String, photo :: Photo.Photo, description :: FormattedText.FormattedText, title :: String, site_name :: String, _type :: String, display_url :: String, url :: String }  deriving (Show)

instance T.ToJSON WebPage where
 toJSON (WebPage { instant_view_version = instant_view_version, voice_note = voice_note, video_note = video_note, video = video, sticker = sticker, document = document, audio = audio, animation = animation, author = author, duration = duration, embed_height = embed_height, embed_width = embed_width, embed_type = embed_type, embed_url = embed_url, photo = photo, description = description, title = title, site_name = site_name, _type = _type, display_url = display_url, url = url }) =
  A.object [ "@type" A..= T.String "webPage", "instant_view_version" A..= instant_view_version, "voice_note" A..= voice_note, "video_note" A..= video_note, "video" A..= video, "sticker" A..= sticker, "document" A..= document, "audio" A..= audio, "animation" A..= animation, "author" A..= author, "duration" A..= duration, "embed_height" A..= embed_height, "embed_width" A..= embed_width, "embed_type" A..= embed_type, "embed_url" A..= embed_url, "photo" A..= photo, "description" A..= description, "title" A..= title, "site_name" A..= site_name, "type" A..= _type, "display_url" A..= display_url, "url" A..= url ]

instance T.FromJSON WebPage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "webPage" -> parseWebPage v
   _ -> mempty
  where
   parseWebPage :: A.Value -> T.Parser WebPage
   parseWebPage = A.withObject "WebPage" $ \o -> do
    instant_view_version <- o A..: "instant_view_version"
    voice_note <- o A..: "voice_note"
    video_note <- o A..: "video_note"
    video <- o A..: "video"
    sticker <- o A..: "sticker"
    document <- o A..: "document"
    audio <- o A..: "audio"
    animation <- o A..: "animation"
    author <- o A..: "author"
    duration <- o A..: "duration"
    embed_height <- o A..: "embed_height"
    embed_width <- o A..: "embed_width"
    embed_type <- o A..: "embed_type"
    embed_url <- o A..: "embed_url"
    photo <- o A..: "photo"
    description <- o A..: "description"
    title <- o A..: "title"
    site_name <- o A..: "site_name"
    _type <- o A..: "type"
    display_url <- o A..: "display_url"
    url <- o A..: "url"
    return $ WebPage { instant_view_version = instant_view_version, voice_note = voice_note, video_note = video_note, video = video, sticker = sticker, document = document, audio = audio, animation = animation, author = author, duration = duration, embed_height = embed_height, embed_width = embed_width, embed_type = embed_type, embed_url = embed_url, photo = photo, description = description, title = title, site_name = site_name, _type = _type, display_url = display_url, url = url }