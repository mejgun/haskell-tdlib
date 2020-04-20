-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatSetTtlMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendChatSetTtlMessage = 
 SendChatSetTtlMessage { ttl :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendChatSetTtlMessage where
 toJSON (SendChatSetTtlMessage { ttl = ttl, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatSetTtlMessage", "ttl" A..= ttl, "chat_id" A..= chat_id ]
-- sendChatSetTtlMessage SendChatSetTtlMessage  { ttl :: Int, chat_id :: Int } 

