-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetMessageLink = 
 GetMessageLink { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetMessageLink where
 toJSON (GetMessageLink { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageLink", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getMessageLink GetMessageLink  { message_id :: Int, chat_id :: Int } 

