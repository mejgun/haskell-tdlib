-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetArchivedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetArchivedStickerSets = 
 GetArchivedStickerSets { limit :: Int, offset_sticker_set_id :: Int, is_masks :: Bool }  -- deriving (Show)

instance T.ToJSON GetArchivedStickerSets where
 toJSON (GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "getArchivedStickerSets", "limit" A..= limit, "offset_sticker_set_id" A..= offset_sticker_set_id, "is_masks" A..= is_masks ]
-- getArchivedStickerSets GetArchivedStickerSets  { limit :: Int, offset_sticker_set_id :: Int, is_masks :: Bool } 

