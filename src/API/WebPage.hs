-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.WebPage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote
import {-# SOURCE #-} qualified API.VideoNote as VideoNote
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.Document as Document
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Describes a web page preview
-- 
-- __url__ Original URL of the link
-- 
-- __display_url__ URL to display
-- 
-- __type__ Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
-- 
-- __site_name__ Short name of the site (e.g., Google Docs, App Store)
-- 
-- __title__ Title of the content
-- 
-- __param_description__ Description of the content
-- 
-- __photo__ Image representing the content; may be null
-- 
-- __embed_url__ URL to show in the embedded preview
-- 
-- __embed_type__ MIME type of the embedded preview, (e.g., text/html or video/mp4)
-- 
-- __embed_width__ Width of the embedded preview
-- 
-- __embed_height__ Height of the embedded preview
-- 
-- __duration__ Duration of the content, in seconds
-- 
-- __author__ Author of the content
-- 
-- __animation__ Preview of the content as an animation, if available; may be null
-- 
-- __audio__ Preview of the content as an audio file, if available; may be null
-- 
-- __document__ Preview of the content as a document, if available; may be null
-- 
-- __sticker__ Preview of the content as a sticker for small WEBP files, if available; may be null
-- 
-- __video__ Preview of the content as a video, if available; may be null
-- 
-- __video_note__ Preview of the content as a video note, if available; may be null
-- 
-- __voice_note__ Preview of the content as a voice note, if available; may be null
-- 
-- __instant_view_version__ Version of instant view, available for the web page (currently, can be 1 or 2), 0 if none
data WebPage = 

 WebPage { instant_view_version :: Maybe Int, voice_note :: Maybe VoiceNote.VoiceNote, video_note :: Maybe VideoNote.VideoNote, video :: Maybe Video.Video, sticker :: Maybe Sticker.Sticker, document :: Maybe Document.Document, audio :: Maybe Audio.Audio, animation :: Maybe Animation.Animation, author :: Maybe String, duration :: Maybe Int, embed_height :: Maybe Int, embed_width :: Maybe Int, embed_type :: Maybe String, embed_url :: Maybe String, photo :: Maybe Photo.Photo, description :: Maybe FormattedText.FormattedText, title :: Maybe String, site_name :: Maybe String, _type :: Maybe String, display_url :: Maybe String, url :: Maybe String }  deriving (Eq)

instance Show WebPage where
 show WebPage { instant_view_version=instant_view_version, voice_note=voice_note, video_note=video_note, video=video, sticker=sticker, document=document, audio=audio, animation=animation, author=author, duration=duration, embed_height=embed_height, embed_width=embed_width, embed_type=embed_type, embed_url=embed_url, photo=photo, description=description, title=title, site_name=site_name, _type=_type, display_url=display_url, url=url } =
  "WebPage" ++ cc [p "instant_view_version" instant_view_version, p "voice_note" voice_note, p "video_note" video_note, p "video" video, p "sticker" sticker, p "document" document, p "audio" audio, p "animation" animation, p "author" author, p "duration" duration, p "embed_height" embed_height, p "embed_width" embed_width, p "embed_type" embed_type, p "embed_url" embed_url, p "photo" photo, p "description" description, p "title" title, p "site_name" site_name, p "_type" _type, p "display_url" display_url, p "url" url ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON WebPage where
 toJSON WebPage { instant_view_version = instant_view_version, voice_note = voice_note, video_note = video_note, video = video, sticker = sticker, document = document, audio = audio, animation = animation, author = author, duration = duration, embed_height = embed_height, embed_width = embed_width, embed_type = embed_type, embed_url = embed_url, photo = photo, description = description, title = title, site_name = site_name, _type = _type, display_url = display_url, url = url } =
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
    instant_view_version <- mconcat [ o A..:? "instant_view_version", readMaybe <$> (o A..: "instant_view_version" :: T.Parser String)] :: T.Parser (Maybe Int)
    voice_note <- o A..:? "voice_note"
    video_note <- o A..:? "video_note"
    video <- o A..:? "video"
    sticker <- o A..:? "sticker"
    document <- o A..:? "document"
    audio <- o A..:? "audio"
    animation <- o A..:? "animation"
    author <- o A..:? "author"
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    embed_height <- mconcat [ o A..:? "embed_height", readMaybe <$> (o A..: "embed_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    embed_width <- mconcat [ o A..:? "embed_width", readMaybe <$> (o A..: "embed_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    embed_type <- o A..:? "embed_type"
    embed_url <- o A..:? "embed_url"
    photo <- o A..:? "photo"
    description <- o A..:? "description"
    title <- o A..:? "title"
    site_name <- o A..:? "site_name"
    _type <- o A..:? "type"
    display_url <- o A..:? "display_url"
    url <- o A..:? "url"
    return $ WebPage { instant_view_version = instant_view_version, voice_note = voice_note, video_note = video_note, video = video, sticker = sticker, document = document, audio = audio, animation = animation, author = author, duration = duration, embed_height = embed_height, embed_width = embed_width, embed_type = embed_type, embed_url = embed_url, photo = photo, description = description, title = title, site_name = site_name, _type = _type, display_url = display_url, url = url }
 parseJSON _ = mempty
