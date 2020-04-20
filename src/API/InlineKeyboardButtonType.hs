-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineKeyboardButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data InlineKeyboardButtonType = 
 InlineKeyboardButtonTypeUrl { url :: String }  
 | InlineKeyboardButtonTypeLoginUrl { forward_text :: String, _id :: Int, url :: String }  
 | InlineKeyboardButtonTypeCallback { _data :: String }  
 | InlineKeyboardButtonTypeCallbackGame 
 | InlineKeyboardButtonTypeSwitchInline { in_current_chat :: Bool, query :: String }  
 | InlineKeyboardButtonTypeBuy -- deriving (Show)

instance T.ToJSON InlineKeyboardButtonType where
 toJSON (InlineKeyboardButtonTypeUrl { url = url }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeUrl", "url" A..= url ]

 toJSON (InlineKeyboardButtonTypeLoginUrl { forward_text = forward_text, _id = _id, url = url }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeLoginUrl", "forward_text" A..= forward_text, "id" A..= _id, "url" A..= url ]

 toJSON (InlineKeyboardButtonTypeCallback { _data = _data }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeCallback", "data" A..= _data ]

 toJSON (InlineKeyboardButtonTypeCallbackGame {  }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeCallbackGame" ]

 toJSON (InlineKeyboardButtonTypeSwitchInline { in_current_chat = in_current_chat, query = query }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeSwitchInline", "in_current_chat" A..= in_current_chat, "query" A..= query ]

 toJSON (InlineKeyboardButtonTypeBuy {  }) =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeBuy" ]
-- inlineKeyboardButtonTypeUrl InlineKeyboardButtonType  { url :: String } 

-- inlineKeyboardButtonTypeLoginUrl InlineKeyboardButtonType  { forward_text :: String, _id :: Int, url :: String } 

-- inlineKeyboardButtonTypeCallback InlineKeyboardButtonType  { _data :: String } 

-- inlineKeyboardButtonTypeCallbackGame InlineKeyboardButtonType 

-- inlineKeyboardButtonTypeSwitchInline InlineKeyboardButtonType  { in_current_chat :: Bool, query :: String } 

-- inlineKeyboardButtonTypeBuy InlineKeyboardButtonType 

