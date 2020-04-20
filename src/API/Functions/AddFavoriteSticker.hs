-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddFavoriteSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data AddFavoriteSticker = 
 AddFavoriteSticker { sticker :: InputFile.InputFile }  -- deriving (Show)

instance T.ToJSON AddFavoriteSticker where
 toJSON (AddFavoriteSticker { sticker = sticker }) =
  A.object [ "@type" A..= T.String "addFavoriteSticker", "sticker" A..= sticker ]
-- addFavoriteSticker AddFavoriteSticker  { sticker :: InputFile.InputFile } 



instance T.FromJSON AddFavoriteSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addFavoriteSticker" -> parseAddFavoriteSticker v
  where
   parseAddFavoriteSticker :: A.Value -> T.Parser AddFavoriteSticker
   parseAddFavoriteSticker = A.withObject "AddFavoriteSticker" $ \o -> do
    sticker <- o A..: "sticker"
    return $ AddFavoriteSticker { sticker = sticker }