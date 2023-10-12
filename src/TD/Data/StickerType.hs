module TD.Data.StickerType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data StickerType -- ^ Describes type of a sticker
  = StickerTypeRegular -- ^ The sticker is a regular sticker
  | StickerTypeMask -- ^ The sticker is a mask in WEBP format to be placed on photos or videos
  | StickerTypeCustomEmoji -- ^ The sticker is a custom emoji to be used inside message text and caption
  deriving (Eq)

instance Show StickerType where
  show StickerTypeRegular
      = "StickerTypeRegular"
  show StickerTypeMask
      = "StickerTypeMask"
  show StickerTypeCustomEmoji
      = "StickerTypeCustomEmoji"

instance AT.FromJSON StickerType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickerTypeRegular"     -> pure StickerTypeRegular
      "stickerTypeMask"        -> pure StickerTypeMask
      "stickerTypeCustomEmoji" -> pure StickerTypeCustomEmoji
      _                        -> mempty
    

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
