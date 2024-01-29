module TD.Data.EmojiReaction
  (EmojiReaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data EmojiReaction
  = EmojiReaction -- ^ Contains information about an emoji reaction
    { emoji              :: Maybe T.Text          -- ^ Text representation of the reaction
    , title              :: Maybe T.Text          -- ^ Reaction title
    , is_active          :: Maybe Bool            -- ^ True, if the reaction can be added to new messages and enabled in chats
    , static_icon        :: Maybe Sticker.Sticker -- ^ Static icon for the reaction
    , appear_animation   :: Maybe Sticker.Sticker -- ^ Appear animation for the reaction
    , select_animation   :: Maybe Sticker.Sticker -- ^ Select animation for the reaction
    , activate_animation :: Maybe Sticker.Sticker -- ^ Activate animation for the reaction
    , effect_animation   :: Maybe Sticker.Sticker -- ^ Effect animation for the reaction
    , around_animation   :: Maybe Sticker.Sticker -- ^ Around animation for the reaction; may be null
    , center_animation   :: Maybe Sticker.Sticker -- ^ Center animation for the reaction; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiReaction where
  shortShow EmojiReaction
    { emoji              = emoji_
    , title              = title_
    , is_active          = is_active_
    , static_icon        = static_icon_
    , appear_animation   = appear_animation_
    , select_animation   = select_animation_
    , activate_animation = activate_animation_
    , effect_animation   = effect_animation_
    , around_animation   = around_animation_
    , center_animation   = center_animation_
    }
      = "EmojiReaction"
        ++ I.cc
        [ "emoji"              `I.p` emoji_
        , "title"              `I.p` title_
        , "is_active"          `I.p` is_active_
        , "static_icon"        `I.p` static_icon_
        , "appear_animation"   `I.p` appear_animation_
        , "select_animation"   `I.p` select_animation_
        , "activate_animation" `I.p` activate_animation_
        , "effect_animation"   `I.p` effect_animation_
        , "around_animation"   `I.p` around_animation_
        , "center_animation"   `I.p` center_animation_
        ]

instance AT.FromJSON EmojiReaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiReaction" -> parseEmojiReaction v
      _               -> mempty
    
    where
      parseEmojiReaction :: A.Value -> AT.Parser EmojiReaction
      parseEmojiReaction = A.withObject "EmojiReaction" $ \o -> do
        emoji_              <- o A..:?  "emoji"
        title_              <- o A..:?  "title"
        is_active_          <- o A..:?  "is_active"
        static_icon_        <- o A..:?  "static_icon"
        appear_animation_   <- o A..:?  "appear_animation"
        select_animation_   <- o A..:?  "select_animation"
        activate_animation_ <- o A..:?  "activate_animation"
        effect_animation_   <- o A..:?  "effect_animation"
        around_animation_   <- o A..:?  "around_animation"
        center_animation_   <- o A..:?  "center_animation"
        pure $ EmojiReaction
          { emoji              = emoji_
          , title              = title_
          , is_active          = is_active_
          , static_icon        = static_icon_
          , appear_animation   = appear_animation_
          , select_animation   = select_animation_
          , activate_animation = activate_animation_
          , effect_animation   = effect_animation_
          , around_animation   = around_animation_
          , center_animation   = center_animation_
          }
  parseJSON _ = mempty

