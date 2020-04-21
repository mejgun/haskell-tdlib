-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchInstalledStickerSets = 
 SearchInstalledStickerSets { limit :: Int, query :: String, is_masks :: Bool }  deriving (Show)

instance T.ToJSON SearchInstalledStickerSets where
 toJSON (SearchInstalledStickerSets { limit = limit, query = query, is_masks = is_masks }) =
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
    limit <- o A..: "limit"
    query <- o A..: "query"
    is_masks <- o A..: "is_masks"
    return $ SearchInstalledStickerSets { limit = limit, query = query, is_masks = is_masks }