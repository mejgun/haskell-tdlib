{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.WebPage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote
import qualified Utils as U

-- |
data WebPage = -- | Describes a web page preview
  WebPage
  { -- | Version of web page instant view (currently, can be 1 or 2); 0 if none
    instant_view_version :: Maybe Int,
    -- | The identifier of the previewed story; 0 if none
    story_id :: Maybe Int,
    -- | The identifier of the sender of the previewed story; 0 if none
    story_sender_chat_id :: Maybe Int,
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
      { instant_view_version = instant_view_version_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_,
        voice_note = voice_note_,
        video_note = video_note_,
        video = video_,
        sticker = sticker_,
        document = document_,
        audio = audio_,
        animation = animation_,
        author = author_,
        duration = duration_,
        embed_height = embed_height_,
        embed_width = embed_width_,
        embed_type = embed_type_,
        embed_url = embed_url_,
        photo = photo_,
        description = description_,
        title = title_,
        site_name = site_name_,
        _type = _type_,
        display_url = display_url_,
        url = url_
      } =
      "WebPage"
        ++ U.cc
          [ U.p "instant_view_version" instant_view_version_,
            U.p "story_id" story_id_,
            U.p "story_sender_chat_id" story_sender_chat_id_,
            U.p "voice_note" voice_note_,
            U.p "video_note" video_note_,
            U.p "video" video_,
            U.p "sticker" sticker_,
            U.p "document" document_,
            U.p "audio" audio_,
            U.p "animation" animation_,
            U.p "author" author_,
            U.p "duration" duration_,
            U.p "embed_height" embed_height_,
            U.p "embed_width" embed_width_,
            U.p "embed_type" embed_type_,
            U.p "embed_url" embed_url_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "site_name" site_name_,
            U.p "_type" _type_,
            U.p "display_url" display_url_,
            U.p "url" url_
          ]

instance T.FromJSON WebPage where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "webPage" -> parseWebPage v
      _ -> mempty
    where
      parseWebPage :: A.Value -> T.Parser WebPage
      parseWebPage = A.withObject "WebPage" $ \o -> do
        instant_view_version_ <- o A..:? "instant_view_version"
        story_id_ <- o A..:? "story_id"
        story_sender_chat_id_ <- o A..:? "story_sender_chat_id"
        voice_note_ <- o A..:? "voice_note"
        video_note_ <- o A..:? "video_note"
        video_ <- o A..:? "video"
        sticker_ <- o A..:? "sticker"
        document_ <- o A..:? "document"
        audio_ <- o A..:? "audio"
        animation_ <- o A..:? "animation"
        author_ <- o A..:? "author"
        duration_ <- o A..:? "duration"
        embed_height_ <- o A..:? "embed_height"
        embed_width_ <- o A..:? "embed_width"
        embed_type_ <- o A..:? "embed_type"
        embed_url_ <- o A..:? "embed_url"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        site_name_ <- o A..:? "site_name"
        _type_ <- o A..:? "type"
        display_url_ <- o A..:? "display_url"
        url_ <- o A..:? "url"
        return $ WebPage {instant_view_version = instant_view_version_, story_id = story_id_, story_sender_chat_id = story_sender_chat_id_, voice_note = voice_note_, video_note = video_note_, video = video_, sticker = sticker_, document = document_, audio = audio_, animation = animation_, author = author_, duration = duration_, embed_height = embed_height_, embed_width = embed_width_, embed_type = embed_type_, embed_url = embed_url_, photo = photo_, description = description_, title = title_, site_name = site_name_, _type = _type_, display_url = display_url_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON WebPage where
  toJSON
    WebPage
      { instant_view_version = instant_view_version_,
        story_id = story_id_,
        story_sender_chat_id = story_sender_chat_id_,
        voice_note = voice_note_,
        video_note = video_note_,
        video = video_,
        sticker = sticker_,
        document = document_,
        audio = audio_,
        animation = animation_,
        author = author_,
        duration = duration_,
        embed_height = embed_height_,
        embed_width = embed_width_,
        embed_type = embed_type_,
        embed_url = embed_url_,
        photo = photo_,
        description = description_,
        title = title_,
        site_name = site_name_,
        _type = _type_,
        display_url = display_url_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "webPage",
          "instant_view_version" A..= instant_view_version_,
          "story_id" A..= story_id_,
          "story_sender_chat_id" A..= story_sender_chat_id_,
          "voice_note" A..= voice_note_,
          "video_note" A..= video_note_,
          "video" A..= video_,
          "sticker" A..= sticker_,
          "document" A..= document_,
          "audio" A..= audio_,
          "animation" A..= animation_,
          "author" A..= author_,
          "duration" A..= duration_,
          "embed_height" A..= embed_height_,
          "embed_width" A..= embed_width_,
          "embed_type" A..= embed_type_,
          "embed_url" A..= embed_url_,
          "photo" A..= photo_,
          "description" A..= description_,
          "title" A..= title_,
          "site_name" A..= site_name_,
          "type" A..= _type_,
          "display_url" A..= display_url_,
          "url" A..= url_
        ]
