module TD.Data.LinkPreviewType
  (LinkPreviewType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LinkPreviewAlbumMedia as LinkPreviewAlbumMedia
import qualified Data.Text as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.BackgroundType as BackgroundType
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified TD.Data.InviteLinkChatType as InviteLinkChatType
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.ThemeSettings as ThemeSettings
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote

-- | Describes type of link preview
data LinkPreviewType
  = LinkPreviewTypeAlbum -- ^ The link is a link to a media album consisting of photos and videos
    { media   :: Maybe [LinkPreviewAlbumMedia.LinkPreviewAlbumMedia] -- ^ The list of album media
    , caption :: Maybe T.Text                                        -- ^ Album caption
    }
  | LinkPreviewTypeAnimation -- ^ The link is a link to an animation
    { animation :: Maybe Animation.Animation -- ^ The animation
    }
  | LinkPreviewTypeApp -- ^ The link is a link to an app at App Store or Google Play
    { photo :: Maybe Photo.Photo -- ^ Photo for the app
    }
  | LinkPreviewTypeArticle -- ^ The link is a link to a web site
    { photo :: Maybe Photo.Photo -- ^ Article's main photo; may be null
    }
  | LinkPreviewTypeAudio -- ^ The link is a link to an audio
    { audio :: Maybe Audio.Audio -- ^ The audio description
    }
  | LinkPreviewTypeBackground -- ^ The link is a link to a background. Link preview title and description are available only for filled backgrounds
    { document        :: Maybe Document.Document             -- ^ Document with the background; may be null for filled backgrounds
    , background_type :: Maybe BackgroundType.BackgroundType -- ^ Type of the background; may be null if unknown
    }
  | LinkPreviewTypeChannelBoost -- ^ The link is a link to boost a channel chat
    { _photo :: Maybe ChatPhoto.ChatPhoto -- ^ Photo of the chat; may be null
    }
  | LinkPreviewTypeChat -- ^ The link is a link to a chat
    { _type                :: Maybe InviteLinkChatType.InviteLinkChatType -- ^ Type of the chat
    , _photo               :: Maybe ChatPhoto.ChatPhoto                   -- ^ Photo of the chat; may be null
    , creates_join_request :: Maybe Bool                                  -- ^ True, if the link only creates join request
    }
  | LinkPreviewTypeDocument -- ^ The link is a link to a general file
    { document :: Maybe Document.Document -- ^ The document description
    }
  | LinkPreviewTypeEmbeddedAnimationPlayer -- ^ The link is a link to an animation player
    { url       :: Maybe T.Text      -- ^ URL of the external animation player
    , thumbnail :: Maybe Photo.Photo -- ^ Thumbnail of the animation; may be null if unknown
    , duration  :: Maybe Int         -- ^ Duration of the animation, in seconds
    , width     :: Maybe Int         -- ^ Expected width of the embedded player
    , height    :: Maybe Int         -- ^ Expected height of the embedded player
    }
  | LinkPreviewTypeEmbeddedAudioPlayer -- ^ The link is a link to an audio player
    { url       :: Maybe T.Text      -- ^ URL of the external audio player
    , thumbnail :: Maybe Photo.Photo -- ^ Thumbnail of the audio; may be null if unknown
    , duration  :: Maybe Int         -- ^ Duration of the audio, in seconds
    , width     :: Maybe Int         -- ^ Expected width of the embedded player
    , height    :: Maybe Int         -- ^ Expected height of the embedded player
    }
  | LinkPreviewTypeEmbeddedVideoPlayer -- ^ The link is a link to a video player
    { url       :: Maybe T.Text      -- ^ URL of the external video player
    , thumbnail :: Maybe Photo.Photo -- ^ Thumbnail of the video; may be null if unknown
    , duration  :: Maybe Int         -- ^ Duration of the video, in seconds
    , width     :: Maybe Int         -- ^ Expected width of the embedded player
    , height    :: Maybe Int         -- ^ Expected height of the embedded player
    }
  | LinkPreviewTypeExternalAudio -- ^ The link is a link to an audio file
    { url       :: Maybe T.Text -- ^ URL of the audio file
    , mime_type :: Maybe T.Text -- ^ MIME type of the audio file
    , duration  :: Maybe Int    -- ^ Duration of the audio, in seconds; 0 if unknown
    }
  | LinkPreviewTypeExternalVideo -- ^ The link is a link to a video file
    { url       :: Maybe T.Text -- ^ URL of the video file
    , mime_type :: Maybe T.Text -- ^ MIME type of the video file
    , width     :: Maybe Int    -- ^ Expected width of the video preview; 0 if unknown
    , height    :: Maybe Int    -- ^ Expected height of the video preview; 0 if unknown
    , duration  :: Maybe Int    -- ^ Duration of the video, in seconds; 0 if unknown
    }
  | LinkPreviewTypeInvoice -- ^ The link is a link to an invoice
  | LinkPreviewTypeMessage -- ^ The link is a link to a text or a poll Telegram message
  | LinkPreviewTypePhoto -- ^ The link is a link to a photo
    { photo :: Maybe Photo.Photo -- ^ The photo
    }
  | LinkPreviewTypePremiumGiftCode -- ^ The link is a link to a Telegram Premium gift code
  | LinkPreviewTypeShareableChatFolder -- ^ The link is a link to a shareable chat folder
  | LinkPreviewTypeSticker -- ^ The link is a link to a sticker
    { sticker :: Maybe Sticker.Sticker -- ^ The sticker. It can be an arbitrary WEBP image and can have dimensions bigger than 512
    }
  | LinkPreviewTypeStickerSet -- ^ The link is a link to a sticker set
    { stickers :: Maybe [Sticker.Sticker] -- ^ Up to 4 stickers from the sticker set
    }
  | LinkPreviewTypeStory -- ^ The link is a link to a story. Link preview description is unavailable
    { story_sender_chat_id :: Maybe Int -- ^ The identifier of the chat that posted the story
    , story_id             :: Maybe Int -- ^ Story identifier
    }
  | LinkPreviewTypeSupergroupBoost -- ^ The link is a link to boost a supergroup chat
    { _photo :: Maybe ChatPhoto.ChatPhoto -- ^ Photo of the chat; may be null
    }
  | LinkPreviewTypeTheme -- ^ The link is a link to a cloud theme. TDLib has no theme support yet
    { documents :: Maybe [Document.Document]         -- ^ The list of files with theme description
    , settings  :: Maybe ThemeSettings.ThemeSettings -- ^ Settings for the cloud theme; may be null if unknown
    }
  | LinkPreviewTypeUnsupported -- ^ The link preview type is unsupported yet
  | LinkPreviewTypeUser -- ^ The link is a link to a user
    { _photo :: Maybe ChatPhoto.ChatPhoto -- ^ Photo of the user; may be null if none
    , is_bot :: Maybe Bool                -- ^ True, if the user is a bot
    }
  | LinkPreviewTypeVideo -- ^ The link is a link to a video
    { video :: Maybe Video.Video -- ^ The video description
    }
  | LinkPreviewTypeVideoChat -- ^ The link is a link to a video chat
    { _photo         :: Maybe ChatPhoto.ChatPhoto -- ^ Photo of the chat with the video chat; may be null if none
    , is_live_stream :: Maybe Bool                -- ^ True, if the video chat is expected to be a live stream in a channel or a broadcast group
    }
  | LinkPreviewTypeVideoNote -- ^ The link is a link to a video note message
    { video_note :: Maybe VideoNote.VideoNote -- ^ The video note
    }
  | LinkPreviewTypeVoiceNote -- ^ The link is a link to a voice note message
    { voice_note :: Maybe VoiceNote.VoiceNote -- ^ The voice note
    }
  | LinkPreviewTypeWebApp -- ^ The link is a link to a Web App
    { photo :: Maybe Photo.Photo -- ^ Web App photo; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow LinkPreviewType where
  shortShow LinkPreviewTypeAlbum
    { media   = media_
    , caption = caption_
    }
      = "LinkPreviewTypeAlbum"
        ++ I.cc
        [ "media"   `I.p` media_
        , "caption" `I.p` caption_
        ]
  shortShow LinkPreviewTypeAnimation
    { animation = animation_
    }
      = "LinkPreviewTypeAnimation"
        ++ I.cc
        [ "animation" `I.p` animation_
        ]
  shortShow LinkPreviewTypeApp
    { photo = photo_
    }
      = "LinkPreviewTypeApp"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow LinkPreviewTypeArticle
    { photo = photo_
    }
      = "LinkPreviewTypeArticle"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow LinkPreviewTypeAudio
    { audio = audio_
    }
      = "LinkPreviewTypeAudio"
        ++ I.cc
        [ "audio" `I.p` audio_
        ]
  shortShow LinkPreviewTypeBackground
    { document        = document_
    , background_type = background_type_
    }
      = "LinkPreviewTypeBackground"
        ++ I.cc
        [ "document"        `I.p` document_
        , "background_type" `I.p` background_type_
        ]
  shortShow LinkPreviewTypeChannelBoost
    { _photo = _photo_
    }
      = "LinkPreviewTypeChannelBoost"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        ]
  shortShow LinkPreviewTypeChat
    { _type                = _type_
    , _photo               = _photo_
    , creates_join_request = creates_join_request_
    }
      = "LinkPreviewTypeChat"
        ++ I.cc
        [ "_type"                `I.p` _type_
        , "_photo"               `I.p` _photo_
        , "creates_join_request" `I.p` creates_join_request_
        ]
  shortShow LinkPreviewTypeDocument
    { document = document_
    }
      = "LinkPreviewTypeDocument"
        ++ I.cc
        [ "document" `I.p` document_
        ]
  shortShow LinkPreviewTypeEmbeddedAnimationPlayer
    { url       = url_
    , thumbnail = thumbnail_
    , duration  = duration_
    , width     = width_
    , height    = height_
    }
      = "LinkPreviewTypeEmbeddedAnimationPlayer"
        ++ I.cc
        [ "url"       `I.p` url_
        , "thumbnail" `I.p` thumbnail_
        , "duration"  `I.p` duration_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        ]
  shortShow LinkPreviewTypeEmbeddedAudioPlayer
    { url       = url_
    , thumbnail = thumbnail_
    , duration  = duration_
    , width     = width_
    , height    = height_
    }
      = "LinkPreviewTypeEmbeddedAudioPlayer"
        ++ I.cc
        [ "url"       `I.p` url_
        , "thumbnail" `I.p` thumbnail_
        , "duration"  `I.p` duration_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        ]
  shortShow LinkPreviewTypeEmbeddedVideoPlayer
    { url       = url_
    , thumbnail = thumbnail_
    , duration  = duration_
    , width     = width_
    , height    = height_
    }
      = "LinkPreviewTypeEmbeddedVideoPlayer"
        ++ I.cc
        [ "url"       `I.p` url_
        , "thumbnail" `I.p` thumbnail_
        , "duration"  `I.p` duration_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        ]
  shortShow LinkPreviewTypeExternalAudio
    { url       = url_
    , mime_type = mime_type_
    , duration  = duration_
    }
      = "LinkPreviewTypeExternalAudio"
        ++ I.cc
        [ "url"       `I.p` url_
        , "mime_type" `I.p` mime_type_
        , "duration"  `I.p` duration_
        ]
  shortShow LinkPreviewTypeExternalVideo
    { url       = url_
    , mime_type = mime_type_
    , width     = width_
    , height    = height_
    , duration  = duration_
    }
      = "LinkPreviewTypeExternalVideo"
        ++ I.cc
        [ "url"       `I.p` url_
        , "mime_type" `I.p` mime_type_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        , "duration"  `I.p` duration_
        ]
  shortShow LinkPreviewTypeInvoice
      = "LinkPreviewTypeInvoice"
  shortShow LinkPreviewTypeMessage
      = "LinkPreviewTypeMessage"
  shortShow LinkPreviewTypePhoto
    { photo = photo_
    }
      = "LinkPreviewTypePhoto"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow LinkPreviewTypePremiumGiftCode
      = "LinkPreviewTypePremiumGiftCode"
  shortShow LinkPreviewTypeShareableChatFolder
      = "LinkPreviewTypeShareableChatFolder"
  shortShow LinkPreviewTypeSticker
    { sticker = sticker_
    }
      = "LinkPreviewTypeSticker"
        ++ I.cc
        [ "sticker" `I.p` sticker_
        ]
  shortShow LinkPreviewTypeStickerSet
    { stickers = stickers_
    }
      = "LinkPreviewTypeStickerSet"
        ++ I.cc
        [ "stickers" `I.p` stickers_
        ]
  shortShow LinkPreviewTypeStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = "LinkPreviewTypeStory"
        ++ I.cc
        [ "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        ]
  shortShow LinkPreviewTypeSupergroupBoost
    { _photo = _photo_
    }
      = "LinkPreviewTypeSupergroupBoost"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        ]
  shortShow LinkPreviewTypeTheme
    { documents = documents_
    , settings  = settings_
    }
      = "LinkPreviewTypeTheme"
        ++ I.cc
        [ "documents" `I.p` documents_
        , "settings"  `I.p` settings_
        ]
  shortShow LinkPreviewTypeUnsupported
      = "LinkPreviewTypeUnsupported"
  shortShow LinkPreviewTypeUser
    { _photo = _photo_
    , is_bot = is_bot_
    }
      = "LinkPreviewTypeUser"
        ++ I.cc
        [ "_photo" `I.p` _photo_
        , "is_bot" `I.p` is_bot_
        ]
  shortShow LinkPreviewTypeVideo
    { video = video_
    }
      = "LinkPreviewTypeVideo"
        ++ I.cc
        [ "video" `I.p` video_
        ]
  shortShow LinkPreviewTypeVideoChat
    { _photo         = _photo_
    , is_live_stream = is_live_stream_
    }
      = "LinkPreviewTypeVideoChat"
        ++ I.cc
        [ "_photo"         `I.p` _photo_
        , "is_live_stream" `I.p` is_live_stream_
        ]
  shortShow LinkPreviewTypeVideoNote
    { video_note = video_note_
    }
      = "LinkPreviewTypeVideoNote"
        ++ I.cc
        [ "video_note" `I.p` video_note_
        ]
  shortShow LinkPreviewTypeVoiceNote
    { voice_note = voice_note_
    }
      = "LinkPreviewTypeVoiceNote"
        ++ I.cc
        [ "voice_note" `I.p` voice_note_
        ]
  shortShow LinkPreviewTypeWebApp
    { photo = photo_
    }
      = "LinkPreviewTypeWebApp"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]

