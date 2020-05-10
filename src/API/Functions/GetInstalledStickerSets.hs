-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInstalledStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a list of installed sticker sets 
-- 
-- __is_masks__ Pass true to return mask sticker sets; pass false to return ordinary sticker sets
data GetInstalledStickerSets = 

 GetInstalledStickerSets { is_masks :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON GetInstalledStickerSets where
 toJSON (GetInstalledStickerSets { is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "getInstalledStickerSets", "is_masks" A..= is_masks ]

instance T.FromJSON GetInstalledStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInstalledStickerSets" -> parseGetInstalledStickerSets v
   _ -> mempty
  where
   parseGetInstalledStickerSets :: A.Value -> T.Parser GetInstalledStickerSets
   parseGetInstalledStickerSets = A.withObject "GetInstalledStickerSets" $ \o -> do
    is_masks <- o A..:? "is_masks"
    return $ GetInstalledStickerSets { is_masks = is_masks }