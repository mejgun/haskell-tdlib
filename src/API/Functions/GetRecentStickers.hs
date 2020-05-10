-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a list of recently used stickers 
-- 
-- __is_attached__ Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
data GetRecentStickers = 

 GetRecentStickers { is_attached :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON GetRecentStickers where
 toJSON (GetRecentStickers { is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "getRecentStickers", "is_attached" A..= is_attached ]

instance T.FromJSON GetRecentStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentStickers" -> parseGetRecentStickers v
   _ -> mempty
  where
   parseGetRecentStickers :: A.Value -> T.Parser GetRecentStickers
   parseGetRecentStickers = A.withObject "GetRecentStickers" $ \o -> do
    is_attached <- o A..:? "is_attached"
    return $ GetRecentStickers { is_attached = is_attached }