{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StickerType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes type of a sticker
data StickerType
  = -- | The sticker is a regular sticker
    StickerTypeRegular
  | -- | The sticker is a mask in WEBP format to be placed on photos or videos
    StickerTypeMask
  | -- | The sticker is a custom emoji to be used inside message text and caption
    StickerTypeCustomEmoji
  deriving (Eq)

instance Show StickerType where
  show StickerTypeRegular =
    "StickerTypeRegular"
      ++ U.cc
        []
  show StickerTypeMask =
    "StickerTypeMask"
      ++ U.cc
        []
  show StickerTypeCustomEmoji =
    "StickerTypeCustomEmoji"
      ++ U.cc
        []

instance T.FromJSON StickerType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickerTypeRegular" -> parseStickerTypeRegular v
      "stickerTypeMask" -> parseStickerTypeMask v
      "stickerTypeCustomEmoji" -> parseStickerTypeCustomEmoji v
      _ -> mempty
    where
      parseStickerTypeRegular :: A.Value -> T.Parser StickerType
      parseStickerTypeRegular = A.withObject "StickerTypeRegular" $ \_ -> return StickerTypeRegular

      parseStickerTypeMask :: A.Value -> T.Parser StickerType
      parseStickerTypeMask = A.withObject "StickerTypeMask" $ \_ -> return StickerTypeMask

      parseStickerTypeCustomEmoji :: A.Value -> T.Parser StickerType
      parseStickerTypeCustomEmoji = A.withObject "StickerTypeCustomEmoji" $ \_ -> return StickerTypeCustomEmoji
  parseJSON _ = mempty

instance T.ToJSON StickerType where
  toJSON StickerTypeRegular =
    A.object
      [ "@type" A..= T.String "stickerTypeRegular"
      ]
  toJSON StickerTypeMask =
    A.object
      [ "@type" A..= T.String "stickerTypeMask"
      ]
  toJSON StickerTypeCustomEmoji =
    A.object
      [ "@type" A..= T.String "stickerTypeCustomEmoji"
      ]
