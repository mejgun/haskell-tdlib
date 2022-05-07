{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Animation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

data Animation = -- | Describes an animation file. The animation must be encoded in GIF or MPEG4 format @duration Duration of the animation, in seconds; as defined by the sender @width Width of the animation @height Height of the animation
  Animation
  { -- |
    animation :: Maybe File.File,
    -- |
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Animation minithumbnail; may be null @thumbnail Animation thumbnail in JPEG or MPEG4 format; may be null @animation File containing the animation
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
    has_stickers :: Maybe Bool,
    -- |
    mime_type :: Maybe String,
    -- | Original name of the file; as defined by the sender @mime_type MIME type of the file, usually "image/gif" or "video/mp4"
    file_name :: Maybe String,
    -- |
    height :: Maybe Int,
    -- |
    width :: Maybe Int,
    -- |
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show Animation where
  show
    Animation
      { animation = animation,
        thumbnail = thumbnail,
        minithumbnail = minithumbnail,
        has_stickers = has_stickers,
        mime_type = mime_type,
        file_name = file_name,
        height = height,
        width = width,
        duration = duration
      } =
      "Animation"
        ++ U.cc
          [ U.p "animation" animation,
            U.p "thumbnail" thumbnail,
            U.p "minithumbnail" minithumbnail,
            U.p "has_stickers" has_stickers,
            U.p "mime_type" mime_type,
            U.p "file_name" file_name,
            U.p "height" height,
            U.p "width" width,
            U.p "duration" duration
          ]

instance T.FromJSON Animation where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "animation" -> parseAnimation v
      _ -> mempty
    where
      parseAnimation :: A.Value -> T.Parser Animation
      parseAnimation = A.withObject "Animation" $ \o -> do
        animation_ <- o A..:? "animation"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        has_stickers_ <- o A..:? "has_stickers"
        mime_type_ <- o A..:? "mime_type"
        file_name_ <- o A..:? "file_name"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Animation {animation = animation_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, has_stickers = has_stickers_, mime_type = mime_type_, file_name = file_name_, height = height_, width = width_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON Animation where
  toJSON
    Animation
      { animation = animation,
        thumbnail = thumbnail,
        minithumbnail = minithumbnail,
        has_stickers = has_stickers,
        mime_type = mime_type,
        file_name = file_name,
        height = height,
        width = width,
        duration = duration
      } =
      A.object
        [ "@type" A..= T.String "animation",
          "animation" A..= animation,
          "thumbnail" A..= thumbnail,
          "minithumbnail" A..= minithumbnail,
          "has_stickers" A..= has_stickers,
          "mime_type" A..= mime_type,
          "file_name" A..= file_name,
          "height" A..= height,
          "width" A..= width,
          "duration" A..= duration
        ]
