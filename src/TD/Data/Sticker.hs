{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Sticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.File as File
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerFullType as StickerFullType
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data Sticker = -- | Describes a sticker
  Sticker
  { -- | File containing the sticker
    sticker :: Maybe File.File,
    -- | Sticker thumbnail in WEBP or JPEG format; may be null
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    outline :: Maybe [ClosedVectorPath.ClosedVectorPath],
    -- | Sticker's full type
    full_type :: Maybe StickerFullType.StickerFullType,
    -- | Sticker format
    format :: Maybe StickerFormat.StickerFormat,
    -- | Emoji corresponding to the sticker
    emoji :: Maybe String,
    -- | Sticker height; as defined by the sender
    height :: Maybe Int,
    -- | Sticker width; as defined by the sender
    width :: Maybe Int,
    -- | Identifier of the sticker set to which the sticker belongs; 0 if none
    set_id :: Maybe Int,
    -- | Unique sticker identifier within the set; 0 if none
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Sticker where
  show
    Sticker
      { sticker = sticker_,
        thumbnail = thumbnail_,
        outline = outline_,
        full_type = full_type_,
        format = format_,
        emoji = emoji_,
        height = height_,
        width = width_,
        set_id = set_id_,
        _id = _id_
      } =
      "Sticker"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "thumbnail" thumbnail_,
            U.p "outline" outline_,
            U.p "full_type" full_type_,
            U.p "format" format_,
            U.p "emoji" emoji_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "set_id" set_id_,
            U.p "_id" _id_
          ]

instance T.FromJSON Sticker where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "sticker" -> parseSticker v
      _ -> mempty
    where
      parseSticker :: A.Value -> T.Parser Sticker
      parseSticker = A.withObject "Sticker" $ \o -> do
        sticker_ <- o A..:? "sticker"
        thumbnail_ <- o A..:? "thumbnail"
        outline_ <- o A..:? "outline"
        full_type_ <- o A..:? "full_type"
        format_ <- o A..:? "format"
        emoji_ <- o A..:? "emoji"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        set_id_ <- U.rm <$> (o A..:? "set_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ Sticker {sticker = sticker_, thumbnail = thumbnail_, outline = outline_, full_type = full_type_, format = format_, emoji = emoji_, height = height_, width = width_, set_id = set_id_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Sticker where
  toJSON
    Sticker
      { sticker = sticker_,
        thumbnail = thumbnail_,
        outline = outline_,
        full_type = full_type_,
        format = format_,
        emoji = emoji_,
        height = height_,
        width = width_,
        set_id = set_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "sticker",
          "sticker" A..= sticker_,
          "thumbnail" A..= thumbnail_,
          "outline" A..= outline_,
          "full_type" A..= full_type_,
          "format" A..= format_,
          "emoji" A..= emoji_,
          "height" A..= height_,
          "width" A..= width_,
          "set_id" A..= U.toS set_id_,
          "id" A..= U.toS _id_
        ]
