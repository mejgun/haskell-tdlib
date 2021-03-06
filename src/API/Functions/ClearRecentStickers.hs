-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearRecentStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Clears the list of recently used stickers 
-- 
-- __is_attached__ Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
data ClearRecentStickers = 

 ClearRecentStickers { is_attached :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON ClearRecentStickers where
 toJSON (ClearRecentStickers { is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "clearRecentStickers", "is_attached" A..= is_attached ]

instance T.FromJSON ClearRecentStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearRecentStickers" -> parseClearRecentStickers v
   _ -> mempty
  where
   parseClearRecentStickers :: A.Value -> T.Parser ClearRecentStickers
   parseClearRecentStickers = A.withObject "ClearRecentStickers" $ \o -> do
    is_attached <- o A..:? "is_attached"
    return $ ClearRecentStickers { is_attached = is_attached }