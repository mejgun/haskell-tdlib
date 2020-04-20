-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChatUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckChatUsername = 
 CheckChatUsername { username :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON CheckChatUsername where
 toJSON (CheckChatUsername { username = username, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "checkChatUsername", "username" A..= username, "chat_id" A..= chat_id ]
-- checkChatUsername CheckChatUsername  { username :: String, chat_id :: Int } 

