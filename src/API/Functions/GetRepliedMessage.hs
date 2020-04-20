-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRepliedMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRepliedMessage = 
 GetRepliedMessage { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetRepliedMessage where
 toJSON (GetRepliedMessage { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getRepliedMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getRepliedMessage GetRepliedMessage  { message_id :: Int, chat_id :: Int } 

