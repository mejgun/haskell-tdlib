-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewTrendingStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs the server that some trending sticker sets have been viewed by the user 
-- 
-- __sticker_set_ids__ Identifiers of viewed trending sticker sets
data ViewTrendingStickerSets = 

 ViewTrendingStickerSets { sticker_set_ids :: Maybe [Int] }  deriving (Eq)

instance Show ViewTrendingStickerSets where
 show ViewTrendingStickerSets { sticker_set_ids=sticker_set_ids } =
  "ViewTrendingStickerSets" ++ cc [p "sticker_set_ids" sticker_set_ids ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ViewTrendingStickerSets where
 toJSON ViewTrendingStickerSets { sticker_set_ids = sticker_set_ids } =
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
 parseJSON _ = mempty
