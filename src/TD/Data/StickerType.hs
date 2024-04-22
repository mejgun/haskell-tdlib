module TD.Data.StickerType
  (StickerType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of sticker
data StickerType
  = StickerTypeRegular -- ^ The sticker is a regular sticker
  | StickerTypeMask -- ^ The sticker is a mask in WEBP format to be placed on photos or videos
  | StickerTypeCustomEmoji -- ^ The sticker is a custom emoji to be used inside message text and caption
  deriving (Eq, Show)

instance I.ShortShow StickerType where
  shortShow StickerTypeRegular
      = "StickerTypeRegular"
  shortShow StickerTypeMask
      = "StickerTypeMask"
  shortShow StickerTypeCustomEmoji
      = "StickerTypeCustomEmoji"

instance AT.FromJSON StickerType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickerTypeRegular"     -> pure StickerTypeRegular
      "stickerTypeMask"        -> pure StickerTypeMask
      "stickerTypeCustomEmoji" -> pure StickerTypeCustomEmoji
      _                        -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON StickerType where
  toJSON StickerTypeRegular
      = A.object
        [ "@type" A..= AT.String "stickerTypeRegular"
        ]
  toJSON StickerTypeMask
      = A.object
        [ "@type" A..= AT.String "stickerTypeMask"
        ]
  toJSON StickerTypeCustomEmoji
      = A.object
        [ "@type" A..= AT.String "stickerTypeCustomEmoji"
        ]

