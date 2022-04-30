-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is non-empty, favorite and recently used stickers may also be returned 
-- 
-- __emoji__ String representation of emoji. If empty, returns all known installed stickers
-- 
-- __limit__ The maximum number of stickers to be returned
data GetStickers = 

 GetStickers { limit :: Maybe Int, emoji :: Maybe String }  deriving (Eq)

instance Show GetStickers where
 show GetStickers { limit=limit, emoji=emoji } =
  "GetStickers" ++ U.cc [U.p "limit" limit, U.p "emoji" emoji ]

instance T.ToJSON GetStickers where
 toJSON GetStickers { limit = limit, emoji = emoji } =
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
 parseJSON _ = mempty
