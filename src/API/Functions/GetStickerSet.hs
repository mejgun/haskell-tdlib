-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a sticker set by its identifier 
-- 
-- __set_id__ Identifier of the sticker set
data GetStickerSet = 

 GetStickerSet { set_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetStickerSet where
 toJSON (GetStickerSet { set_id = set_id }) =
  A.object [ "@type" A..= T.String "getStickerSet", "set_id" A..= set_id ]

instance T.FromJSON GetStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStickerSet" -> parseGetStickerSet v
   _ -> mempty
  where
   parseGetStickerSet :: A.Value -> T.Parser GetStickerSet
   parseGetStickerSet = A.withObject "GetStickerSet" $ \o -> do
    set_id <- mconcat [ o A..:? "set_id", readMaybe <$> (o A..: "set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetStickerSet { set_id = set_id }