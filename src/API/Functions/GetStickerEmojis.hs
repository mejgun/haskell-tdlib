-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickerEmojis where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object 
-- 
-- __sticker__ Sticker file identifier
data GetStickerEmojis = 

 GetStickerEmojis { sticker :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON GetStickerEmojis where
 toJSON (GetStickerEmojis { sticker = sticker }) =
  A.object [ "@type" A..= T.String "getStickerEmojis", "sticker" A..= sticker ]

instance T.FromJSON GetStickerEmojis where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStickerEmojis" -> parseGetStickerEmojis v
   _ -> mempty
  where
   parseGetStickerEmojis :: A.Value -> T.Parser GetStickerEmojis
   parseGetStickerEmojis = A.withObject "GetStickerEmojis" $ \o -> do
    sticker <- o A..:? "sticker"
    return $ GetStickerEmojis { sticker = sticker }