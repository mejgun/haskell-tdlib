-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatAction as ChatAction

-- |
-- 
-- Sends a notification about user activity in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __action__ The action description
data SendChatAction = 

 SendChatAction { action :: Maybe ChatAction.ChatAction, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendChatAction where
 toJSON (SendChatAction { action = action, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatAction", "action" A..= action, "chat_id" A..= chat_id ]

instance T.FromJSON SendChatAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatAction" -> parseSendChatAction v
   _ -> mempty
  where
   parseSendChatAction :: A.Value -> T.Parser SendChatAction
   parseSendChatAction = A.withObject "SendChatAction" $ \o -> do
    action <- o A..:? "action"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendChatAction { action = action, chat_id = chat_id }