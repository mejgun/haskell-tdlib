-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetStickerSetThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data SetStickerSetThumbnail = 
 SetStickerSetThumbnail { thumbnail :: InputFile.InputFile, name :: String, user_id :: Int }  -- deriving (Show)

instance T.ToJSON SetStickerSetThumbnail where
 toJSON (SetStickerSetThumbnail { thumbnail = thumbnail, name = name, user_id = user_id }) =
  A.object [ "@type" A..= T.String "setStickerSetThumbnail", "thumbnail" A..= thumbnail, "name" A..= name, "user_id" A..= user_id ]
-- setStickerSetThumbnail SetStickerSetThumbnail  { thumbnail :: InputFile.InputFile, name :: String, user_id :: Int } 

