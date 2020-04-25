-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTrendingStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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