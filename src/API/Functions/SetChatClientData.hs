-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatClientData where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatClientData = 
 SetChatClientData { client_data :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatClientData where
 toJSON (SetChatClientData { client_data = client_data, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatClientData", "client_data" A..= client_data, "chat_id" A..= chat_id ]
-- setChatClientData SetChatClientData  { client_data :: String, chat_id :: Int } 

