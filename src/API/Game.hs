-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Game where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

--main = putStrLn "ok"

data Game = 
 Game { animation :: Animation.Animation, photo :: Photo.Photo, description :: String, text :: FormattedText.FormattedText, title :: String, short_name :: String, _id :: Int }  -- deriving (Show)

instance T.ToJSON Game where
 toJSON (Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id }) =
  A.object [ "@type" A..= T.String "game", "animation" A..= animation, "photo" A..= photo, "description" A..= description, "text" A..= text, "title" A..= title, "short_name" A..= short_name, "id" A..= _id ]
-- game Game  { animation :: Animation.Animation, photo :: Photo.Photo, description :: String, text :: FormattedText.FormattedText, title :: String, short_name :: String, _id :: Int } 

