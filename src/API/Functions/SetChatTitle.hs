-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatTitle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatTitle = 
 SetChatTitle { title :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatTitle where
 toJSON (SetChatTitle { title = title, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatTitle", "title" A..= title, "chat_id" A..= chat_id ]
-- setChatTitle SetChatTitle  { title :: String, chat_id :: Int } 

