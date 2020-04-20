-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TransferChatOwnership where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TransferChatOwnership = 
 TransferChatOwnership { password :: String, user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON TransferChatOwnership where
 toJSON (TransferChatOwnership { password = password, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "transferChatOwnership", "password" A..= password, "user_id" A..= user_id, "chat_id" A..= chat_id ]
-- transferChatOwnership TransferChatOwnership  { password :: String, user_id :: Int, chat_id :: Int } 

