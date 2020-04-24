-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveFavoriteSticker where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data RemoveFavoriteSticker = 
 RemoveFavoriteSticker { sticker :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON RemoveFavoriteSticker where
 toJSON (RemoveFavoriteSticker { sticker = sticker }) =
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
    sticker <- optional $ o A..: "sticker"
    return $ RemoveFavoriteSticker { sticker = sticker }