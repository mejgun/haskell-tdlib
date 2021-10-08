-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveStickerFromSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot 
-- 
-- __sticker__ Sticker
data RemoveStickerFromSet = 

 RemoveStickerFromSet { sticker :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show RemoveStickerFromSet where
 show RemoveStickerFromSet { sticker=sticker } =
  "RemoveStickerFromSet" ++ cc [p "sticker" sticker ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveStickerFromSet where
 toJSON RemoveStickerFromSet { sticker = sticker } =
  A.object [ "@type" A..= T.String "removeStickerFromSet", "sticker" A..= sticker ]

instance T.FromJSON RemoveStickerFromSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeStickerFromSet" -> parseRemoveStickerFromSet v
   _ -> mempty
  where
   parseRemoveStickerFromSet :: A.Value -> T.Parser RemoveStickerFromSet
   parseRemoveStickerFromSet = A.withObject "RemoveStickerFromSet" $ \o -> do
    sticker <- o A..:? "sticker"
    return $ RemoveStickerFromSet { sticker = sticker }
 parseJSON _ = mempty
