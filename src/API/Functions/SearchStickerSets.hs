-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results 
-- 
-- __query__ Query to search for
data SearchStickerSets = 
 SearchStickerSets { query :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchStickerSets where
 toJSON (SearchStickerSets { query = query }) =
  A.object [ "@type" A..= T.String "searchStickerSets", "query" A..= query ]

instance T.FromJSON SearchStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchStickerSets" -> parseSearchStickerSets v
   _ -> mempty
  where
   parseSearchStickerSets :: A.Value -> T.Parser SearchStickerSets
   parseSearchStickerSets = A.withObject "SearchStickerSets" $ \o -> do
    query <- o A..:? "query"
    return $ SearchStickerSets { query = query }