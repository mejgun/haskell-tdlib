-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchInstalledStickerSets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchInstalledStickerSets = 
 SearchInstalledStickerSets { limit :: Maybe Int, query :: Maybe String, is_masks :: Maybe Bool }  deriving (Show, Eq)

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
    limit <- optional $ o A..: "limit"
    query <- optional $ o A..: "query"
    is_masks <- optional $ o A..: "is_masks"
    return $ SearchInstalledStickerSets { limit = limit, query = query, is_masks = is_masks }