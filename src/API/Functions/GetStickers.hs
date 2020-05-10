-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned 
-- 
-- __emoji__ String representation of emoji. If empty, returns all known installed stickers
-- 
-- __limit__ The maximum number of stickers to be returned
data GetStickers = 

 GetStickers { limit :: Maybe Int, emoji :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetStickers where
 toJSON (GetStickers { limit = limit, emoji = emoji }) =
  A.object [ "@type" A..= T.String "getStickers", "limit" A..= limit, "emoji" A..= emoji ]

instance T.FromJSON GetStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStickers" -> parseGetStickers v
   _ -> mempty
  where
   parseGetStickers :: A.Value -> T.Parser GetStickers
   parseGetStickers = A.withObject "GetStickers" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    emoji <- o A..:? "emoji"
    return $ GetStickers { limit = limit, emoji = emoji }