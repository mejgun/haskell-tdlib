{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Sticker as Sticker
import qualified Utils as U

-- |
data EmojiReaction = -- | Contains information about a emoji reaction
  EmojiReaction
  { -- | Center animation for the reaction; may be null
    center_animation :: Maybe Sticker.Sticker,
    -- | Around animation for the reaction; may be null
    around_animation :: Maybe Sticker.Sticker,
    -- | Effect animation for the reaction
    effect_animation :: Maybe Sticker.Sticker,
    -- | Activate animation for the reaction
    activate_animation :: Maybe Sticker.Sticker,
    -- | Select animation for the reaction
    select_animation :: Maybe Sticker.Sticker,
    -- | Appear animation for the reaction
    appear_animation :: Maybe Sticker.Sticker,
    -- | Static icon for the reaction
    static_icon :: Maybe Sticker.Sticker,
    -- | True, if the reaction can be added to new messages and enabled in chats
    is_active :: Maybe Bool,
    -- | Reaction title
    title :: Maybe String,
    -- | Text representation of the reaction
    emoji :: Maybe String
  }
  deriving (Eq)

instance Show EmojiReaction where
  show
    EmojiReaction
      { center_animation = center_animation_,
        around_animation = around_animation_,
        effect_animation = effect_animation_,
        activate_animation = activate_animation_,
        select_animation = select_animation_,
        appear_animation = appear_animation_,
        static_icon = static_icon_,
        is_active = is_active_,
        title = title_,
        emoji = emoji_
      } =
      "EmojiReaction"
        ++ U.cc
          [ U.p "center_animation" center_animation_,
            U.p "around_animation" around_animation_,
            U.p "effect_animation" effect_animation_,
            U.p "activate_animation" activate_animation_,
            U.p "select_animation" select_animation_,
            U.p "appear_animation" appear_animation_,
            U.p "static_icon" static_icon_,
            U.p "is_active" is_active_,
            U.p "title" title_,
            U.p "emoji" emoji_
          ]

instance T.FromJSON EmojiReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojiReaction" -> parseEmojiReaction v
      _ -> mempty
    where
      parseEmojiReaction :: A.Value -> T.Parser EmojiReaction
      parseEmojiReaction = A.withObject "EmojiReaction" $ \o -> do
        center_animation_ <- o A..:? "center_animation"
        around_animation_ <- o A..:? "around_animation"
        effect_animation_ <- o A..:? "effect_animation"
        activate_animation_ <- o A..:? "activate_animation"
        select_animation_ <- o A..:? "select_animation"
        appear_animation_ <- o A..:? "appear_animation"
        static_icon_ <- o A..:? "static_icon"
        is_active_ <- o A..:? "is_active"
        title_ <- o A..:? "title"
        emoji_ <- o A..:? "emoji"
        return $ EmojiReaction {center_animation = center_animation_, around_animation = around_animation_, effect_animation = effect_animation_, activate_animation = activate_animation_, select_animation = select_animation_, appear_animation = appear_animation_, static_icon = static_icon_, is_active = is_active_, title = title_, emoji = emoji_}
  parseJSON _ = mempty

instance T.ToJSON EmojiReaction where
  toJSON
    EmojiReaction
      { center_animation = center_animation_,
        around_animation = around_animation_,
        effect_animation = effect_animation_,
        activate_animation = activate_animation_,
        select_animation = select_animation_,
        appear_animation = appear_animation_,
        static_icon = static_icon_,
        is_active = is_active_,
        title = title_,
        emoji = emoji_
      } =
      A.object
        [ "@type" A..= T.String "emojiReaction",
          "center_animation" A..= center_animation_,
          "around_animation" A..= around_animation_,
          "effect_animation" A..= effect_animation_,
          "activate_animation" A..= activate_animation_,
          "select_animation" A..= select_animation_,
          "appear_animation" A..= appear_animation_,
          "static_icon" A..= static_icon_,
          "is_active" A..= is_active_,
          "title" A..= title_,
          "emoji" A..= emoji_
        ]
