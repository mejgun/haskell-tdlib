-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTrendingStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
-- 
-- __offset__ The offset from which to return the sticker sets; must be non-negative
-- 
-- __limit__ The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
data GetTrendingStickerSets = 

 GetTrendingStickerSets { limit :: Maybe Int, offset :: Maybe Int }  deriving (Eq)

instance Show GetTrendingStickerSets where
 show GetTrendingStickerSets { limit=limit, offset=offset } =
  "GetTrendingStickerSets" ++ U.cc [U.p "limit" limit, U.p "offset" offset ]

instance T.ToJSON GetTrendingStickerSets where
 toJSON GetTrendingStickerSets { limit = limit, offset = offset } =
  A.object [ "@type" A..= T.String "getTrendingStickerSets", "limit" A..= limit, "offset" A..= offset ]

instance T.FromJSON GetTrendingStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTrendingStickerSets" -> parseGetTrendingStickerSets v
   _ -> mempty
  where
   parseGetTrendingStickerSets :: A.Value -> T.Parser GetTrendingStickerSets
   parseGetTrendingStickerSets = A.withObject "GetTrendingStickerSets" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetTrendingStickerSets { limit = limit, offset = offset }
 parseJSON _ = mempty
