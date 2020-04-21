-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatAction as ChatAction

--main = putStrLn "ok"

data SendChatAction = 
 SendChatAction { action :: ChatAction.ChatAction, chat_id :: Int }  deriving (Show)

instance T.ToJSON SendChatAction where
 toJSON (SendChatAction { action = action, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatAction", "action" A..= action, "chat_id" A..= chat_id ]



instance T.FromJSON SendChatAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatAction" -> parseSendChatAction v

   _ -> mempty ""
  where
   parseSendChatAction :: A.Value -> T.Parser SendChatAction
   parseSendChatAction = A.withObject "SendChatAction" $ \o -> do
    action <- o A..: "action"
    chat_id <- o A..: "chat_id"
    return $ SendChatAction { action = action, chat_id = chat_id }