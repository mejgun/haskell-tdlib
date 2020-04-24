-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Game where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

data Game = 
 Game { animation :: Maybe Animation.Animation, photo :: Maybe Photo.Photo, description :: Maybe String, text :: Maybe FormattedText.FormattedText, title :: Maybe String, short_name :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Game where
 toJSON (Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id }) =
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
    animation <- optional $ o A..: "animation"
    photo <- optional $ o A..: "photo"
    description <- optional $ o A..: "description"
    text <- optional $ o A..: "text"
    title <- optional $ o A..: "title"
    short_name <- optional $ o A..: "short_name"
    _id <- optional $ o A..: "id"
    return $ Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id }