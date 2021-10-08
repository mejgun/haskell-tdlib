-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Game where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Describes a game 
-- 
-- __id__ Game ID
-- 
-- __short_name__ Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name}
-- 
-- __title__ Game title
-- 
-- __text__ Game text, usually containing scoreboards for a game
-- 
-- __param_description__ Game description
-- 
-- __photo__ Game photo
-- 
-- __animation__ Game animation; may be null
data Game = 

 Game { animation :: Maybe Animation.Animation, photo :: Maybe Photo.Photo, description :: Maybe String, text :: Maybe FormattedText.FormattedText, title :: Maybe String, short_name :: Maybe String, _id :: Maybe Int }  deriving (Eq)

instance Show Game where
 show Game { animation=animation, photo=photo, description=description, text=text, title=title, short_name=short_name, _id=_id } =
  "Game" ++ cc [p "animation" animation, p "photo" photo, p "description" description, p "text" text, p "title" title, p "short_name" short_name, p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Game where
 toJSON Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id } =
  A.object [ "@type" A..= T.String "game", "animation" A..= animation, "photo" A..= photo, "description" A..= description, "text" A..= text, "title" A..= title, "short_name" A..= short_name, "id" A..= _id ]

instance T.FromJSON Game where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "game" -> parseGame v
   _ -> mempty
  where
   parseGame :: A.Value -> T.Parser Game
   parseGame = A.withObject "Game" $ \o -> do
    animation <- o A..:? "animation"
    photo <- o A..:? "photo"
    description <- o A..:? "description"
    text <- o A..:? "text"
    title <- o A..:? "title"
    short_name <- o A..:? "short_name"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id }
 parseJSON _ = mempty
