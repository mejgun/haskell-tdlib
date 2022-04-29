-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetArchivedStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a list of archived sticker sets 
-- 
-- __is_masks__ Pass true to return mask stickers sets; pass false to return ordinary sticker sets
-- 
-- __offset_sticker_set_id__ Identifier of the sticker set from which to return the result
-- 
-- __limit__ The maximum number of sticker sets to return; up to 100
data GetArchivedStickerSets = 

 GetArchivedStickerSets { limit :: Maybe Int, offset_sticker_set_id :: Maybe Int, is_masks :: Maybe Bool }  deriving (Eq)

instance Show GetArchivedStickerSets where
 show GetArchivedStickerSets { limit=limit, offset_sticker_set_id=offset_sticker_set_id, is_masks=is_masks } =
  "GetArchivedStickerSets" ++ cc [p "limit" limit, p "offset_sticker_set_id" offset_sticker_set_id, p "is_masks" is_masks ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetArchivedStickerSets where
 toJSON GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks } =
  A.object [ "@type" A..= T.String "getArchivedStickerSets", "limit" A..= limit, "offset_sticker_set_id" A..= offset_sticker_set_id, "is_masks" A..= is_masks ]

instance T.FromJSON GetArchivedStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getArchivedStickerSets" -> parseGetArchivedStickerSets v
   _ -> mempty
  where
   parseGetArchivedStickerSets :: A.Value -> T.Parser GetArchivedStickerSets
   parseGetArchivedStickerSets = A.withObject "GetArchivedStickerSets" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_sticker_set_id <- mconcat [ o A..:? "offset_sticker_set_id", readMaybe <$> (o A..: "offset_sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_masks <- o A..:? "is_masks"
    return $ GetArchivedStickerSets { limit = limit, offset_sticker_set_id = offset_sticker_set_id, is_masks = is_masks }
 parseJSON _ = mempty
