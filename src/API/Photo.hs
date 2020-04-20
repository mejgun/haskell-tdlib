-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Photo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

--main = putStrLn "ok"

data Photo = 
 Photo { sizes :: [PhotoSize.PhotoSize], minithumbnail :: Minithumbnail.Minithumbnail, has_stickers :: Bool }  -- deriving (Show)

instance T.ToJSON Photo where
 toJSON (Photo { sizes = sizes, minithumbnail = minithumbnail, has_stickers = has_stickers }) =
  A.object [ "@type" A..= T.String "photo", "sizes" A..= sizes, "minithumbnail" A..= minithumbnail, "has_stickers" A..= has_stickers ]
-- photo Photo  { sizes :: [PhotoSize.PhotoSize], minithumbnail :: Minithumbnail.Minithumbnail, has_stickers :: Bool } 

