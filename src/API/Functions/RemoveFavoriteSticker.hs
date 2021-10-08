-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveFavoriteSticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Removes a sticker from the list of favorite stickers 
-- 
-- __sticker__ Sticker file to delete from the list
data RemoveFavoriteSticker = 

 RemoveFavoriteSticker { sticker :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show RemoveFavoriteSticker where
 show RemoveFavoriteSticker { sticker=sticker } =
  "RemoveFavoriteSticker" ++ cc [p "sticker" sticker ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveFavoriteSticker where
 toJSON RemoveFavoriteSticker { sticker = sticker } =
  A.object [ "@type" A..= T.String "removeFavoriteSticker", "sticker" A..= sticker ]

instance T.FromJSON RemoveFavoriteSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeFavoriteSticker" -> parseRemoveFavoriteSticker v
   _ -> mempty
  where
   parseRemoveFavoriteSticker :: A.Value -> T.Parser RemoveFavoriteSticker
   parseRemoveFavoriteSticker = A.withObject "RemoveFavoriteSticker" $ \o -> do
    sticker <- o A..:? "sticker"
    return $ RemoveFavoriteSticker { sticker = sticker }
 parseJSON _ = mempty
