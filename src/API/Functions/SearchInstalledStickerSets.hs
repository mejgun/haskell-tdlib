-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchInstalledStickerSets = 
 SearchInstalledStickerSets { limit :: Int, query :: String, is_masks :: Bool }  -- deriving (Show)

instance T.ToJSON SearchInstalledStickerSets where
 toJSON (SearchInstalledStickerSets { limit = limit, query = query, is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "searchInstalledStickerSets", "limit" A..= limit, "query" A..= query, "is_masks" A..= is_masks ]
-- searchInstalledStickerSets SearchInstalledStickerSets  { limit :: Int, query :: String, is_masks :: Bool } 

