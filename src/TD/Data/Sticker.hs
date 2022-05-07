{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Sticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.File as File
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

data Sticker = -- | Describes a sticker @set_id The identifier of the sticker set to which the sticker belongs; 0 if none @width Sticker width; as defined by the sender @height Sticker height; as defined by the sender
  Sticker
  { -- |
    sticker :: Maybe File.File,
    -- | Sticker thumbnail in WEBP or JPEG format; may be null @sticker File containing the sticker
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- |
    outline :: Maybe [ClosedVectorPath.ClosedVectorPath],
    -- |
    _type :: Maybe StickerType.StickerType,
    -- | Emoji corresponding to the sticker @type Sticker type @outline Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    emoji :: Maybe String,
    -- |
    height :: Maybe Int,
    -- |
    width :: Maybe Int,
    -- |
    set_id :: Maybe Int
  }
  deriving (Eq)

instance Show Sticker where
  show
    Sticker
      { sticker = sticker,
        thumbnail = thumbnail,
        outline = outline,
        _type = _type,
        emoji = emoji,
        height = height,
        width = width,
        set_id = set_id
      } =
      "Sticker"
        ++ U.cc
          [ U.p "sticker" sticker,
            U.p "thumbnail" thumbnail,
            U.p "outline" outline,
            U.p "_type" _type,
            U.p "emoji" emoji,
            U.p "height" height,
            U.p "width" width,
            U.p "set_id" set_id
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
        _type_ <- o A..:? "type"
        emoji_ <- o A..:? "emoji"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        set_id_ <- mconcat [o A..:? "set_id", U.rm <$> (o A..: "set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Sticker {sticker = sticker_, thumbnail = thumbnail_, outline = outline_, _type = _type_, emoji = emoji_, height = height_, width = width_, set_id = set_id_}
  parseJSON _ = mempty

instance T.ToJSON Sticker where
  toJSON
    Sticker
      { sticker = sticker,
        thumbnail = thumbnail,
        outline = outline,
        _type = _type,
        emoji = emoji,
        height = height,
        width = width,
        set_id = set_id
      } =
      A.object
        [ "@type" A..= T.String "sticker",
          "sticker" A..= sticker,
          "thumbnail" A..= thumbnail,
          "outline" A..= outline,
          "type" A..= _type,
          "emoji" A..= emoji,
          "height" A..= height,
          "width" A..= width,
          "set_id" A..= set_id
        ]
