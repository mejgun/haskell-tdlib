module TD.Data.StickerFormat
  ( StickerFormat(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data StickerFormat -- ^ Describes format of a sticker
  = StickerFormatWebp -- ^ The sticker is an image in WEBP format
  | StickerFormatTgs -- ^ The sticker is an animation in TGS format
  | StickerFormatWebm -- ^ The sticker is a video in WEBM format
  deriving (Eq)

instance Show StickerFormat where
  show StickerFormatWebp
      = "StickerFormatWebp"
  show StickerFormatTgs
      = "StickerFormatTgs"
  show StickerFormatWebm
      = "StickerFormatWebm"

instance AT.FromJSON StickerFormat where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickerFormatWebp" -> pure StickerFormatWebp
      "stickerFormatTgs"  -> pure StickerFormatTgs
      "stickerFormatWebm" -> pure StickerFormatWebm
      _                   -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON StickerFormat where
  toJSON StickerFormatWebp
      = A.object
        [ "@type" A..= AT.String "stickerFormatWebp"
        ]
  toJSON StickerFormatTgs
      = A.object
        [ "@type" A..= AT.String "stickerFormatTgs"
        ]
  toJSON StickerFormatWebm
      = A.object
        [ "@type" A..= AT.String "stickerFormatWebm"
        ]

