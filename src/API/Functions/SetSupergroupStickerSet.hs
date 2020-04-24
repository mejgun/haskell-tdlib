-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetSupergroupStickerSet where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetSupergroupStickerSet = 
 SetSupergroupStickerSet { sticker_set_id :: Maybe Int, supergroup_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetSupergroupStickerSet where
 toJSON (SetSupergroupStickerSet { sticker_set_id = sticker_set_id, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "setSupergroupStickerSet", "sticker_set_id" A..= sticker_set_id, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON SetSupergroupStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setSupergroupStickerSet" -> parseSetSupergroupStickerSet v
   _ -> mempty
  where
   parseSetSupergroupStickerSet :: A.Value -> T.Parser SetSupergroupStickerSet
   parseSetSupergroupStickerSet = A.withObject "SetSupergroupStickerSet" $ \o -> do
    sticker_set_id <- optional $ o A..: "sticker_set_id"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ SetSupergroupStickerSet { sticker_set_id = sticker_set_id, supergroup_id = supergroup_id }