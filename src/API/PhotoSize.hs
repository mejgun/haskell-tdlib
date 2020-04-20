-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhotoSize where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

--main = putStrLn "ok"

data PhotoSize = 
 PhotoSize { height :: Int, width :: Int, photo :: File.File, _type :: String }  -- deriving (Show)

instance T.ToJSON PhotoSize where
 toJSON (PhotoSize { height = height, width = width, photo = photo, _type = _type }) =
  A.object [ "@type" A..= T.String "photoSize", "height" A..= height, "width" A..= width, "photo" A..= photo, "type" A..= _type ]
-- photoSize PhotoSize  { height :: Int, width :: Int, photo :: File.File, _type :: String } 

