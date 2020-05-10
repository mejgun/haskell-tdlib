-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddRecentSticker where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
-- 
-- __is_attached__ Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
-- 
-- __sticker__ Sticker file to add
data AddRecentSticker = 

 AddRecentSticker { sticker :: Maybe InputFile.InputFile, is_attached :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON AddRecentSticker where
 toJSON (AddRecentSticker { sticker = sticker, is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "addRecentSticker", "sticker" A..= sticker, "is_attached" A..= is_attached ]

instance T.FromJSON AddRecentSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addRecentSticker" -> parseAddRecentSticker v
   _ -> mempty
  where
   parseAddRecentSticker :: A.Value -> T.Parser AddRecentSticker
   parseAddRecentSticker = A.withObject "AddRecentSticker" $ \o -> do
    sticker <- o A..:? "sticker"
    is_attached <- o A..:? "is_attached"
    return $ AddRecentSticker { sticker = sticker, is_attached = is_attached }