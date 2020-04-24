-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInstalledStickerSets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    is_masks <- optional $ o A..: "is_masks"
    return $ GetInstalledStickerSets { is_masks = is_masks }