-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddStickerToSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputSticker as InputSticker

--main = putStrLn "ok"

data AddStickerToSet = 
 AddStickerToSet { sticker :: InputSticker.InputSticker, name :: String, user_id :: Int }  -- deriving (Show)

instance T.ToJSON AddStickerToSet where
 toJSON (AddStickerToSet { sticker = sticker, name = name, user_id = user_id }) =
  A.object [ "@type" A..= T.String "addStickerToSet", "sticker" A..= sticker, "name" A..= name, "user_id" A..= user_id ]
-- addStickerToSet AddStickerToSet  { sticker :: InputSticker.InputSticker, name :: String, user_id :: Int } 



instance T.FromJSON AddStickerToSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addStickerToSet" -> parseAddStickerToSet v
  where
   parseAddStickerToSet :: A.Value -> T.Parser AddStickerToSet
   parseAddStickerToSet = A.withObject "AddStickerToSet" $ \o -> do
    sticker <- o A..: "sticker"
    name <- o A..: "name"
    user_id <- o A..: "user_id"
    return $ AddStickerToSet { sticker = sticker, name = name, user_id = user_id }