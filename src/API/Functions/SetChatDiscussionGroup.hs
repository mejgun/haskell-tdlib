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



instance T.FromJSON SetChatDiscussionGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDiscussionGroup" -> parseSetChatDiscussionGroup v
  where
   parseSetChatDiscussionGroup :: A.Value -> T.Parser SetChatDiscussionGroup
   parseSetChatDiscussionGroup = A.withObject "SetChatDiscussionGroup" $ \o -> do
    discussion_chat_id <- o A..: "discussion_chat_id"
    chat_id <- o A..: "chat_id"
    return $ SetChatDiscussionGroup { discussion_chat_id = discussion_chat_id, chat_id = chat_id }