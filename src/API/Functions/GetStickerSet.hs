-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetStickerSet = 
 GetStickerSet { set_id :: Int }  -- deriving (Show)

instance T.ToJSON GetStickerSet where
 toJSON (GetStickerSet { set_id = set_id }) =
  A.object [ "@type" A..= T.String "getStickerSet", "set_id" A..= set_id ]
-- getStickerSet GetStickerSet  { set_id :: Int } 



instance T.FromJSON GetStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStickerSet" -> parseGetStickerSet v
  where
   parseGetStickerSet :: A.Value -> T.Parser GetStickerSet
   parseGetStickerSet = A.withObject "GetStickerSet" $ \o -> do
    set_id <- o A..: "set_id"
    return $ GetStickerSet { set_id = set_id }