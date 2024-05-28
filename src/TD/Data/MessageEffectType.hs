module TD.Data.MessageEffectType
  (MessageEffectType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker

-- | Describes type of emoji effect
data MessageEffectType
  = MessageEffectTypeEmojiReaction -- ^ An effect from an emoji reaction
    { select_animation :: Maybe Sticker.Sticker -- ^ Select animation for the effect in TGS format
    , effect_animation :: Maybe Sticker.Sticker -- ^ Effect animation for the effect in TGS format
    }
  | MessageEffectTypePremiumSticker -- ^ An effect from a premium sticker
    { sticker :: Maybe Sticker.Sticker -- ^ The premium sticker. The effect can be found at sticker.full_type.premium_animation
    }
  deriving (Eq, Show)

instance I.ShortShow MessageEffectType where
  shortShow MessageEffectTypeEmojiReaction
    { select_animation = select_animation_
    , effect_animation = effect_animation_
    }
      = "MessageEffectTypeEmojiReaction"
        ++ I.cc
        [ "select_animation" `I.p` select_animation_
        , "effect_animation" `I.p` effect_animation_
        ]
  shortShow MessageEffectTypePremiumSticker
    { sticker = sticker_
    }
      = "MessageEffectTypePremiumSticker"
        ++ I.cc
        [ "sticker" `I.p` sticker_
        ]

instance AT.FromJSON MessageEffectType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageEffectTypeEmojiReaction"  -> parseMessageEffectTypeEmojiReaction v
      "messageEffectTypePremiumSticker" -> parseMessageEffectTypePremiumSticker v
      _                                 -> mempty
    
    where
      parseMessageEffectTypeEmojiReaction :: A.Value -> AT.Parser MessageEffectType
      parseMessageEffectTypeEmojiReaction = A.withObject "MessageEffectTypeEmojiReaction" $ \o -> do
        select_animation_ <- o A..:?  "select_animation"
        effect_animation_ <- o A..:?  "effect_animation"
        pure $ MessageEffectTypeEmojiReaction
          { select_animation = select_animation_
          , effect_animation = effect_animation_
          }
      parseMessageEffectTypePremiumSticker :: A.Value -> AT.Parser MessageEffectType
      parseMessageEffectTypePremiumSticker = A.withObject "MessageEffectTypePremiumSticker" $ \o -> do
        sticker_ <- o A..:?  "sticker"
        pure $ MessageEffectTypePremiumSticker
          { sticker = sticker_
          }
  parseJSON _ = mempty

