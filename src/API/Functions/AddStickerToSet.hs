-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddStickerToSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputSticker as InputSticker

-- |
-- 
-- Adds a new sticker to a set; for bots only. Returns the sticker set
-- 
-- __user_id__ Sticker set owner
-- 
-- __name__ Sticker set name
-- 
-- __sticker__ Sticker to add to the set
data AddStickerToSet = 

 AddStickerToSet { sticker :: Maybe InputSticker.InputSticker, name :: Maybe String, user_id :: Maybe Int }  deriving (Eq)

instance Show AddStickerToSet where
 show AddStickerToSet { sticker=sticker, name=name, user_id=user_id } =
  "AddStickerToSet" ++ U.cc [U.p "sticker" sticker, U.p "name" name, U.p "user_id" user_id ]

instance T.ToJSON AddStickerToSet where
 toJSON AddStickerToSet { sticker = sticker, name = name, user_id = user_id } =
  A.object [ "@type" A..= T.String "addStickerToSet", "sticker" A..= sticker, "name" A..= name, "user_id" A..= user_id ]

instance T.FromJSON AddStickerToSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addStickerToSet" -> parseAddStickerToSet v
   _ -> mempty
  where
   parseAddStickerToSet :: A.Value -> T.Parser AddStickerToSet
   parseAddStickerToSet = A.withObject "AddStickerToSet" $ \o -> do
    sticker <- o A..:? "sticker"
    name <- o A..:? "name"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddStickerToSet { sticker = sticker, name = name, user_id = user_id }
 parseJSON _ = mempty
