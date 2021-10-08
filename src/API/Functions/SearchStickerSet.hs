-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for a sticker set by its name 
-- 
-- __name__ Name of the sticker set
data SearchStickerSet = 

 SearchStickerSet { name :: Maybe String }  deriving (Eq)

instance Show SearchStickerSet where
 show SearchStickerSet { name=name } =
  "SearchStickerSet" ++ cc [p "name" name ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchStickerSet where
 toJSON SearchStickerSet { name = name } =
  A.object [ "@type" A..= T.String "searchStickerSet", "name" A..= name ]

instance T.FromJSON SearchStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchStickerSet" -> parseSearchStickerSet v
   _ -> mempty
  where
   parseSearchStickerSet :: A.Value -> T.Parser SearchStickerSet
   parseSearchStickerSet = A.withObject "SearchStickerSet" $ \o -> do
    name <- o A..:? "name"
    return $ SearchStickerSet { name = name }
 parseJSON _ = mempty
