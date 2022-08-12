{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Sticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath
import qualified TD.Data.File as File
import qualified TD.Data.MaskPosition as MaskPosition
import qualified TD.Data.StickerFormat as StickerFormat
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
    -- |
    is_premium :: Maybe Bool,
    -- | Sticker thumbnail in WEBP or JPEG format; may be null @is_premium True, if only Premium users can use the sticker @premium_animation Premium animation of the sticker; may be null @sticker File containing the sticker
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    outline :: Maybe [ClosedVectorPath.ClosedVectorPath],
    -- | Identifier of the emoji if the sticker is a custom emoji
    custom_emoji_id :: Maybe Int,
    -- |
    mask_position :: Maybe MaskPosition.MaskPosition,
    -- |
    _type :: Maybe StickerType.StickerType,
    -- |
    format :: Maybe StickerFormat.StickerFormat,
    -- | Emoji corresponding to the sticker @format Sticker format @type Sticker type @mask_position Position where the mask is placed; may be null even the sticker is a mask
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
        is_premium = is_premium_,
        thumbnail = thumbnail_,
        outline = outline_,
        custom_emoji_id = custom_emoji_id_,
        mask_position = mask_position_,
        _type = _type_,
        format = format_,
        emoji = emoji_,
        height = height_,
        width = width_,
        set_id = set_id_
      } =
      "Sticker"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "premium_animation" premium_animation_,
            U.p "is_premium" is_premium_,
            U.p "thumbnail" thumbnail_,
            U.p "outline" outline_,
            U.p "custom_emoji_id" custom_emoji_id_,
            U.p "mask_position" mask_position_,
            U.p "_type" _type_,
            U.p "format" format_,
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
        is_premium_ <- o A..:? "is_premium"
        thumbnail_ <- o A..:? "thumbnail"
        outline_ <- o A..:? "outline"
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        mask_position_ <- o A..:? "mask_position"
        _type_ <- o A..:? "type"
        format_ <- o A..:? "format"
        emoji_ <- o A..:? "emoji"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        set_id_ <- U.rm <$> (o A..:? "set_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ Sticker {sticker = sticker_, premium_animation = premium_animation_, is_premium = is_premium_, thumbnail = thumbnail_, outline = outline_, custom_emoji_id = custom_emoji_id_, mask_position = mask_position_, _type = _type_, format = format_, emoji = emoji_, height = height_, width = width_, set_id = set_id_}
  parseJSON _ = mempty

instance T.ToJSON Sticker where
  toJSON
    Sticker
      { sticker = sticker_,
        premium_animation = premium_animation_,
        is_premium = is_premium_,
        thumbnail = thumbnail_,
        outline = outline_,
        custom_emoji_id = custom_emoji_id_,
        mask_position = mask_position_,
        _type = _type_,
        format = format_,
        emoji = emoji_,
        height = height_,
        width = width_,
        set_id = set_id_
      } =
      A.object
        [ "@type" A..= T.String "sticker",
          "sticker" A..= sticker_,
          "premium_animation" A..= premium_animation_,
          "is_premium" A..= is_premium_,
          "thumbnail" A..= thumbnail_,
          "outline" A..= outline_,
          "custom_emoji_id" A..= U.toS custom_emoji_id_,
          "mask_position" A..= mask_position_,
          "type" A..= _type_,
          "format" A..= format_,
          "emoji" A..= emoji_,
          "height" A..= height_,
          "width" A..= width_,
          "set_id" A..= U.toS set_id_
        ]
