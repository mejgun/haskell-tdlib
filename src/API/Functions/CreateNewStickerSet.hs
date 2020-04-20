-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputSticker as InputSticker

--main = putStrLn "ok"

data CreateNewStickerSet = 
 CreateNewStickerSet { stickers :: [InputSticker.InputSticker], is_masks :: Bool, name :: String, title :: String, user_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateNewStickerSet where
 toJSON (CreateNewStickerSet { stickers = stickers, is_masks = is_masks, name = name, title = title, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createNewStickerSet", "stickers" A..= stickers, "is_masks" A..= is_masks, "name" A..= name, "title" A..= title, "user_id" A..= user_id ]
-- createNewStickerSet CreateNewStickerSet  { stickers :: [InputSticker.InputSticker], is_masks :: Bool, name :: String, title :: String, user_id :: Int } 



instance T.FromJSON CreateNewStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewStickerSet" -> parseCreateNewStickerSet v
  where
   parseCreateNewStickerSet :: A.Value -> T.Parser CreateNewStickerSet
   parseCreateNewStickerSet = A.withObject "CreateNewStickerSet" $ \o -> do
    stickers <- o A..: "stickers"
    is_masks <- o A..: "is_masks"
    name <- o A..: "name"
    title <- o A..: "title"
    user_id <- o A..: "user_id"
    return $ CreateNewStickerSet { stickers = stickers, is_masks = is_masks, name = name, title = title, user_id = user_id }