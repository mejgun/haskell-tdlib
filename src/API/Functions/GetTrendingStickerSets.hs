-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTrendingStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a list of trending sticker sets. For the optimal performance the number of returned sticker sets is chosen by the library
-- 
-- __offset__ The offset from which to return the sticker sets; must be non-negative
-- 
-- __limit__ The maximum number of sticker sets to be returned; must be non-negative. Fewer sticker sets may be returned than specified by the limit, even if the end of the list has not been reached
data GetTrendingStickerSets = 
 GetTrendingStickerSets deriving (Show, Eq)

instance T.ToJSON GetTrendingStickerSets where
 toJSON (GetTrendingStickerSets {  }) =
  A.object [ "@type" A..= T.String "getTrendingStickerSets" ]

instance T.FromJSON GetTrendingStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTrendingStickerSets" -> parseGetTrendingStickerSets v
   _ -> mempty
  where
   parseGetTrendingStickerSets :: A.Value -> T.Parser GetTrendingStickerSets
   parseGetTrendingStickerSets = A.withObject "GetTrendingStickerSets" $ \o -> do
    return $ GetTrendingStickerSets {  }