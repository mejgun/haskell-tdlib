-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFavoriteStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetFavoriteStickers = 
 GetFavoriteStickers -- deriving (Show)

instance T.ToJSON GetFavoriteStickers where
 toJSON (GetFavoriteStickers {  }) =
  A.object [ "@type" A..= T.String "getFavoriteStickers" ]
-- getFavoriteStickers GetFavoriteStickers 

