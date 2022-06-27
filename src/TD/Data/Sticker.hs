{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Sticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.File as File
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data Sticker = -- | Describes a sticker @set_id The identifier of the sticker set to which the sticker belongs; 0 if none @width Sticker width; as defined by the sender @height Sticker height; as defined by the sender
  Sticker
  { -- |
    sticker :: Maybe File.File,
    -- |
    premium_animation :: Maybe File.File,
    -- | Sticker thumbnail in WEBP or JPEG format; may be null @premium_animation Premium animation of the sticker; may be null. If present, only Premium users can send the sticker @sticker File containing the sticker
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
      { sticker = sticker_,
        premium_animation = premium_animation_,
        thumbnail = thumbnail_,
        outline = outline_,
        _type = _type_,
        emoji = emoji_,
        height = height_,
        width = width_,
        set_id = set_id_
      } =
      "Sticker"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "premium_animation" premium_animation_,
            U.p "thumbnail" thumbnail_,
            U.p "outline" outline_,
            U.p "_type" _type_,
            U.p "emoji" emoji_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "set_id" set_id_
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
        premium_animation_ <- o A..:? "premium_animation"
        thumbnail_ <- o A..:? "thumbnail"
        outline_ <- o A..:? "outline"
        _type_ <- o A..:? "type"
        emoji_ <- o A..:? "emoji"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        set_id_ <- U.rm <$> (o A..:? "set_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ Sticker {sticker = sticker_, premium_animation = premium_animation_, thumbnail = thumbnail_, outline = outline_, _type = _type_, emoji = emoji_, height = height_, width = width_, set_id = set_id_}
  parseJSON _ = mempty

instance T.ToJSON Sticker where
  toJSON
    Sticker
      { sticker = sticker_,
        premium_animation = premium_animation_,
        thumbnail = thumbnail_,
        outline = outline_,
        _type = _type_,
        emoji = emoji_,
        height = height_,
        width = width_,
        set_id = set_id_
      } =
      A.object
        [ "@type" A..= T.String "sticker",
          "sticker" A..= sticker_,
          "premium_animation" A..= premium_animation_,
          "thumbnail" A..= thumbnail_,
          "outline" A..= outline_,
          "type" A..= _type_,
          "emoji" A..= emoji_,
          "height" A..= height_,
          "width" A..= width_,
          "set_id" A..= U.toS set_id_
        ]
