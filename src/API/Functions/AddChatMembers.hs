-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddChatMembers = 
 AddChatMembers { user_ids :: [Int], chat_id :: Int }  -- deriving (Show)

instance T.ToJSON AddChatMembers where
 toJSON (AddChatMembers { user_ids = user_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addChatMembers", "user_ids" A..= user_ids, "chat_id" A..= chat_id ]
-- addChatMembers AddChatMembers  { user_ids :: [Int], chat_id :: Int } 

