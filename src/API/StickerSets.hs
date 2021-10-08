-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.StickerSetInfo as StickerSetInfo

-- |
-- 
-- Represents a list of sticker sets 
-- 
-- __total_count__ Approximate total number of sticker sets found
-- 
-- __sets__ List of sticker sets
data StickerSets = 

 StickerSets { sets :: Maybe [StickerSetInfo.StickerSetInfo], total_count :: Maybe Int }  deriving (Eq)

instance Show StickerSets where
 show StickerSets { sets=sets, total_count=total_count } =
  "StickerSets" ++ cc [p "sets" sets, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON StickerSets where
 toJSON StickerSets { sets = sets, total_count = total_count } =
  A.object [ "@type" A..= T.String "stickerSets", "sets" A..= sets, "total_count" A..= total_count ]

instance T.FromJSON StickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerSets" -> parseStickerSets v
   _ -> mempty
  where
   parseStickerSets :: A.Value -> T.Parser StickerSets
   parseStickerSets = A.withObject "StickerSets" $ \o -> do
    sets <- o A..:? "sets"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StickerSets { sets = sets, total_count = total_count }
 parseJSON _ = mempty
