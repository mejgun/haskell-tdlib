-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChangeStickerSet = 
 ChangeStickerSet { is_archived :: Bool, is_installed :: Bool, set_id :: Int }  -- deriving (Show)

instance T.ToJSON ChangeStickerSet where
 toJSON (ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id }) =
  A.object [ "@type" A..= T.String "changeStickerSet", "is_archived" A..= is_archived, "is_installed" A..= is_installed, "set_id" A..= set_id ]
-- changeStickerSet ChangeStickerSet  { is_archived :: Bool, is_installed :: Bool, set_id :: Int } 

