-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuggestedStickerSetName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a suggested name for a new sticker set with a given title 
-- 
-- __title__ Sticker set title; 1-64 characters
data GetSuggestedStickerSetName = 

 GetSuggestedStickerSetName { title :: Maybe String }  deriving (Eq)

instance Show GetSuggestedStickerSetName where
 show GetSuggestedStickerSetName { title=title } =
  "GetSuggestedStickerSetName" ++ cc [p "title" title ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetSuggestedStickerSetName where
 toJSON GetSuggestedStickerSetName { title = title } =
  A.object [ "@type" A..= T.String "getSuggestedStickerSetName", "title" A..= title ]

instance T.FromJSON GetSuggestedStickerSetName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSuggestedStickerSetName" -> parseGetSuggestedStickerSetName v
   _ -> mempty
  where
   parseGetSuggestedStickerSetName :: A.Value -> T.Parser GetSuggestedStickerSetName
   parseGetSuggestedStickerSetName = A.withObject "GetSuggestedStickerSetName" $ \o -> do
    title <- o A..:? "title"
    return $ GetSuggestedStickerSetName { title = title }
 parseJSON _ = mempty
