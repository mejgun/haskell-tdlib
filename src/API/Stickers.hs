-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Stickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Sticker as Sticker

--main = putStrLn "ok"

data Stickers = 
 Stickers { stickers :: [Sticker.Sticker] }  -- deriving (Show)

instance T.ToJSON Stickers where
 toJSON (Stickers { stickers = stickers }) =
  A.object [ "@type" A..= T.String "stickers", "stickers" A..= stickers ]
-- stickers Stickers  { stickers :: [Sticker.Sticker] } 

