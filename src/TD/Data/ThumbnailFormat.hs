module TD.Data.ThumbnailFormat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ThumbnailFormat -- ^ Describes format of a thumbnail
  = ThumbnailFormatJpeg -- ^ The thumbnail is in JPEG format
  | ThumbnailFormatGif -- ^ The thumbnail is in static GIF format. It will be used only for some bot inline results
  | ThumbnailFormatMpeg4 -- ^ The thumbnail is in MPEG4 format. It will be used only for some animations and videos
  | ThumbnailFormatPng -- ^ The thumbnail is in PNG format. It will be used only for background patterns
  | ThumbnailFormatTgs -- ^ The thumbnail is in TGS format. It will be used only for TGS sticker sets
  | ThumbnailFormatWebm -- ^ The thumbnail is in WEBM format. It will be used only for WEBM sticker sets
  | ThumbnailFormatWebp -- ^ The thumbnail is in WEBP format. It will be used only for some stickers
  deriving (Eq)

instance Show ThumbnailFormat where
  show ThumbnailFormatJpeg
      = "ThumbnailFormatJpeg"
  show ThumbnailFormatGif
      = "ThumbnailFormatGif"
  show ThumbnailFormatMpeg4
      = "ThumbnailFormatMpeg4"
  show ThumbnailFormatPng
      = "ThumbnailFormatPng"
  show ThumbnailFormatTgs
      = "ThumbnailFormatTgs"
  show ThumbnailFormatWebm
      = "ThumbnailFormatWebm"
  show ThumbnailFormatWebp
      = "ThumbnailFormatWebp"

instance AT.FromJSON ThumbnailFormat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "thumbnailFormatJpeg"  -> pure ThumbnailFormatJpeg
      "thumbnailFormatGif"   -> pure ThumbnailFormatGif
      "thumbnailFormatMpeg4" -> pure ThumbnailFormatMpeg4
      "thumbnailFormatPng"   -> pure ThumbnailFormatPng
      "thumbnailFormatTgs"   -> pure ThumbnailFormatTgs
      "thumbnailFormatWebm"  -> pure ThumbnailFormatWebm
      "thumbnailFormatWebp"  -> pure ThumbnailFormatWebp
      _                      -> mempty
    

instance AT.ToJSON ThumbnailFormat where
  toJSON ThumbnailFormatJpeg
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatJpeg"
        ]
  toJSON ThumbnailFormatGif
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatGif"
        ]
  toJSON ThumbnailFormatMpeg4
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatMpeg4"
        ]
  toJSON ThumbnailFormatPng
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatPng"
        ]
  toJSON ThumbnailFormatTgs
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatTgs"
        ]
  toJSON ThumbnailFormatWebm
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatWebm"
        ]
  toJSON ThumbnailFormatWebp
      = A.object
        [ "@type" A..= AT.String "thumbnailFormatWebp"
        ]
