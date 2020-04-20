-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickerEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data GetStickerEmojis = 
 GetStickerEmojis { sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON GetStickerEmojis where
 toJSON (GetStickerEmojis { sticker = sticker }) =
  A.object [ "@type" A..= T.String "getStickerEmojis", "sticker" A..= sticker ]
-- getStickerEmojis GetStickerEmojis  { sticker :: InputFile.InputFile } 

