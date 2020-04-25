-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDiscussionGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetChatDiscussionGroup = 
 SetChatDiscussionGroup { discussion_chat_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatDiscussionGroup where
 toJSON (SetChatDiscussionGroup { discussion_chat_id = discussion_chat_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDiscussionGroup", "discussion_chat_id" A..= discussion_chat_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatDiscussionGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDiscussionGroup" -> parseSetChatDiscussionGroup v
   _ -> mempty
  where
   parseSetChatDiscussionGroup :: A.Value -> T.Parser SetChatDiscussionGroup
   parseSetChatDiscussionGroup = A.withObject "SetChatDiscussionGroup" $ \o -> do
    discussion_chat_id <- mconcat [ o A..:? "discussion_chat_id", readMaybe <$> (o A..: "discussion_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatDiscussionGroup { discussion_chat_id = discussion_chat_id, chat_id = chat_id }