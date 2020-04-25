-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewTrendingStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ViewTrendingStickerSets = 
 ViewTrendingStickerSets { sticker_set_ids :: Maybe [Int] }  deriving (Show, Eq)

instance T.ToJSON ViewTrendingStickerSets where
 toJSON (ViewTrendingStickerSets { sticker_set_ids = sticker_set_ids }) =
  A.object [ "@type" A..= T.String "viewTrendingStickerSets", "sticker_set_ids" A..= sticker_set_ids ]

instance T.FromJSON ViewTrendingStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "viewTrendingStickerSets" -> parseViewTrendingStickerSets v
   _ -> mempty
  where
   parseViewTrendingStickerSets :: A.Value -> T.Parser ViewTrendingStickerSets
   parseViewTrendingStickerSets = A.withObject "ViewTrendingStickerSets" $ \o -> do
    sticker_set_ids <- o A..:? "sticker_set_ids"
    return $ ViewTrendingStickerSets { sticker_set_ids = sticker_set_ids }