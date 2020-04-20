-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMemberStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

--main = putStrLn "ok"

data SetChatMemberStatus = 
 SetChatMemberStatus { status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatMemberStatus where
 toJSON (SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatMemberStatus", "status" A..= status, "user_id" A..= user_id, "chat_id" A..= chat_id ]
-- setChatMemberStatus SetChatMemberStatus  { status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int, chat_id :: Int } 



instance T.FromJSON SetChatMemberStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatMemberStatus" -> parseSetChatMemberStatus v
  where
   parseSetChatMemberStatus :: A.Value -> T.Parser SetChatMemberStatus
   parseSetChatMemberStatus = A.withObject "SetChatMemberStatus" $ \o -> do
    status <- o A..: "status"
    user_id <- o A..: "user_id"
    chat_id <- o A..: "chat_id"
    return $ SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }