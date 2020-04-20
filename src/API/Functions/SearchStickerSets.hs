-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchStickerSets = 
 SearchStickerSets { query :: String }  -- deriving (Show)

instance T.ToJSON SearchStickerSets where
 toJSON (SearchStickerSets { query = query }) =
  A.object [ "@type" A..= T.String "searchStickerSets", "query" A..= query ]
-- searchStickerSets SearchStickerSets  { query :: String } 

