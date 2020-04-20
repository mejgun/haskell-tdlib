-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetStickerPositionInSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data SetStickerPositionInSet = 
 SetStickerPositionInSet { position :: Int, sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON SetStickerPositionInSet where
 toJSON (SetStickerPositionInSet { position = position, sticker = sticker }) =
  A.object [ "@type" A..= T.String "setStickerPositionInSet", "position" A..= position, "sticker" A..= sticker ]
-- setStickerPositionInSet SetStickerPositionInSet  { position :: Int, sticker :: InputFile.InputFile } 

