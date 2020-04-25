-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchStickerSet = 
 SearchStickerSet { name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchStickerSet where
 toJSON (SearchStickerSet { name = name }) =
  A.object [ "@type" A..= T.String "searchStickerSet", "name" A..= name ]

instance T.FromJSON SearchStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchStickerSet" -> parseSearchStickerSet v
   _ -> mempty
  where
   parseSearchStickerSet :: A.Value -> T.Parser SearchStickerSet
   parseSearchStickerSet = A.withObject "SearchStickerSet" $ \o -> do
    name <- o A..:? "name"
    return $ SearchStickerSet { name = name }