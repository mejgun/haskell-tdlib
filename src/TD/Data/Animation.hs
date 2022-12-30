{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Animation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data Animation = -- | Describes an animation file. The animation must be encoded in GIF or MPEG4 format
  Animation
  { -- | File containing the animation
    animation :: Maybe File.File,
    -- | Animation thumbnail in JPEG or MPEG4 format; may be null
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Animation minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
    has_stickers :: Maybe Bool,
    -- | MIME type of the file, usually "image/gif" or "video/mp4"
    mime_type :: Maybe String,
    -- | Original name of the file; as defined by the sender
    file_name :: Maybe String,
    -- | Height of the animation
    height :: Maybe Int,
    -- | Width of the animation
    width :: Maybe Int,
    -- | Duration of the animation, in seconds; as defined by the sender
    duration :: Maybe Int
  }
  deriving (Eq)

instance Show Animation where
  show
    Animation
      { animation = animation_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        has_stickers = has_stickers_,
        mime_type = mime_type_,
        file_name = file_name_,
        height = height_,
        width = width_,
        duration = duration_
      } =
      "Animation"
        ++ U.cc
          [ U.p "animation" animation_,
            U.p "thumbnail" thumbnail_,
            U.p "minithumbnail" minithumbnail_,
            U.p "has_stickers" has_stickers_,
            U.p "mime_type" mime_type_,
            U.p "file_name" file_name_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "duration" duration_
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
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        duration_ <- o A..:? "duration"
        return $ Animation {animation = animation_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, has_stickers = has_stickers_, mime_type = mime_type_, file_name = file_name_, height = height_, width = width_, duration = duration_}
  parseJSON _ = mempty

instance T.ToJSON Animation where
  toJSON
    Animation
      { animation = animation_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        has_stickers = has_stickers_,
        mime_type = mime_type_,
        file_name = file_name_,
        height = height_,
        width = width_,
        duration = duration_
      } =
      A.object
        [ "@type" A..= T.String "animation",
          "animation" A..= animation_,
          "thumbnail" A..= thumbnail_,
          "minithumbnail" A..= minithumbnail_,
          "has_stickers" A..= has_stickers_,
          "mime_type" A..= mime_type_,
          "file_name" A..= file_name_,
          "height" A..= height_,
          "width" A..= width_,
          "duration" A..= duration_
        ]
