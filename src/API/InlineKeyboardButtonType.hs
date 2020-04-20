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



instance T.FromJSON InlineKeyboardButtonType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inlineKeyboardButtonTypeUrl" -> parseInlineKeyboardButtonTypeUrl v
   "inlineKeyboardButtonTypeLoginUrl" -> parseInlineKeyboardButtonTypeLoginUrl v
   "inlineKeyboardButtonTypeCallback" -> parseInlineKeyboardButtonTypeCallback v
   "inlineKeyboardButtonTypeCallbackGame" -> parseInlineKeyboardButtonTypeCallbackGame v
   "inlineKeyboardButtonTypeSwitchInline" -> parseInlineKeyboardButtonTypeSwitchInline v
   "inlineKeyboardButtonTypeBuy" -> parseInlineKeyboardButtonTypeBuy v
  where
   parseInlineKeyboardButtonTypeUrl :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeUrl = A.withObject "InlineKeyboardButtonTypeUrl" $ \o -> do
    url <- o A..: "url"
    return $ InlineKeyboardButtonTypeUrl { url = url }

   parseInlineKeyboardButtonTypeLoginUrl :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeLoginUrl = A.withObject "InlineKeyboardButtonTypeLoginUrl" $ \o -> do
    forward_text <- o A..: "forward_text"
    _id <- o A..: "id"
    url <- o A..: "url"
    return $ InlineKeyboardButtonTypeLoginUrl { forward_text = forward_text, _id = _id, url = url }

   parseInlineKeyboardButtonTypeCallback :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeCallback = A.withObject "InlineKeyboardButtonTypeCallback" $ \o -> do
    _data <- o A..: "data"
    return $ InlineKeyboardButtonTypeCallback { _data = _data }

   parseInlineKeyboardButtonTypeCallbackGame :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeCallbackGame = A.withObject "InlineKeyboardButtonTypeCallbackGame" $ \o -> do
    return $ InlineKeyboardButtonTypeCallbackGame {  }

   parseInlineKeyboardButtonTypeSwitchInline :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeSwitchInline = A.withObject "InlineKeyboardButtonTypeSwitchInline" $ \o -> do
    in_current_chat <- o A..: "in_current_chat"
    query <- o A..: "query"
    return $ InlineKeyboardButtonTypeSwitchInline { in_current_chat = in_current_chat, query = query }

   parseInlineKeyboardButtonTypeBuy :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeBuy = A.withObject "InlineKeyboardButtonTypeBuy" $ \o -> do
    return $ InlineKeyboardButtonTypeBuy {  }