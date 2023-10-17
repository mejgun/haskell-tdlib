module TD.Data.MessageExtendedMedia
  (MessageExtendedMedia(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video

-- | Describes a media, which is attached to an invoice
data MessageExtendedMedia
  = MessageExtendedMediaPreview -- ^ The media is hidden until the invoice is paid
    { width         :: Maybe Int                         -- ^ Media width; 0 if unknown
    , height        :: Maybe Int                         -- ^ Media height; 0 if unknown
    , duration      :: Maybe Int                         -- ^ Media duration; 0 if unknown
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ Media minithumbnail; may be null
    , caption       :: Maybe FormattedText.FormattedText -- ^ Media caption
    }
  | MessageExtendedMediaPhoto -- ^ The media is a photo
    { photo   :: Maybe Photo.Photo                 -- ^ The photo
    , caption :: Maybe FormattedText.FormattedText -- ^ Photo caption
    }
  | MessageExtendedMediaVideo -- ^ The media is a video
    { video   :: Maybe Video.Video                 -- ^ The video
    , caption :: Maybe FormattedText.FormattedText -- ^ Photo caption
    }
  | MessageExtendedMediaUnsupported -- ^ The media is unsupported
    { caption :: Maybe FormattedText.FormattedText -- ^ Media caption
    }
  deriving (Eq, Show)

instance I.ShortShow MessageExtendedMedia where
  shortShow MessageExtendedMediaPreview
    { width         = width_
    , height        = height_
    , duration      = duration_
    , minithumbnail = minithumbnail_
    , caption       = caption_
    }
      = "MessageExtendedMediaPreview"
        ++ I.cc
        [ "width"         `I.p` width_
        , "height"        `I.p` height_
        , "duration"      `I.p` duration_
        , "minithumbnail" `I.p` minithumbnail_
        , "caption"       `I.p` caption_
        ]
  shortShow MessageExtendedMediaPhoto
    { photo   = photo_
    , caption = caption_
    }
      = "MessageExtendedMediaPhoto"
        ++ I.cc
        [ "photo"   `I.p` photo_
        , "caption" `I.p` caption_
        ]
  shortShow MessageExtendedMediaVideo
    { video   = video_
    , caption = caption_
    }
      = "MessageExtendedMediaVideo"
        ++ I.cc
        [ "video"   `I.p` video_
        , "caption" `I.p` caption_
        ]
  shortShow MessageExtendedMediaUnsupported
    { caption = caption_
    }
      = "MessageExtendedMediaUnsupported"
        ++ I.cc
        [ "caption" `I.p` caption_
        ]

instance AT.FromJSON MessageExtendedMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageExtendedMediaPreview"     -> parseMessageExtendedMediaPreview v
      "messageExtendedMediaPhoto"       -> parseMessageExtendedMediaPhoto v
      "messageExtendedMediaVideo"       -> parseMessageExtendedMediaVideo v
      "messageExtendedMediaUnsupported" -> parseMessageExtendedMediaUnsupported v
      _                                 -> mempty
    
    where
      parseMessageExtendedMediaPreview :: A.Value -> AT.Parser MessageExtendedMedia
      parseMessageExtendedMediaPreview = A.withObject "MessageExtendedMediaPreview" $ \o -> do
        width_         <- o A..:?  "width"
        height_        <- o A..:?  "height"
        duration_      <- o A..:?  "duration"
        minithumbnail_ <- o A..:?  "minithumbnail"
        caption_       <- o A..:?  "caption"
        pure $ MessageExtendedMediaPreview
          { width         = width_
          , height        = height_
          , duration      = duration_
          , minithumbnail = minithumbnail_
          , caption       = caption_
          }
      parseMessageExtendedMediaPhoto :: A.Value -> AT.Parser MessageExtendedMedia
      parseMessageExtendedMediaPhoto = A.withObject "MessageExtendedMediaPhoto" $ \o -> do
        photo_   <- o A..:?  "photo"
        caption_ <- o A..:?  "caption"
        pure $ MessageExtendedMediaPhoto
          { photo   = photo_
          , caption = caption_
          }
      parseMessageExtendedMediaVideo :: A.Value -> AT.Parser MessageExtendedMedia
      parseMessageExtendedMediaVideo = A.withObject "MessageExtendedMediaVideo" $ \o -> do
        video_   <- o A..:?  "video"
        caption_ <- o A..:?  "caption"
        pure $ MessageExtendedMediaVideo
          { video   = video_
          , caption = caption_
          }
      parseMessageExtendedMediaUnsupported :: A.Value -> AT.Parser MessageExtendedMedia
      parseMessageExtendedMediaUnsupported = A.withObject "MessageExtendedMediaUnsupported" $ \o -> do
        caption_ <- o A..:?  "caption"
        pure $ MessageExtendedMediaUnsupported
          { caption = caption_
          }
  parseJSON _ = mempty

