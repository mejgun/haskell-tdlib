module TD.Data.Animation
  (Animation(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data Animation
  = Animation -- ^ Describes an animation file. The animation must be encoded in GIF or MPEG4 format
    { duration      :: Maybe Int                         -- ^ Duration of the animation, in seconds; as defined by the sender
    , width         :: Maybe Int                         -- ^ Width of the animation
    , height        :: Maybe Int                         -- ^ Height of the animation
    , file_name     :: Maybe T.Text                      -- ^ Original name of the file; as defined by the sender
    , mime_type     :: Maybe T.Text                      -- ^ MIME type of the file, usually "image/gif" or "video/mp4"
    , has_stickers  :: Maybe Bool                        -- ^ True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ Animation minithumbnail; may be null
    , thumbnail     :: Maybe Thumbnail.Thumbnail         -- ^ Animation thumbnail in JPEG or MPEG4 format; may be null
    , animation     :: Maybe File.File                   -- ^ File containing the animation
    }
  deriving (Eq, Show)

instance I.ShortShow Animation where
  shortShow Animation
    { duration      = duration_
    , width         = width_
    , height        = height_
    , file_name     = file_name_
    , mime_type     = mime_type_
    , has_stickers  = has_stickers_
    , minithumbnail = minithumbnail_
    , thumbnail     = thumbnail_
    , animation     = animation_
    }
      = "Animation"
        ++ I.cc
        [ "duration"      `I.p` duration_
        , "width"         `I.p` width_
        , "height"        `I.p` height_
        , "file_name"     `I.p` file_name_
        , "mime_type"     `I.p` mime_type_
        , "has_stickers"  `I.p` has_stickers_
        , "minithumbnail" `I.p` minithumbnail_
        , "thumbnail"     `I.p` thumbnail_
        , "animation"     `I.p` animation_
        ]

instance AT.FromJSON Animation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "animation" -> parseAnimation v
      _           -> mempty
    
    where
      parseAnimation :: A.Value -> AT.Parser Animation
      parseAnimation = A.withObject "Animation" $ \o -> do
        duration_      <- o A..:?  "duration"
        width_         <- o A..:?  "width"
        height_        <- o A..:?  "height"
        file_name_     <- o A..:?  "file_name"
        mime_type_     <- o A..:?  "mime_type"
        has_stickers_  <- o A..:?  "has_stickers"
        minithumbnail_ <- o A..:?  "minithumbnail"
        thumbnail_     <- o A..:?  "thumbnail"
        animation_     <- o A..:?  "animation"
        pure $ Animation
          { duration      = duration_
          , width         = width_
          , height        = height_
          , file_name     = file_name_
          , mime_type     = mime_type_
          , has_stickers  = has_stickers_
          , minithumbnail = minithumbnail_
          , thumbnail     = thumbnail_
          , animation     = animation_
          }
  parseJSON _ = mempty

