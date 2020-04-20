-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatAdministrators where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatAdministrators = 
 GetChatAdministrators { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatAdministrators where
 toJSON (GetChatAdministrators { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatAdministrators", "chat_id" A..= chat_id ]
-- getChatAdministrators GetChatAdministrators  { chat_id :: Int } 

