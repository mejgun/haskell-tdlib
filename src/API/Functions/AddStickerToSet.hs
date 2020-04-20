-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddStickerToSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputSticker as InputSticker

--main = putStrLn "ok"

data AddStickerToSet = 
 AddStickerToSet { sticker :: InputSticker.InputSticker, name :: String, user_id :: Int }  -- deriving (Show)

instance T.ToJSON AddStickerToSet where
 toJSON (AddStickerToSet { sticker = sticker, name = name, user_id = user_id }) =
  A.object [ "@type" A..= T.String "addStickerToSet", "sticker" A..= sticker, "name" A..= name, "user_id" A..= user_id ]
-- addStickerToSet AddStickerToSet  { sticker :: InputSticker.InputSticker, name :: String, user_id :: Int } 

