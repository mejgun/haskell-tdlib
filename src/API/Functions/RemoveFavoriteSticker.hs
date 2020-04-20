-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveFavoriteSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data RemoveFavoriteSticker = 
 RemoveFavoriteSticker { sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON RemoveFavoriteSticker where
 toJSON (RemoveFavoriteSticker { sticker = sticker }) =
  A.object [ "@type" A..= T.String "removeFavoriteSticker", "sticker" A..= sticker ]
-- removeFavoriteSticker RemoveFavoriteSticker  { sticker :: InputFile.InputFile } 

