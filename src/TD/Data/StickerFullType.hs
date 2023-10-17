module TD.Data.StickerFullType
  (StickerFullType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File
import qualified TD.Data.MaskPosition as MaskPosition

-- | Contains full information about sticker type
data StickerFullType
  = StickerFullTypeRegular -- ^ The sticker is a regular sticker
    { premium_animation :: Maybe File.File -- ^ Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker
    }
  | StickerFullTypeMask -- ^ The sticker is a mask in WEBP format to be placed on photos or videos
    { mask_position :: Maybe MaskPosition.MaskPosition -- ^ Position where the mask is placed; may be null
    }
  | StickerFullTypeCustomEmoji -- ^ The sticker is a custom emoji to be used inside message text and caption. Currently, only Telegram Premium users can use custom emoji
    { custom_emoji_id  :: Maybe Int  -- ^ Identifier of the custom emoji
    , needs_repainting :: Maybe Bool -- ^ True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
    }
  deriving (Eq, Show)

instance I.ShortShow StickerFullType where
  shortShow StickerFullTypeRegular
    { premium_animation = premium_animation_
    }
      = "StickerFullTypeRegular"
        ++ I.cc
        [ "premium_animation" `I.p` premium_animation_
        ]
  shortShow StickerFullTypeMask
    { mask_position = mask_position_
    }
      = "StickerFullTypeMask"
        ++ I.cc
        [ "mask_position" `I.p` mask_position_
        ]
  shortShow StickerFullTypeCustomEmoji
    { custom_emoji_id  = custom_emoji_id_
    , needs_repainting = needs_repainting_
    }
      = "StickerFullTypeCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id"  `I.p` custom_emoji_id_
        , "needs_repainting" `I.p` needs_repainting_
        ]

instance AT.FromJSON StickerFullType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickerFullTypeRegular"     -> parseStickerFullTypeRegular v
      "stickerFullTypeMask"        -> parseStickerFullTypeMask v
      "stickerFullTypeCustomEmoji" -> parseStickerFullTypeCustomEmoji v
      _                            -> mempty
    
    where
      parseStickerFullTypeRegular :: A.Value -> AT.Parser StickerFullType
      parseStickerFullTypeRegular = A.withObject "StickerFullTypeRegular" $ \o -> do
        premium_animation_ <- o A..:?  "premium_animation"
        pure $ StickerFullTypeRegular
          { premium_animation = premium_animation_
          }
      parseStickerFullTypeMask :: A.Value -> AT.Parser StickerFullType
      parseStickerFullTypeMask = A.withObject "StickerFullTypeMask" $ \o -> do
        mask_position_ <- o A..:?  "mask_position"
        pure $ StickerFullTypeMask
          { mask_position = mask_position_
          }
      parseStickerFullTypeCustomEmoji :: A.Value -> AT.Parser StickerFullType
      parseStickerFullTypeCustomEmoji = A.withObject "StickerFullTypeCustomEmoji" $ \o -> do
        custom_emoji_id_  <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        needs_repainting_ <- o A..:?                       "needs_repainting"
        pure $ StickerFullTypeCustomEmoji
          { custom_emoji_id  = custom_emoji_id_
          , needs_repainting = needs_repainting_
          }
  parseJSON _ = mempty

