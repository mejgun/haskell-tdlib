{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StickerFullType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.MaskPosition as MaskPosition
import qualified Utils as U

-- | Contains full information about sticker type
data StickerFullType
  = -- | The sticker is a regular sticker @premium_animation Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker
    StickerFullTypeRegular
      { -- |
        premium_animation :: Maybe File.File
      }
  | -- | The sticker is a mask in WEBP format to be placed on photos or videos @mask_position Position where the mask is placed; may be null
    StickerFullTypeMask
      { -- |
        mask_position :: Maybe MaskPosition.MaskPosition
      }
  | -- | The sticker is a custom emoji to be used inside message text and caption. Currently, only Telegram Premium users can use custom emoji
    StickerFullTypeCustomEmoji
      { -- | True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, or another appropriate color in other places
        needs_repainting :: Maybe Bool,
        -- | Identifier of the custom emoji
        custom_emoji_id :: Maybe Int
      }
  deriving (Eq)

instance Show StickerFullType where
  show
    StickerFullTypeRegular
      { premium_animation = premium_animation_
      } =
      "StickerFullTypeRegular"
        ++ U.cc
          [ U.p "premium_animation" premium_animation_
          ]
  show
    StickerFullTypeMask
      { mask_position = mask_position_
      } =
      "StickerFullTypeMask"
        ++ U.cc
          [ U.p "mask_position" mask_position_
          ]
  show
    StickerFullTypeCustomEmoji
      { needs_repainting = needs_repainting_,
        custom_emoji_id = custom_emoji_id_
      } =
      "StickerFullTypeCustomEmoji"
        ++ U.cc
          [ U.p "needs_repainting" needs_repainting_,
            U.p "custom_emoji_id" custom_emoji_id_
          ]

instance T.FromJSON StickerFullType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickerFullTypeRegular" -> parseStickerFullTypeRegular v
      "stickerFullTypeMask" -> parseStickerFullTypeMask v
      "stickerFullTypeCustomEmoji" -> parseStickerFullTypeCustomEmoji v
      _ -> mempty
    where
      parseStickerFullTypeRegular :: A.Value -> T.Parser StickerFullType
      parseStickerFullTypeRegular = A.withObject "StickerFullTypeRegular" $ \o -> do
        premium_animation_ <- o A..:? "premium_animation"
        return $ StickerFullTypeRegular {premium_animation = premium_animation_}

      parseStickerFullTypeMask :: A.Value -> T.Parser StickerFullType
      parseStickerFullTypeMask = A.withObject "StickerFullTypeMask" $ \o -> do
        mask_position_ <- o A..:? "mask_position"
        return $ StickerFullTypeMask {mask_position = mask_position_}

      parseStickerFullTypeCustomEmoji :: A.Value -> T.Parser StickerFullType
      parseStickerFullTypeCustomEmoji = A.withObject "StickerFullTypeCustomEmoji" $ \o -> do
        needs_repainting_ <- o A..:? "needs_repainting"
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ StickerFullTypeCustomEmoji {needs_repainting = needs_repainting_, custom_emoji_id = custom_emoji_id_}
  parseJSON _ = mempty

instance T.ToJSON StickerFullType where
  toJSON
    StickerFullTypeRegular
      { premium_animation = premium_animation_
      } =
      A.object
        [ "@type" A..= T.String "stickerFullTypeRegular",
          "premium_animation" A..= premium_animation_
        ]
  toJSON
    StickerFullTypeMask
      { mask_position = mask_position_
      } =
      A.object
        [ "@type" A..= T.String "stickerFullTypeMask",
          "mask_position" A..= mask_position_
        ]
  toJSON
    StickerFullTypeCustomEmoji
      { needs_repainting = needs_repainting_,
        custom_emoji_id = custom_emoji_id_
      } =
      A.object
        [ "@type" A..= T.String "stickerFullTypeCustomEmoji",
          "needs_repainting" A..= needs_repainting_,
          "custom_emoji_id" A..= U.toS custom_emoji_id_
        ]
