-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Reaction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Sticker as Sticker

-- |
-- 
-- Contains stickers which must be used for reaction animation rendering
-- 
-- __reaction__ Text representation of the reaction
-- 
-- __title__ Reaction title
-- 
-- __is_active__ True, if the reaction can be added to new messages and enabled in chats
-- 
-- __static_icon__ Static icon for the reaction
-- 
-- __appear_animation__ Appear animation for the reaction
-- 
-- __select_animation__ Select animation for the reaction
-- 
-- __activate_animation__ Activate animation for the reaction
-- 
-- __effect_animation__ Effect animation for the reaction
-- 
-- __around_animation__ Around animation for the reaction; may be null
-- 
-- __center_animation__ Center animation for the reaction; may be null
data Reaction = 

 Reaction { center_animation :: Maybe Sticker.Sticker, around_animation :: Maybe Sticker.Sticker, effect_animation :: Maybe Sticker.Sticker, activate_animation :: Maybe Sticker.Sticker, select_animation :: Maybe Sticker.Sticker, appear_animation :: Maybe Sticker.Sticker, static_icon :: Maybe Sticker.Sticker, is_active :: Maybe Bool, title :: Maybe String, reaction :: Maybe String }  deriving (Eq)

instance Show Reaction where
 show Reaction { center_animation=center_animation, around_animation=around_animation, effect_animation=effect_animation, activate_animation=activate_animation, select_animation=select_animation, appear_animation=appear_animation, static_icon=static_icon, is_active=is_active, title=title, reaction=reaction } =
  "Reaction" ++ cc [p "center_animation" center_animation, p "around_animation" around_animation, p "effect_animation" effect_animation, p "activate_animation" activate_animation, p "select_animation" select_animation, p "appear_animation" appear_animation, p "static_icon" static_icon, p "is_active" is_active, p "title" title, p "reaction" reaction ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Reaction where
 toJSON Reaction { center_animation = center_animation, around_animation = around_animation, effect_animation = effect_animation, activate_animation = activate_animation, select_animation = select_animation, appear_animation = appear_animation, static_icon = static_icon, is_active = is_active, title = title, reaction = reaction } =
  A.object [ "@type" A..= T.String "reaction", "center_animation" A..= center_animation, "around_animation" A..= around_animation, "effect_animation" A..= effect_animation, "activate_animation" A..= activate_animation, "select_animation" A..= select_animation, "appear_animation" A..= appear_animation, "static_icon" A..= static_icon, "is_active" A..= is_active, "title" A..= title, "reaction" A..= reaction ]

instance T.FromJSON Reaction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reaction" -> parseReaction v
   _ -> mempty
  where
   parseReaction :: A.Value -> T.Parser Reaction
   parseReaction = A.withObject "Reaction" $ \o -> do
    center_animation <- o A..:? "center_animation"
    around_animation <- o A..:? "around_animation"
    effect_animation <- o A..:? "effect_animation"
    activate_animation <- o A..:? "activate_animation"
    select_animation <- o A..:? "select_animation"
    appear_animation <- o A..:? "appear_animation"
    static_icon <- o A..:? "static_icon"
    is_active <- o A..:? "is_active"
    title <- o A..:? "title"
    reaction <- o A..:? "reaction"
    return $ Reaction { center_animation = center_animation, around_animation = around_animation, effect_animation = effect_animation, activate_animation = activate_animation, select_animation = select_animation, appear_animation = appear_animation, static_icon = static_icon, is_active = is_active, title = title, reaction = reaction }
 parseJSON _ = mempty
