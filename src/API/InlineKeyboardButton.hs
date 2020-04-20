-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineKeyboardButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InlineKeyboardButtonType as InlineKeyboardButtonType

--main = putStrLn "ok"

data InlineKeyboardButton = 
 InlineKeyboardButton { _type :: InlineKeyboardButtonType.InlineKeyboardButtonType, text :: String }  -- deriving (Show)

instance T.ToJSON InlineKeyboardButton where
 toJSON (InlineKeyboardButton { _type = _type, text = text }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButton", "type" A..= _type, "text" A..= text ]
-- inlineKeyboardButton InlineKeyboardButton  { _type :: InlineKeyboardButtonType.InlineKeyboardButtonType, text :: String } 

