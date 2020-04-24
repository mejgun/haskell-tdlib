-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAttachedStickerSets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    file_id <- optional $ o A..: "file_id"
    return $ GetAttachedStickerSets { file_id = file_id }