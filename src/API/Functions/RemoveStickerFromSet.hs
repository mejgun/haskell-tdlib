-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveStickerFromSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data RemoveStickerFromSet = 
 RemoveStickerFromSet { sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON RemoveStickerFromSet where
 toJSON (RemoveStickerFromSet { sticker = sticker }) =
  A.object [ "@type" A..= T.String "removeStickerFromSet", "sticker" A..= sticker ]
-- removeStickerFromSet RemoveStickerFromSet  { sticker :: InputFile.InputFile } 

