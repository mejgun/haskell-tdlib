-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInstalledStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a list of installed sticker sets 
-- 
-- __is_masks__ Pass true to return mask sticker sets; pass false to return ordinary sticker sets
data GetInstalledStickerSets = 

 GetInstalledStickerSets { is_masks :: Maybe Bool }  deriving (Eq)

instance Show GetInstalledStickerSets where
 show GetInstalledStickerSets { is_masks=is_masks } =
  "GetInstalledStickerSets" ++ cc [p "is_masks" is_masks ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetInstalledStickerSets where
 toJSON GetInstalledStickerSets { is_masks = is_masks } =
  A.object [ "@type" A..= T.String "getInstalledStickerSets", "is_masks" A..= is_masks ]

instance T.FromJSON GetInstalledStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInstalledStickerSets" -> parseGetInstalledStickerSets v
   _ -> mempty
  where
   parseGetInstalledStickerSets :: A.Value -> T.Parser GetInstalledStickerSets
   parseGetInstalledStickerSets = A.withObject "GetInstalledStickerSets" $ \o -> do
    is_masks <- o A..:? "is_masks"
    return $ GetInstalledStickerSets { is_masks = is_masks }
 parseJSON _ = mempty
