-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveFavoriteSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data RemoveFavoriteSticker = 
 RemoveFavoriteSticker { sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON RemoveFavoriteSticker where
 toJSON (RemoveFavoriteSticker { sticker = sticker }) =
  A.object [ "@type" A..= T.String "removeFavoriteSticker", "sticker" A..= sticker ]
-- removeFavoriteSticker RemoveFavoriteSticker  { sticker :: InputFile.InputFile } 



instance T.FromJSON RemoveFavoriteSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeFavoriteSticker" -> parseRemoveFavoriteSticker v
  where
   parseRemoveFavoriteSticker :: A.Value -> T.Parser RemoveFavoriteSticker
   parseRemoveFavoriteSticker = A.withObject "RemoveFavoriteSticker" $ \o -> do
    sticker <- o A..: "sticker"
    return $ RemoveFavoriteSticker { sticker = sticker }