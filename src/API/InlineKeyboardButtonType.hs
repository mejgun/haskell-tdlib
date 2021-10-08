-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineKeyboardButtonType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes the type of an inline keyboard button
data InlineKeyboardButtonType = 
 -- |
 -- 
 -- A button that opens a specified URL 
 -- 
 -- __url__ HTTP or tg:// URL to open
 InlineKeyboardButtonTypeUrl { url :: Maybe String }  |
 -- |
 -- 
 -- A button that opens a specified URL and automatically authorize the current user if allowed to do so 
 -- 
 -- __url__ An HTTP URL to open
 -- 
 -- __id__ Unique button identifier
 -- 
 -- __forward_text__ If non-empty, new text of the button in forwarded messages
 InlineKeyboardButtonTypeLoginUrl { forward_text :: Maybe String, _id :: Maybe Int, url :: Maybe String }  |
 -- |
 -- 
 -- A button that sends a callback query to a bot 
 -- 
 -- __data__ Data to be sent to the bot via a callback query
 InlineKeyboardButtonTypeCallback { _data :: Maybe String }  |
 -- |
 -- 
 -- A button that asks for password of the current user and then sends a callback query to a bot 
 -- 
 -- __data__ Data to be sent to the bot via a callback query
 InlineKeyboardButtonTypeCallbackWithPassword { _data :: Maybe String }  |
 -- |
 -- 
 -- A button with a game that sends a callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame
 InlineKeyboardButtonTypeCallbackGame |
 -- |
 -- 
 -- A button that forces an inline query to the bot to be inserted in the input field 
 -- 
 -- __query__ Inline query to be sent to the bot
 -- 
 -- __in_current_chat__ True, if the inline query must be sent from the current chat
 InlineKeyboardButtonTypeSwitchInline { in_current_chat :: Maybe Bool, query :: Maybe String }  |
 -- |
 -- 
 -- A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice
 InlineKeyboardButtonTypeBuy deriving (Eq)

instance Show InlineKeyboardButtonType where
 show InlineKeyboardButtonTypeUrl { url=url } =
  "InlineKeyboardButtonTypeUrl" ++ cc [p "url" url ]

 show InlineKeyboardButtonTypeLoginUrl { forward_text=forward_text, _id=_id, url=url } =
  "InlineKeyboardButtonTypeLoginUrl" ++ cc [p "forward_text" forward_text, p "_id" _id, p "url" url ]

 show InlineKeyboardButtonTypeCallback { _data=_data } =
  "InlineKeyboardButtonTypeCallback" ++ cc [p "_data" _data ]

 show InlineKeyboardButtonTypeCallbackWithPassword { _data=_data } =
  "InlineKeyboardButtonTypeCallbackWithPassword" ++ cc [p "_data" _data ]

 show InlineKeyboardButtonTypeCallbackGame {  } =
  "InlineKeyboardButtonTypeCallbackGame" ++ cc [ ]

 show InlineKeyboardButtonTypeSwitchInline { in_current_chat=in_current_chat, query=query } =
  "InlineKeyboardButtonTypeSwitchInline" ++ cc [p "in_current_chat" in_current_chat, p "query" query ]

 show InlineKeyboardButtonTypeBuy {  } =
  "InlineKeyboardButtonTypeBuy" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InlineKeyboardButtonType where
 toJSON InlineKeyboardButtonTypeUrl { url = url } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeUrl", "url" A..= url ]

 toJSON InlineKeyboardButtonTypeLoginUrl { forward_text = forward_text, _id = _id, url = url } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeLoginUrl", "forward_text" A..= forward_text, "id" A..= _id, "url" A..= url ]

 toJSON InlineKeyboardButtonTypeCallback { _data = _data } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeCallback", "data" A..= _data ]

 toJSON InlineKeyboardButtonTypeCallbackWithPassword { _data = _data } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeCallbackWithPassword", "data" A..= _data ]

 toJSON InlineKeyboardButtonTypeCallbackGame {  } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeCallbackGame" ]

 toJSON InlineKeyboardButtonTypeSwitchInline { in_current_chat = in_current_chat, query = query } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeSwitchInline", "in_current_chat" A..= in_current_chat, "query" A..= query ]

 toJSON InlineKeyboardButtonTypeBuy {  } =
  A.object [ "@type" A..= T.String "inlineKeyboardButtonTypeBuy" ]

instance T.FromJSON InlineKeyboardButtonType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inlineKeyboardButtonTypeUrl" -> parseInlineKeyboardButtonTypeUrl v
   "inlineKeyboardButtonTypeLoginUrl" -> parseInlineKeyboardButtonTypeLoginUrl v
   "inlineKeyboardButtonTypeCallback" -> parseInlineKeyboardButtonTypeCallback v
   "inlineKeyboardButtonTypeCallbackWithPassword" -> parseInlineKeyboardButtonTypeCallbackWithPassword v
   "inlineKeyboardButtonTypeCallbackGame" -> parseInlineKeyboardButtonTypeCallbackGame v
   "inlineKeyboardButtonTypeSwitchInline" -> parseInlineKeyboardButtonTypeSwitchInline v
   "inlineKeyboardButtonTypeBuy" -> parseInlineKeyboardButtonTypeBuy v
   _ -> mempty
  where
   parseInlineKeyboardButtonTypeUrl :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeUrl = A.withObject "InlineKeyboardButtonTypeUrl" $ \o -> do
    url <- o A..:? "url"
    return $ InlineKeyboardButtonTypeUrl { url = url }

   parseInlineKeyboardButtonTypeLoginUrl :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeLoginUrl = A.withObject "InlineKeyboardButtonTypeLoginUrl" $ \o -> do
    forward_text <- o A..:? "forward_text"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    url <- o A..:? "url"
    return $ InlineKeyboardButtonTypeLoginUrl { forward_text = forward_text, _id = _id, url = url }

   parseInlineKeyboardButtonTypeCallback :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeCallback = A.withObject "InlineKeyboardButtonTypeCallback" $ \o -> do
    _data <- o A..:? "data"
    return $ InlineKeyboardButtonTypeCallback { _data = _data }

   parseInlineKeyboardButtonTypeCallbackWithPassword :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeCallbackWithPassword = A.withObject "InlineKeyboardButtonTypeCallbackWithPassword" $ \o -> do
    _data <- o A..:? "data"
    return $ InlineKeyboardButtonTypeCallbackWithPassword { _data = _data }

   parseInlineKeyboardButtonTypeCallbackGame :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeCallbackGame = A.withObject "InlineKeyboardButtonTypeCallbackGame" $ \o -> do
    return $ InlineKeyboardButtonTypeCallbackGame {  }

   parseInlineKeyboardButtonTypeSwitchInline :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeSwitchInline = A.withObject "InlineKeyboardButtonTypeSwitchInline" $ \o -> do
    in_current_chat <- o A..:? "in_current_chat"
    query <- o A..:? "query"
    return $ InlineKeyboardButtonTypeSwitchInline { in_current_chat = in_current_chat, query = query }

   parseInlineKeyboardButtonTypeBuy :: A.Value -> T.Parser InlineKeyboardButtonType
   parseInlineKeyboardButtonTypeBuy = A.withObject "InlineKeyboardButtonTypeBuy" $ \o -> do
    return $ InlineKeyboardButtonTypeBuy {  }
 parseJSON _ = mempty
