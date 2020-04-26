-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDraftMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage

-- |
-- 
-- Changes the draft message in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __draft_message__ New draft message; may be null
data SetChatDraftMessage = 
 SetChatDraftMessage { draft_message :: Maybe DraftMessage.DraftMessage, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatDraftMessage where
 toJSON (SetChatDraftMessage { draft_message = draft_message, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDraftMessage", "draft_message" A..= draft_message, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatDraftMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDraftMessage" -> parseSetChatDraftMessage v
   _ -> mempty
  where
   parseSetChatDraftMessage :: A.Value -> T.Parser SetChatDraftMessage
   parseSetChatDraftMessage = A.withObject "SetChatDraftMessage" $ \o -> do
    draft_message <- o A..:? "draft_message"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatDraftMessage { draft_message = draft_message, chat_id = chat_id }