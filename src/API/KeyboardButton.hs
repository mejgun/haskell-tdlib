-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.KeyboardButton where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.KeyboardButtonType as KeyboardButtonType

-- |
-- 
-- Represents a single button in a bot keyboard 
-- 
-- __text__ Text of the button
-- 
-- __type__ Type of the button
data KeyboardButton = 

 KeyboardButton { _type :: Maybe KeyboardButtonType.KeyboardButtonType, text :: Maybe String }  deriving (Eq)

instance Show KeyboardButton where
 show KeyboardButton { _type=_type, text=text } =
  "KeyboardButton" ++ U.cc [U.p "_type" _type, U.p "text" text ]

instance T.ToJSON KeyboardButton where
 toJSON KeyboardButton { _type = _type, text = text } =
  A.object [ "@type" A..= T.String "keyboardButton", "type" A..= _type, "text" A..= text ]

instance T.FromJSON KeyboardButton where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "keyboardButton" -> parseKeyboardButton v
   _ -> mempty
  where
   parseKeyboardButton :: A.Value -> T.Parser KeyboardButton
   parseKeyboardButton = A.withObject "KeyboardButton" $ \o -> do
    _type <- o A..:? "type"
    text <- o A..:? "text"
    return $ KeyboardButton { _type = _type, text = text }
 parseJSON _ = mempty
