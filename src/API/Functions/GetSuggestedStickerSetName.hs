-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuggestedStickerSetName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns a suggested name for a new sticker set with a given title 
-- 
-- __title__ Sticker set title; 1-64 characters
data GetSuggestedStickerSetName = 

 GetSuggestedStickerSetName { title :: Maybe String }  deriving (Eq)

instance Show GetSuggestedStickerSetName where
 show GetSuggestedStickerSetName { title=title } =
  "GetSuggestedStickerSetName" ++ U.cc [U.p "title" title ]

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
