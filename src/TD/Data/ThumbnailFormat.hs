module TD.Data.ThumbnailFormat
  (ThumbnailFormat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Describes format of a thumbnail
data ThumbnailFormat
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
  parseJSON (AT.Object obj) = do
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
    
  parseJSON _ = mempty

