{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Reaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Sticker as Sticker
import qualified Utils as U

data Reaction = -- | Contains stickers which must be used for reaction animation rendering
  Reaction
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
    reaction :: Maybe String
  }
  deriving (Eq)

instance Show Reaction where
  show
    Reaction
      { center_animation = center_animation_,
        around_animation = around_animation_,
        effect_animation = effect_animation_,
        activate_animation = activate_animation_,
        select_animation = select_animation_,
        appear_animation = appear_animation_,
        static_icon = static_icon_,
        is_active = is_active_,
        title = title_,
        reaction = reaction_
      } =
      "Reaction"
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
            U.p "reaction" reaction_
          ]

instance T.FromJSON Reaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "reaction" -> parseReaction v
      _ -> mempty
    where
      parseReaction :: A.Value -> T.Parser Reaction
      parseReaction = A.withObject "Reaction" $ \o -> do
        center_animation_ <- o A..:? "center_animation"
        around_animation_ <- o A..:? "around_animation"
        effect_animation_ <- o A..:? "effect_animation"
        activate_animation_ <- o A..:? "activate_animation"
        select_animation_ <- o A..:? "select_animation"
        appear_animation_ <- o A..:? "appear_animation"
        static_icon_ <- o A..:? "static_icon"
        is_active_ <- o A..:? "is_active"
        title_ <- o A..:? "title"
        reaction_ <- o A..:? "reaction"
        return $ Reaction {center_animation = center_animation_, around_animation = around_animation_, effect_animation = effect_animation_, activate_animation = activate_animation_, select_animation = select_animation_, appear_animation = appear_animation_, static_icon = static_icon_, is_active = is_active_, title = title_, reaction = reaction_}
  parseJSON _ = mempty

instance T.ToJSON Reaction where
  toJSON
    Reaction
      { center_animation = center_animation_,
        around_animation = around_animation_,
        effect_animation = effect_animation_,
        activate_animation = activate_animation_,
        select_animation = select_animation_,
        appear_animation = appear_animation_,
        static_icon = static_icon_,
        is_active = is_active_,
        title = title_,
        reaction = reaction_
      } =
      A.object
        [ "@type" A..= T.String "reaction",
          "center_animation" A..= center_animation_,
          "around_animation" A..= around_animation_,
          "effect_animation" A..= effect_animation_,
          "activate_animation" A..= activate_animation_,
          "select_animation" A..= select_animation_,
          "appear_animation" A..= appear_animation_,
          "static_icon" A..= static_icon_,
          "is_active" A..= is_active_,
          "title" A..= title_,
          "reaction" A..= reaction_
        ]
