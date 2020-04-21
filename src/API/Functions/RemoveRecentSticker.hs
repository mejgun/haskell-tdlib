-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data RemoveRecentSticker = 
 RemoveRecentSticker { sticker :: InputFile.InputFile, is_attached :: Bool }  deriving (Show)

instance T.ToJSON RemoveRecentSticker where
 toJSON (RemoveRecentSticker { sticker = sticker, is_attached = is_attached }) =
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
    sticker <- o A..: "sticker"
    is_attached <- o A..: "is_attached"
    return $ RemoveRecentSticker { sticker = sticker, is_attached = is_attached }