-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageByDate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatMessageByDate = 
 GetChatMessageByDate { date :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatMessageByDate where
 toJSON (GetChatMessageByDate { date = date, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMessageByDate", "date" A..= date, "chat_id" A..= chat_id ]
-- getChatMessageByDate GetChatMessageByDate  { date :: Int, chat_id :: Int } 

