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



instance T.FromJSON SearchStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchStickerSets" -> parseSearchStickerSets v
  where
   parseSearchStickerSets :: A.Value -> T.Parser SearchStickerSets
   parseSearchStickerSets = A.withObject "SearchStickerSets" $ \o -> do
    query <- o A..: "query"
    return $ SearchStickerSets { query = query }