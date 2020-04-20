-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadAllChatMentions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ReadAllChatMentions = 
 ReadAllChatMentions { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ReadAllChatMentions where
 toJSON (ReadAllChatMentions { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "readAllChatMentions", "chat_id" A..= chat_id ]
-- readAllChatMentions ReadAllChatMentions  { chat_id :: Int } 

