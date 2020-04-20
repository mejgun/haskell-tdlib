-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMember where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatMember = 
 GetChatMember { user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatMember where
 toJSON (GetChatMember { user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMember", "user_id" A..= user_id, "chat_id" A..= chat_id ]
-- getChatMember GetChatMember  { user_id :: Int, chat_id :: Int } 

