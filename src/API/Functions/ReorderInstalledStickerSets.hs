-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReorderInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ReorderInstalledStickerSets = 
 ReorderInstalledStickerSets { sticker_set_ids :: [Int], is_masks :: Bool }  -- deriving (Show)

instance T.ToJSON ReorderInstalledStickerSets where
 toJSON (ReorderInstalledStickerSets { sticker_set_ids = sticker_set_ids, is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "reorderInstalledStickerSets", "sticker_set_ids" A..= sticker_set_ids, "is_masks" A..= is_masks ]
-- reorderInstalledStickerSets ReorderInstalledStickerSets  { sticker_set_ids :: [Int], is_masks :: Bool } 

