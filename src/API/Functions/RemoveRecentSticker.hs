-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentSticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Removes a sticker from the list of recently used stickers 
-- 
-- __is_attached__ Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers
-- 
-- __sticker__ Sticker file to delete
data RemoveRecentSticker = 

 RemoveRecentSticker { sticker :: Maybe InputFile.InputFile, is_attached :: Maybe Bool }  deriving (Eq)

instance Show RemoveRecentSticker where
 show RemoveRecentSticker { sticker=sticker, is_attached=is_attached } =
  "RemoveRecentSticker" ++ cc [p "sticker" sticker, p "is_attached" is_attached ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveRecentSticker where
 toJSON RemoveRecentSticker { sticker = sticker, is_attached = is_attached } =
  A.object [ "@type" A..= T.String "removeRecentSticker", "sticker" A..= sticker, "is_attached" A..= is_attached ]

instance T.FromJSON RemoveRecentSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeRecentSticker" -> parseRemoveRecentSticker v
   _ -> mempty
  where
   parseRemoveRecentSticker :: A.Value -> T.Parser RemoveRecentSticker
   parseRemoveRecentSticker = A.withObject "RemoveRecentSticker" $ \o -> do
    sticker <- o A..:? "sticker"
    is_attached <- o A..:? "is_attached"
    return $ RemoveRecentSticker { sticker = sticker, is_attached = is_attached }
 parseJSON _ = mempty
