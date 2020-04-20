-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetTrendingStickerSets = 
 GetTrendingStickerSets -- deriving (Show)

instance T.ToJSON GetTrendingStickerSets where
 toJSON (GetTrendingStickerSets {  }) =
  A.object [ "@type" A..= T.String "getTrendingStickerSets" ]
-- getTrendingStickerSets GetTrendingStickerSets 

