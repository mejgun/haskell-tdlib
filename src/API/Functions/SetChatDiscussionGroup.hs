-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDiscussionGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatDiscussionGroup = 
 SetChatDiscussionGroup { discussion_chat_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatDiscussionGroup where
 toJSON (SetChatDiscussionGroup { discussion_chat_id = discussion_chat_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDiscussionGroup", "discussion_chat_id" A..= discussion_chat_id, "chat_id" A..= chat_id ]
-- setChatDiscussionGroup SetChatDiscussionGroup  { discussion_chat_id :: Int, chat_id :: Int } 

