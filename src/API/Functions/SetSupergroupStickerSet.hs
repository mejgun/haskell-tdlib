-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetSupergroupStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetSupergroupStickerSet = 
 SetSupergroupStickerSet { sticker_set_id :: Int, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON SetSupergroupStickerSet where
 toJSON (SetSupergroupStickerSet { sticker_set_id = sticker_set_id, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "setSupergroupStickerSet", "sticker_set_id" A..= sticker_set_id, "supergroup_id" A..= supergroup_id ]
-- setSupergroupStickerSet SetSupergroupStickerSet  { sticker_set_id :: Int, supergroup_id :: Int } 



instance T.FromJSON SetSupergroupStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setSupergroupStickerSet" -> parseSetSupergroupStickerSet v
  where
   parseSetSupergroupStickerSet :: A.Value -> T.Parser SetSupergroupStickerSet
   parseSetSupergroupStickerSet = A.withObject "SetSupergroupStickerSet" $ \o -> do
    sticker_set_id <- o A..: "sticker_set_id"
    supergroup_id <- o A..: "supergroup_id"
    return $ SetSupergroupStickerSet { sticker_set_id = sticker_set_id, supergroup_id = supergroup_id }