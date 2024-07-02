module TD.Data.PaidMedia
  (PaidMedia(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video

-- | Describes a paid media
data PaidMedia
  = PaidMediaPreview -- ^ The media is hidden until the invoice is paid
    { width         :: Maybe Int                         -- ^ Media width; 0 if unknown
    , height        :: Maybe Int                         -- ^ Media height; 0 if unknown
    , duration      :: Maybe Int                         -- ^ Media duration, in seconds; 0 if unknown
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ Media minithumbnail; may be null
    }
  | PaidMediaPhoto -- ^ The media is a photo
    { photo :: Maybe Photo.Photo -- ^ The photo
    }
  | PaidMediaVideo -- ^ The media is a video
    { video :: Maybe Video.Video -- ^ The video
    }
  | PaidMediaUnsupported -- ^ The media is unsupported
  deriving (Eq, Show)

instance I.ShortShow PaidMedia where
  shortShow PaidMediaPreview
    { width         = width_
    , height        = height_
    , duration      = duration_
    , minithumbnail = minithumbnail_
    }
      = "PaidMediaPreview"
        ++ I.cc
        [ "width"         `I.p` width_
        , "height"        `I.p` height_
        , "duration"      `I.p` duration_
        , "minithumbnail" `I.p` minithumbnail_
        ]
  shortShow PaidMediaPhoto
    { photo = photo_
    }
      = "PaidMediaPhoto"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow PaidMediaVideo
    { video = video_
    }
      = "PaidMediaVideo"
        ++ I.cc
        [ "video" `I.p` video_
        ]
  shortShow PaidMediaUnsupported
      = "PaidMediaUnsupported"

instance AT.FromJSON PaidMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paidMediaPreview"     -> parsePaidMediaPreview v
      "paidMediaPhoto"       -> parsePaidMediaPhoto v
      "paidMediaVideo"       -> parsePaidMediaVideo v
      "paidMediaUnsupported" -> pure PaidMediaUnsupported
      _                      -> mempty
    
    where
      parsePaidMediaPreview :: A.Value -> AT.Parser PaidMedia
      parsePaidMediaPreview = A.withObject "PaidMediaPreview" $ \o -> do
        width_         <- o A..:?  "width"
        height_        <- o A..:?  "height"
        duration_      <- o A..:?  "duration"
        minithumbnail_ <- o A..:?  "minithumbnail"
        pure $ PaidMediaPreview
          { width         = width_
          , height        = height_
          , duration      = duration_
          , minithumbnail = minithumbnail_
          }
      parsePaidMediaPhoto :: A.Value -> AT.Parser PaidMedia
      parsePaidMediaPhoto = A.withObject "PaidMediaPhoto" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ PaidMediaPhoto
          { photo = photo_
          }
      parsePaidMediaVideo :: A.Value -> AT.Parser PaidMedia
      parsePaidMediaVideo = A.withObject "PaidMediaVideo" $ \o -> do
        video_ <- o A..:?  "video"
        pure $ PaidMediaVideo
          { video = video_
          }
  parseJSON _ = mempty

