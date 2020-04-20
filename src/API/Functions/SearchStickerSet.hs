-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchStickerSet = 
 SearchStickerSet { name :: String }  -- deriving (Show)

instance T.ToJSON SearchStickerSet where
 toJSON (SearchStickerSet { name = name }) =
  A.object [ "@type" A..= T.String "searchStickerSet", "name" A..= name ]
-- searchStickerSet SearchStickerSet  { name :: String } 