instance AT.FromJSON LinkPreviewType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "linkPreviewTypeAlbum"                   -> parseLinkPreviewTypeAlbum v
      "linkPreviewTypeAnimation"               -> parseLinkPreviewTypeAnimation v
      "linkPreviewTypeApp"                     -> parseLinkPreviewTypeApp v
      "linkPreviewTypeArticle"                 -> parseLinkPreviewTypeArticle v
      "linkPreviewTypeAudio"                   -> parseLinkPreviewTypeAudio v
      "linkPreviewTypeBackground"              -> parseLinkPreviewTypeBackground v
      "linkPreviewTypeChannelBoost"            -> parseLinkPreviewTypeChannelBoost v
      "linkPreviewTypeChat"                    -> parseLinkPreviewTypeChat v
      "linkPreviewTypeDocument"                -> parseLinkPreviewTypeDocument v
      "linkPreviewTypeEmbeddedAnimationPlayer" -> parseLinkPreviewTypeEmbeddedAnimationPlayer v
      "linkPreviewTypeEmbeddedAudioPlayer"     -> parseLinkPreviewTypeEmbeddedAudioPlayer v
      "linkPreviewTypeEmbeddedVideoPlayer"     -> parseLinkPreviewTypeEmbeddedVideoPlayer v
      "linkPreviewTypeExternalAudio"           -> parseLinkPreviewTypeExternalAudio v
      "linkPreviewTypeExternalVideo"           -> parseLinkPreviewTypeExternalVideo v
      "linkPreviewTypeInvoice"                 -> pure LinkPreviewTypeInvoice
      "linkPreviewTypeMessage"                 -> pure LinkPreviewTypeMessage
      "linkPreviewTypePhoto"                   -> parseLinkPreviewTypePhoto v
      "linkPreviewTypePremiumGiftCode"         -> pure LinkPreviewTypePremiumGiftCode
      "linkPreviewTypeShareableChatFolder"     -> pure LinkPreviewTypeShareableChatFolder
      "linkPreviewTypeSticker"                 -> parseLinkPreviewTypeSticker v
      "linkPreviewTypeStickerSet"              -> parseLinkPreviewTypeStickerSet v
      "linkPreviewTypeStory"                   -> parseLinkPreviewTypeStory v
      "linkPreviewTypeSupergroupBoost"         -> parseLinkPreviewTypeSupergroupBoost v
      "linkPreviewTypeTheme"                   -> parseLinkPreviewTypeTheme v
      "linkPreviewTypeUnsupported"             -> pure LinkPreviewTypeUnsupported
      "linkPreviewTypeUser"                    -> parseLinkPreviewTypeUser v
      "linkPreviewTypeVideo"                   -> parseLinkPreviewTypeVideo v
      "linkPreviewTypeVideoChat"               -> parseLinkPreviewTypeVideoChat v
      "linkPreviewTypeVideoNote"               -> parseLinkPreviewTypeVideoNote v
      "linkPreviewTypeVoiceNote"               -> parseLinkPreviewTypeVoiceNote v
      "linkPreviewTypeWebApp"                  -> parseLinkPreviewTypeWebApp v
      _                                        -> mempty
    
    where
      parseLinkPreviewTypeAlbum :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeAlbum = A.withObject "LinkPreviewTypeAlbum" $ \o -> do
        media_   <- o A..:?  "media"
        caption_ <- o A..:?  "caption"
        pure $ LinkPreviewTypeAlbum
          { media   = media_
          , caption = caption_
          }
      parseLinkPreviewTypeAnimation :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeAnimation = A.withObject "LinkPreviewTypeAnimation" $ \o -> do
        animation_ <- o A..:?  "animation"
        pure $ LinkPreviewTypeAnimation
          { animation = animation_
          }
      parseLinkPreviewTypeApp :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeApp = A.withObject "LinkPreviewTypeApp" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ LinkPreviewTypeApp
          { photo = photo_
          }
      parseLinkPreviewTypeArticle :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeArticle = A.withObject "LinkPreviewTypeArticle" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ LinkPreviewTypeArticle
          { photo = photo_
          }
      parseLinkPreviewTypeAudio :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeAudio = A.withObject "LinkPreviewTypeAudio" $ \o -> do
        audio_ <- o A..:?  "audio"
        pure $ LinkPreviewTypeAudio
          { audio = audio_
          }
      parseLinkPreviewTypeBackground :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeBackground = A.withObject "LinkPreviewTypeBackground" $ \o -> do
        document_        <- o A..:?  "document"
        background_type_ <- o A..:?  "background_type"
        pure $ LinkPreviewTypeBackground
          { document        = document_
          , background_type = background_type_
          }
      parseLinkPreviewTypeChannelBoost :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeChannelBoost = A.withObject "LinkPreviewTypeChannelBoost" $ \o -> do
        _photo_ <- o A..:?  "photo"
        pure $ LinkPreviewTypeChannelBoost
          { _photo = _photo_
          }
      parseLinkPreviewTypeChat :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeChat = A.withObject "LinkPreviewTypeChat" $ \o -> do
        _type_                <- o A..:?  "type"
        _photo_               <- o A..:?  "photo"
        creates_join_request_ <- o A..:?  "creates_join_request"
        pure $ LinkPreviewTypeChat
          { _type                = _type_
          , _photo               = _photo_
          , creates_join_request = creates_join_request_
          }
      parseLinkPreviewTypeDocument :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeDocument = A.withObject "LinkPreviewTypeDocument" $ \o -> do
        document_ <- o A..:?  "document"
        pure $ LinkPreviewTypeDocument
          { document = document_
          }
      parseLinkPreviewTypeEmbeddedAnimationPlayer :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeEmbeddedAnimationPlayer = A.withObject "LinkPreviewTypeEmbeddedAnimationPlayer" $ \o -> do
        url_       <- o A..:?  "url"
        thumbnail_ <- o A..:?  "thumbnail"
        duration_  <- o A..:?  "duration"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        pure $ LinkPreviewTypeEmbeddedAnimationPlayer
          { url       = url_
          , thumbnail = thumbnail_
          , duration  = duration_
          , width     = width_
          , height    = height_
          }
      parseLinkPreviewTypeEmbeddedAudioPlayer :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeEmbeddedAudioPlayer = A.withObject "LinkPreviewTypeEmbeddedAudioPlayer" $ \o -> do
        url_       <- o A..:?  "url"
        thumbnail_ <- o A..:?  "thumbnail"
        duration_  <- o A..:?  "duration"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        pure $ LinkPreviewTypeEmbeddedAudioPlayer
          { url       = url_
          , thumbnail = thumbnail_
          , duration  = duration_
          , width     = width_
          , height    = height_
          }
      parseLinkPreviewTypeEmbeddedVideoPlayer :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeEmbeddedVideoPlayer = A.withObject "LinkPreviewTypeEmbeddedVideoPlayer" $ \o -> do
        url_       <- o A..:?  "url"
        thumbnail_ <- o A..:?  "thumbnail"
        duration_  <- o A..:?  "duration"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        pure $ LinkPreviewTypeEmbeddedVideoPlayer
          { url       = url_
          , thumbnail = thumbnail_
          , duration  = duration_
          , width     = width_
          , height    = height_
          }
      parseLinkPreviewTypeExternalAudio :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeExternalAudio = A.withObject "LinkPreviewTypeExternalAudio" $ \o -> do
        url_       <- o A..:?  "url"
        mime_type_ <- o A..:?  "mime_type"
        duration_  <- o A..:?  "duration"
        pure $ LinkPreviewTypeExternalAudio
          { url       = url_
          , mime_type = mime_type_
          , duration  = duration_
          }
      parseLinkPreviewTypeExternalVideo :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeExternalVideo = A.withObject "LinkPreviewTypeExternalVideo" $ \o -> do
        url_       <- o A..:?  "url"
        mime_type_ <- o A..:?  "mime_type"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        duration_  <- o A..:?  "duration"
        pure $ LinkPreviewTypeExternalVideo
          { url       = url_
          , mime_type = mime_type_
          , width     = width_
          , height    = height_
          , duration  = duration_
          }
      parseLinkPreviewTypePhoto :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypePhoto = A.withObject "LinkPreviewTypePhoto" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ LinkPreviewTypePhoto
          { photo = photo_
          }
      parseLinkPreviewTypeSticker :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeSticker = A.withObject "LinkPreviewTypeSticker" $ \o -> do
        sticker_ <- o A..:?  "sticker"
        pure $ LinkPreviewTypeSticker
          { sticker = sticker_
          }
      parseLinkPreviewTypeStickerSet :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeStickerSet = A.withObject "LinkPreviewTypeStickerSet" $ \o -> do
        stickers_ <- o A..:?  "stickers"
        pure $ LinkPreviewTypeStickerSet
          { stickers = stickers_
          }
      parseLinkPreviewTypeStory :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeStory = A.withObject "LinkPreviewTypeStory" $ \o -> do
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        pure $ LinkPreviewTypeStory
          { story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          }
      parseLinkPreviewTypeSupergroupBoost :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeSupergroupBoost = A.withObject "LinkPreviewTypeSupergroupBoost" $ \o -> do
        _photo_ <- o A..:?  "photo"
        pure $ LinkPreviewTypeSupergroupBoost
          { _photo = _photo_
          }
      parseLinkPreviewTypeTheme :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeTheme = A.withObject "LinkPreviewTypeTheme" $ \o -> do
        documents_ <- o A..:?  "documents"
        settings_  <- o A..:?  "settings"
        pure $ LinkPreviewTypeTheme
          { documents = documents_
          , settings  = settings_
          }
      parseLinkPreviewTypeUser :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeUser = A.withObject "LinkPreviewTypeUser" $ \o -> do
        _photo_ <- o A..:?  "photo"
        is_bot_ <- o A..:?  "is_bot"
        pure $ LinkPreviewTypeUser
          { _photo = _photo_
          , is_bot = is_bot_
          }
      parseLinkPreviewTypeVideo :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeVideo = A.withObject "LinkPreviewTypeVideo" $ \o -> do
        video_ <- o A..:?  "video"
        pure $ LinkPreviewTypeVideo
          { video = video_
          }
      parseLinkPreviewTypeVideoChat :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeVideoChat = A.withObject "LinkPreviewTypeVideoChat" $ \o -> do
        _photo_         <- o A..:?  "photo"
        is_live_stream_ <- o A..:?  "is_live_stream"
        pure $ LinkPreviewTypeVideoChat
          { _photo         = _photo_
          , is_live_stream = is_live_stream_
          }
      parseLinkPreviewTypeVideoNote :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeVideoNote = A.withObject "LinkPreviewTypeVideoNote" $ \o -> do
        video_note_ <- o A..:?  "video_note"
        pure $ LinkPreviewTypeVideoNote
          { video_note = video_note_
          }
      parseLinkPreviewTypeVoiceNote :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeVoiceNote = A.withObject "LinkPreviewTypeVoiceNote" $ \o -> do
        voice_note_ <- o A..:?  "voice_note"
        pure $ LinkPreviewTypeVoiceNote
          { voice_note = voice_note_
          }
      parseLinkPreviewTypeWebApp :: A.Value -> AT.Parser LinkPreviewType
      parseLinkPreviewTypeWebApp = A.withObject "LinkPreviewTypeWebApp" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ LinkPreviewTypeWebApp
          { photo = photo_
          }
  parseJSON _ = mempty

