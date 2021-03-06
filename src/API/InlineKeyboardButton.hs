-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineKeyboardButton where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InlineKeyboardButtonType as InlineKeyboardButtonType

-- |
-- 
-- Represents a single button in an inline keyboard 
-- 
-- __text__ Text of the button
-- 
-- __type__ Type of the button
data InlineKeyboardButton = 

 InlineKeyboardButton { _type :: Maybe InlineKeyboardButtonType.InlineKeyboardButtonType, text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InlineKeyboardButton where
 toJSON (InlineKeyboardButton { _type = _type, text = text }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButton", "type" A..= _type, "text" A..= text ]

instance T.FromJSON InlineKeyboardButton where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inlineKeyboardButton" -> parseInlineKeyboardButton v
   _ -> mempty
  where
   parseInlineKeyboardButton :: A.Value -> T.Parser InlineKeyboardButton
   parseInlineKeyboardButton = A.withObject "InlineKeyboardButton" $ \o -> do
    _type <- o A..:? "type"
    text <- o A..:? "text"
    return $ InlineKeyboardButton { _type = _type, text = text }