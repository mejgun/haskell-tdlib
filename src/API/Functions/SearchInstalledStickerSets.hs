-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchInstalledStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Searches for installed sticker sets by looking for specified query in their title and name 
-- 
-- __is_masks__ Pass true to return mask sticker sets; pass false to return ordinary sticker sets
-- 
-- __query__ Query to search for
-- 
-- __limit__ The maximum number of sticker sets to return
data SearchInstalledStickerSets = 

 SearchInstalledStickerSets { limit :: Maybe Int, query :: Maybe String, is_masks :: Maybe Bool }  deriving (Eq)

instance Show SearchInstalledStickerSets where
 show SearchInstalledStickerSets { limit=limit, query=query, is_masks=is_masks } =
  "SearchInstalledStickerSets" ++ U.cc [U.p "limit" limit, U.p "query" query, U.p "is_masks" is_masks ]

instance T.ToJSON SearchInstalledStickerSets where
 toJSON SearchInstalledStickerSets { limit = limit, query = query, is_masks = is_masks } =
  A.object [ "@type" A..= T.String "searchInstalledStickerSets", "limit" A..= limit, "query" A..= query, "is_masks" A..= is_masks ]

instance T.FromJSON SearchInstalledStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchInstalledStickerSets" -> parseSearchInstalledStickerSets v
   _ -> mempty
  where
   parseSearchInstalledStickerSets :: A.Value -> T.Parser SearchInstalledStickerSets
   parseSearchInstalledStickerSets = A.withObject "SearchInstalledStickerSets" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    is_masks <- o A..:? "is_masks"
    return $ SearchInstalledStickerSets { limit = limit, query = query, is_masks = is_masks }
 parseJSON _ = mempty
