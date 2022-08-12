{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StickerFormat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes format of a sticker
data StickerFormat
  = -- | The sticker is an image in WEBP format
    StickerFormatWebp
  | -- | The sticker is an animation in TGS format
    StickerFormatTgs
  | -- | The sticker is a video in WEBM format
    StickerFormatWebm
  deriving (Eq)

instance Show StickerFormat where
  show StickerFormatWebp =
    "StickerFormatWebp"
      ++ U.cc
        []
  show StickerFormatTgs =
    "StickerFormatTgs"
      ++ U.cc
        []
  show StickerFormatWebm =
    "StickerFormatWebm"
      ++ U.cc
        []

instance T.FromJSON StickerFormat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickerFormatWebp" -> parseStickerFormatWebp v
      "stickerFormatTgs" -> parseStickerFormatTgs v
      "stickerFormatWebm" -> parseStickerFormatWebm v
      _ -> mempty
    where
      parseStickerFormatWebp :: A.Value -> T.Parser StickerFormat
      parseStickerFormatWebp = A.withObject "StickerFormatWebp" $ \_ -> return StickerFormatWebp

      parseStickerFormatTgs :: A.Value -> T.Parser StickerFormat
      parseStickerFormatTgs = A.withObject "StickerFormatTgs" $ \_ -> return StickerFormatTgs

      parseStickerFormatWebm :: A.Value -> T.Parser StickerFormat
      parseStickerFormatWebm = A.withObject "StickerFormatWebm" $ \_ -> return StickerFormatWebm
  parseJSON _ = mempty

instance T.ToJSON StickerFormat where
  toJSON StickerFormatWebp =
    A.object
      [ "@type" A..= T.String "stickerFormatWebp"
      ]
  toJSON StickerFormatTgs =
    A.object
      [ "@type" A..= T.String "stickerFormatTgs"
      ]
  toJSON StickerFormatWebm =
    A.object
      [ "@type" A..= T.String "stickerFormatWebm"
      ]
