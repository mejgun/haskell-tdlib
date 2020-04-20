-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatDescription = 
 SetChatDescription { description :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatDescription where
 toJSON (SetChatDescription { description = description, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDescription", "description" A..= description, "chat_id" A..= chat_id ]
-- setChatDescription SetChatDescription  { description :: String, chat_id :: Int } 

