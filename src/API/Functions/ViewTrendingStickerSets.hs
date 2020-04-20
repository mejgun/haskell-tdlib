-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewTrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ViewTrendingStickerSets = 
 ViewTrendingStickerSets { sticker_set_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON ViewTrendingStickerSets where
 toJSON (ViewTrendingStickerSets { sticker_set_ids = sticker_set_ids }) =
  A.object [ "@type" A..= T.String "viewTrendingStickerSets", "sticker_set_ids" A..= sticker_set_ids ]
-- viewTrendingStickerSets ViewTrendingStickerSets  { sticker_set_ids :: [Int] } 

