-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDraftMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage

--main = putStrLn "ok"

data SetChatDraftMessage = 
 SetChatDraftMessage { draft_message :: DraftMessage.DraftMessage, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatDraftMessage where
 toJSON (SetChatDraftMessage { draft_message = draft_message, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDraftMessage", "draft_message" A..= draft_message, "chat_id" A..= chat_id ]
-- setChatDraftMessage SetChatDraftMessage  { draft_message :: DraftMessage.DraftMessage, chat_id :: Int } 

