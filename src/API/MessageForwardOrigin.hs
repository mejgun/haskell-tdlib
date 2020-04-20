-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageForwardOrigin where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data MessageForwardOrigin = 
 MessageForwardOriginUser { sender_user_id :: Int }  
 | MessageForwardOriginHiddenUser { sender_name :: String }  
 | MessageForwardOriginChannel { author_signature :: String, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON MessageForwardOrigin where
 toJSON (MessageForwardOriginUser { sender_user_id = sender_user_id }) =
  A.object [ "@type" A..= T.String "messageForwardOriginUser", "sender_user_id" A..= sender_user_id ]

 toJSON (MessageForwardOriginHiddenUser { sender_name = sender_name }) =
  A.object [ "@type" A..= T.String "messageForwardOriginHiddenUser", "sender_name" A..= sender_name ]

 toJSON (MessageForwardOriginChannel { author_signature = author_signature, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "messageForwardOriginChannel", "author_signature" A..= author_signature, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- messageForwardOriginUser MessageForwardOrigin  { sender_user_id :: Int } 

-- messageForwardOriginHiddenUser MessageForwardOrigin  { sender_name :: String } 

-- messageForwardOriginChannel MessageForwardOrigin  { author_signature :: String, message_id :: Int, chat_id :: Int } 

