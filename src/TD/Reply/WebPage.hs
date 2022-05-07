{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.WebPage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Animation as Animation
import qualified TD.Reply.Audio as Audio
import qualified TD.Reply.Document as Document
import qualified TD.Reply.FormattedText as FormattedText
import qualified TD.Reply.Photo as Photo
import qualified TD.Reply.Sticker as Sticker
import qualified TD.Reply.Video as Video
import qualified TD.Reply.VideoNote as VideoNote
import qualified TD.Reply.VoiceNote as VoiceNote
import qualified Utils as U

data WebPage = -- | Describes a web page preview
  WebPage
  { -- | Version of instant view, available for the web page (currently, can be 1 or 2), 0 if none
    instant_view_version :: Maybe Int,
    -- | Preview of the content as a voice note, if available; may be null
    voice_note :: Maybe VoiceNote.VoiceNote,
    -- | Preview of the content as a video note, if available; may be null
    video_note :: Maybe VideoNote.VideoNote,
    -- | Preview of the content as a video, if available; may be null
    video :: Maybe Video.Video,
    -- | Preview of the content as a sticker for small WEBP files, if available; may be null
    sticker :: Maybe Sticker.Sticker,
    -- | Preview of the content as a document, if available; may be null
    document :: Maybe Document.Document,
    -- | Preview of the content as an audio file, if available; may be null
    audio :: Maybe Audio.Audio,
    -- | Preview of the content as an animation, if available; may be null
    animation :: Maybe Animation.Animation,
    -- | Author of the content
    author :: Maybe String,
    -- | Duration of the content, in seconds
    duration :: Maybe Int,
    -- | Height of the embedded preview
    embed_height :: Maybe Int,
    -- | Width of the embedded preview
    embed_width :: Maybe Int,
    -- | MIME type of the embedded preview, (e.g., text/html or video/mp4)
    embed_type :: Maybe String,
    -- | URL to show in the embedded preview
    embed_url :: Maybe String,
    -- | Image representing the content; may be null
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe FormattedText.FormattedText,
    -- | Title of the content
    title :: Maybe String,
    -- | Short name of the site (e.g., Google Docs, App Store)
    site_name :: Maybe String,
    -- | Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
    _type :: Maybe String,
    -- | URL to display
    display_url :: Maybe String,
    -- | Original URL of the link
    url :: Maybe String
  }
  deriving (Eq)

instance Show WebPage where
  show
    WebPage
      { instant_view_version = instant_view_version,
        voice_note = voice_note,
        video_note = video_note,
        video = video,
        sticker = sticker,
        document = document,
        audio = audio,
        animation = animation,
        author = author,
        duration = duration,
        embed_height = embed_height,
        embed_width = embed_width,
        embed_type = embed_type,
        embed_url = embed_url,
        photo = photo,
        description = description,
        title = title,
        site_name = site_name,
        _type = _type,
        display_url = display_url,
        url = url
      } =
      "WebPage"
        ++ U.cc
          [ U.p "instant_view_version" instant_view_version,
            U.p "voice_note" voice_note,
            U.p "video_note" video_note,
            U.p "video" video,
            U.p "sticker" sticker,
            U.p "document" document,
            U.p "audio" audio,
            U.p "animation" animation,
            U.p "author" author,
            U.p "duration" duration,
            U.p "embed_height" embed_height,
            U.p "embed_width" embed_width,
            U.p "embed_type" embed_type,
            U.p "embed_url" embed_url,
            U.p "photo" photo,
            U.p "description" description,
            U.p "title" title,
            U.p "site_name" site_name,
            U.p "_type" _type,
            U.p "display_url" display_url,
            U.p "url" url
          ]

instance T.FromJSON WebPage where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "webPage" -> parseWebPage v
      _ -> fail ""
    where
      parseWebPage :: A.Value -> T.Parser WebPage
      parseWebPage = A.withObject "WebPage" $ \o -> do
        instant_view_version_ <- mconcat [o A..:? "instant_view_version", U.rm <$> (o A..: "instant_view_version" :: T.Parser String)] :: T.Parser (Maybe Int)
        voice_note_ <- o A..:? "voice_note"
        video_note_ <- o A..:? "video_note"
        video_ <- o A..:? "video"
        sticker_ <- o A..:? "sticker"
        document_ <- o A..:? "document"
        audio_ <- o A..:? "audio"
        animation_ <- o A..:? "animation"
        author_ <- o A..:? "author"
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        embed_height_ <- mconcat [o A..:? "embed_height", U.rm <$> (o A..: "embed_height" :: T.Parser String)] :: T.Parser (Maybe Int)
        embed_width_ <- mconcat [o A..:? "embed_width", U.rm <$> (o A..: "embed_width" :: T.Parser String)] :: T.Parser (Maybe Int)
        embed_type_ <- o A..:? "embed_type"
        embed_url_ <- o A..:? "embed_url"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        site_name_ <- o A..:? "site_name"
        _type_ <- o A..:? "type"
        display_url_ <- o A..:? "display_url"
        url_ <- o A..:? "url"
        return $ WebPage {instant_view_version = instant_view_version_, voice_note = voice_note_, video_note = video_note_, video = video_, sticker = sticker_, document = document_, audio = audio_, animation = animation_, author = author_, duration = duration_, embed_height = embed_height_, embed_width = embed_width_, embed_type = embed_type_, embed_url = embed_url_, photo = photo_, description = description_, title = title_, site_name = site_name_, _type = _type_, display_url = display_url_, url = url_}
  parseJSON _ = fail ""

instance T.ToJSON WebPage where
  toJSON
    WebPage
      { instant_view_version = instant_view_version,
        voice_note = voice_note,
        video_note = video_note,
        video = video,
        sticker = sticker,
        document = document,
        audio = audio,
        animation = animation,
        author = author,
        duration = duration,
        embed_height = embed_height,
        embed_width = embed_width,
        embed_type = embed_type,
        embed_url = embed_url,
        photo = photo,
        description = description,
        title = title,
        site_name = site_name,
        _type = _type,
        display_url = display_url,
        url = url
      } =
      A.object
        [ "@type" A..= T.String "webPage",
          "instant_view_version" A..= instant_view_version,
          "voice_note" A..= voice_note,
          "video_note" A..= video_note,
          "video" A..= video,
          "sticker" A..= sticker,
          "document" A..= document,
          "audio" A..= audio,
          "animation" A..= animation,
          "author" A..= author,
          "duration" A..= duration,
          "embed_height" A..= embed_height,
          "embed_width" A..= embed_width,
          "embed_type" A..= embed_type,
          "embed_url" A..= embed_url,
          "photo" A..= photo,
          "description" A..= description,
          "title" A..= title,
          "site_name" A..= site_name,
          "type" A..= _type,
          "display_url" A..= display_url,
          "url" A..= url
        ]
