-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetMessage = 
 GetMessage { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetMessage where
 toJSON (GetMessage { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getMessage GetMessage  { message_id :: Int, chat_id :: Int } 

