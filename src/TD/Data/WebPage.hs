module TD.Data.WebPage
  (WebPage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote

data WebPage
  = WebPage -- ^ Describes a link preview
    { url                  :: Maybe T.Text                      -- ^ Original URL of the link
    , display_url          :: Maybe T.Text                      -- ^ URL to display
    , _type                :: Maybe T.Text                      -- ^ Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
    , site_name            :: Maybe T.Text                      -- ^ Short name of the site (e.g., Google Docs, App Store)
    , title                :: Maybe T.Text                      -- ^ Title of the content
    , description          :: Maybe FormattedText.FormattedText
    , photo                :: Maybe Photo.Photo                 -- ^ Image representing the content; may be null
    , embed_url            :: Maybe T.Text                      -- ^ URL to show in the embedded preview
    , embed_type           :: Maybe T.Text                      -- ^ MIME type of the embedded preview, (e.g., text/html or video/mp4)
    , embed_width          :: Maybe Int                         -- ^ Width of the embedded preview
    , embed_height         :: Maybe Int                         -- ^ Height of the embedded preview
    , duration             :: Maybe Int                         -- ^ Duration of the content, in seconds
    , author               :: Maybe T.Text                      -- ^ Author of the content
    , has_large_media      :: Maybe Bool                        -- ^ True, if size of media in the preview can be changed
    , show_large_media     :: Maybe Bool                        -- ^ True, if large media preview must be shown
    , skip_confirmation    :: Maybe Bool                        -- ^ True, if there is no need to show an ordinary open URL confirmation, when opening the URL from the preview, because the URL is shown in the message text in clear
    , show_above_text      :: Maybe Bool                        -- ^ True, if the link preview must be shown above message text; otherwise, the link preview must be shown below the message text
    , animation            :: Maybe Animation.Animation         -- ^ Preview of the content as an animation, if available; may be null
    , audio                :: Maybe Audio.Audio                 -- ^ Preview of the content as an audio file, if available; may be null
    , document             :: Maybe Document.Document           -- ^ Preview of the content as a document, if available; may be null
    , sticker              :: Maybe Sticker.Sticker             -- ^ Preview of the content as a sticker for small WEBP files, if available; may be null
    , video                :: Maybe Video.Video                 -- ^ Preview of the content as a video, if available; may be null
    , video_note           :: Maybe VideoNote.VideoNote         -- ^ Preview of the content as a video note, if available; may be null
    , voice_note           :: Maybe VoiceNote.VoiceNote         -- ^ Preview of the content as a voice note, if available; may be null
    , story_sender_chat_id :: Maybe Int                         -- ^ The identifier of the sender of the previewed story; 0 if none
    , story_id             :: Maybe Int                         -- ^ The identifier of the previewed story; 0 if none
    , instant_view_version :: Maybe Int                         -- ^ Version of web page instant view (currently, can be 1 or 2); 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow WebPage where
  shortShow WebPage
    { url                  = url_
    , display_url          = display_url_
    , _type                = _type_
    , site_name            = site_name_
    , title                = title_
    , description          = description_
    , photo                = photo_
    , embed_url            = embed_url_
    , embed_type           = embed_type_
    , embed_width          = embed_width_
    , embed_height         = embed_height_
    , duration             = duration_
    , author               = author_
    , has_large_media      = has_large_media_
    , show_large_media     = show_large_media_
    , skip_confirmation    = skip_confirmation_
    , show_above_text      = show_above_text_
    , animation            = animation_
    , audio                = audio_
    , document             = document_
    , sticker              = sticker_
    , video                = video_
    , video_note           = video_note_
    , voice_note           = voice_note_
    , story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    , instant_view_version = instant_view_version_
    }
      = "WebPage"
        ++ I.cc
        [ "url"                  `I.p` url_
        , "display_url"          `I.p` display_url_
        , "_type"                `I.p` _type_
        , "site_name"            `I.p` site_name_
        , "title"                `I.p` title_
        , "description"          `I.p` description_
        , "photo"                `I.p` photo_
        , "embed_url"            `I.p` embed_url_
        , "embed_type"           `I.p` embed_type_
        , "embed_width"          `I.p` embed_width_
        , "embed_height"         `I.p` embed_height_
        , "duration"             `I.p` duration_
        , "author"               `I.p` author_
        , "has_large_media"      `I.p` has_large_media_
        , "show_large_media"     `I.p` show_large_media_
        , "skip_confirmation"    `I.p` skip_confirmation_
        , "show_above_text"      `I.p` show_above_text_
        , "animation"            `I.p` animation_
        , "audio"                `I.p` audio_
        , "document"             `I.p` document_
        , "sticker"              `I.p` sticker_
        , "video"                `I.p` video_
        , "video_note"           `I.p` video_note_
        , "voice_note"           `I.p` voice_note_
        , "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        , "instant_view_version" `I.p` instant_view_version_
        ]

instance AT.FromJSON WebPage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webPage" -> parseWebPage v
      _         -> mempty
    
    where
      parseWebPage :: A.Value -> AT.Parser WebPage
      parseWebPage = A.withObject "WebPage" $ \o -> do
        url_                  <- o A..:?  "url"
        display_url_          <- o A..:?  "display_url"
        _type_                <- o A..:?  "type"
        site_name_            <- o A..:?  "site_name"
        title_                <- o A..:?  "title"
        description_          <- o A..:?  "description"
        photo_                <- o A..:?  "photo"
        embed_url_            <- o A..:?  "embed_url"
        embed_type_           <- o A..:?  "embed_type"
        embed_width_          <- o A..:?  "embed_width"
        embed_height_         <- o A..:?  "embed_height"
        duration_             <- o A..:?  "duration"
        author_               <- o A..:?  "author"
        has_large_media_      <- o A..:?  "has_large_media"
        show_large_media_     <- o A..:?  "show_large_media"
        skip_confirmation_    <- o A..:?  "skip_confirmation"
        show_above_text_      <- o A..:?  "show_above_text"
        animation_            <- o A..:?  "animation"
        audio_                <- o A..:?  "audio"
        document_             <- o A..:?  "document"
        sticker_              <- o A..:?  "sticker"
        video_                <- o A..:?  "video"
        video_note_           <- o A..:?  "video_note"
        voice_note_           <- o A..:?  "voice_note"
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        instant_view_version_ <- o A..:?  "instant_view_version"
        pure $ WebPage
          { url                  = url_
          , display_url          = display_url_
          , _type                = _type_
          , site_name            = site_name_
          , title                = title_
          , description          = description_
          , photo                = photo_
          , embed_url            = embed_url_
          , embed_type           = embed_type_
          , embed_width          = embed_width_
          , embed_height         = embed_height_
          , duration             = duration_
          , author               = author_
          , has_large_media      = has_large_media_
          , show_large_media     = show_large_media_
          , skip_confirmation    = skip_confirmation_
          , show_above_text      = show_above_text_
          , animation            = animation_
          , audio                = audio_
          , document             = document_
          , sticker              = sticker_
          , video                = video_
          , video_note           = video_note_
          , voice_note           = voice_note_
          , story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          , instant_view_version = instant_view_version_
          }
  parseJSON _ = mempty

