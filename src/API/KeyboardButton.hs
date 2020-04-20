-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.KeyboardButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.KeyboardButtonType as KeyboardButtonType

--main = putStrLn "ok"

data KeyboardButton = 
 KeyboardButton { _type :: KeyboardButtonType.KeyboardButtonType, text :: String }  -- deriving (Show)

instance T.ToJSON KeyboardButton where
 toJSON (KeyboardButton { _type = _type, text = text }) =
  A.object [ "@type" A..= T.String "keyboardButton", "type" A..= _type, "text" A..= text ]
-- keyboardButton KeyboardButton  { _type :: KeyboardButtonType.KeyboardButtonType, text :: String } 

