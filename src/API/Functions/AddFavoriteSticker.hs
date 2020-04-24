-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddFavoriteSticker where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data AddFavoriteSticker = 
 AddFavoriteSticker { sticker :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON AddFavoriteSticker where
 toJSON (AddFavoriteSticker { sticker = sticker }) =
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
    sticker <- optional $ o A..: "sticker"
    return $ AddFavoriteSticker { sticker = sticker }