-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data RemoveRecentSticker = 
 RemoveRecentSticker { sticker :: InputFile.InputFile, is_attached :: Bool }  -- deriving (Show)

instance T.ToJSON RemoveRecentSticker where
 toJSON (RemoveRecentSticker { sticker = sticker, is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "removeRecentSticker", "sticker" A..= sticker, "is_attached" A..= is_attached ]
-- removeRecentSticker RemoveRecentSticker  { sticker :: InputFile.InputFile, is_attached :: Bool } 

