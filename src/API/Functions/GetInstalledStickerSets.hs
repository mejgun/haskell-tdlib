-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetInstalledStickerSets = 
 GetInstalledStickerSets { is_masks :: Bool }  -- deriving (Show)

instance T.ToJSON GetInstalledStickerSets where
 toJSON (GetInstalledStickerSets { is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "getInstalledStickerSets", "is_masks" A..= is_masks ]
-- getInstalledStickerSets GetInstalledStickerSets  { is_masks :: Bool } 

