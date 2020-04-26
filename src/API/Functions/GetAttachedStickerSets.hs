-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAttachedStickerSets where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets 
-- 
-- __file_id__ File identifier
data GetAttachedStickerSets = 
 GetAttachedStickerSets { file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetAttachedStickerSets where
 toJSON (GetAttachedStickerSets { file_id = file_id }) =
  A.object [ "@type" A..= T.String "getAttachedStickerSets", "file_id" A..= file_id ]

instance T.FromJSON GetAttachedStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAttachedStickerSets" -> parseGetAttachedStickerSets v
   _ -> mempty
  where
   parseGetAttachedStickerSets :: A.Value -> T.Parser GetAttachedStickerSets
   parseGetAttachedStickerSets = A.withObject "GetAttachedStickerSets" $ \o -> do
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetAttachedStickerSets { file_id = file_id }