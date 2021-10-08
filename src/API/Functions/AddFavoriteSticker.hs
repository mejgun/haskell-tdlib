-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddFavoriteSticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
-- 
-- __sticker__ Sticker file to add
data AddFavoriteSticker = 

 AddFavoriteSticker { sticker :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show AddFavoriteSticker where
 show AddFavoriteSticker { sticker=sticker } =
  "AddFavoriteSticker" ++ cc [p "sticker" sticker ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AddFavoriteSticker where
 toJSON AddFavoriteSticker { sticker = sticker } =
  A.object [ "@type" A..= T.String "addFavoriteSticker", "sticker" A..= sticker ]

instance T.FromJSON AddFavoriteSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addFavoriteSticker" -> parseAddFavoriteSticker v
   _ -> mempty
  where
   parseAddFavoriteSticker :: A.Value -> T.Parser AddFavoriteSticker
   parseAddFavoriteSticker = A.withObject "AddFavoriteSticker" $ \o -> do
    sticker <- o A..:? "sticker"
    return $ AddFavoriteSticker { sticker = sticker }
 parseJSON _ = mempty
