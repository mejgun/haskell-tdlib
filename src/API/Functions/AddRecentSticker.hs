-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddRecentSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data AddRecentSticker = 
 AddRecentSticker { sticker :: InputFile.InputFile, is_attached :: Bool }  deriving (Show)

instance T.ToJSON AddRecentSticker where
 toJSON (AddRecentSticker { sticker = sticker, is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "addRecentSticker", "sticker" A..= sticker, "is_attached" A..= is_attached ]



instance T.FromJSON AddRecentSticker where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addRecentSticker" -> parseAddRecentSticker v

   _ -> mempty ""
  where
   parseAddRecentSticker :: A.Value -> T.Parser AddRecentSticker
   parseAddRecentSticker = A.withObject "AddRecentSticker" $ \o -> do
    sticker <- o A..: "sticker"
    is_attached <- o A..: "is_attached"
    return $ AddRecentSticker { sticker = sticker, is_attached = is_attached }