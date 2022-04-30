-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Searches for stickers from public sticker sets that correspond to a given emoji 
-- 
-- __emoji__ String representation of emoji; must be non-empty
-- 
-- __limit__ The maximum number of stickers to be returned
data SearchStickers = 

 SearchStickers { limit :: Maybe Int, emoji :: Maybe String }  deriving (Eq)

instance Show SearchStickers where
 show SearchStickers { limit=limit, emoji=emoji } =
  "SearchStickers" ++ U.cc [U.p "limit" limit, U.p "emoji" emoji ]

instance T.ToJSON SearchStickers where
 toJSON SearchStickers { limit = limit, emoji = emoji } =
  A.object [ "@type" A..= T.String "searchStickers", "limit" A..= limit, "emoji" A..= emoji ]

instance T.FromJSON SearchStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchStickers" -> parseSearchStickers v
   _ -> mempty
  where
   parseSearchStickers :: A.Value -> T.Parser SearchStickers
   parseSearchStickers = A.withObject "SearchStickers" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    emoji <- o A..:? "emoji"
    return $ SearchStickers { limit = limit, emoji = emoji }
 parseJSON _ = mempty
