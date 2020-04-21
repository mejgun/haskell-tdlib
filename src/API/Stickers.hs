-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Stickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Sticker as Sticker

--main = putStrLn "ok"

data Stickers = 
 Stickers { stickers :: [Sticker.Sticker] }  deriving (Show)

instance T.ToJSON Stickers where
 toJSON (Stickers { stickers = stickers }) =
  A.object [ "@type" A..= T.String "stickers", "stickers" A..= stickers ]



instance T.FromJSON Stickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickers" -> parseStickers v

   _ -> mempty ""
  where
   parseStickers :: A.Value -> T.Parser Stickers
   parseStickers = A.withObject "Stickers" $ \o -> do
    stickers <- o A..: "stickers"
    return $ Stickers { stickers = stickers }