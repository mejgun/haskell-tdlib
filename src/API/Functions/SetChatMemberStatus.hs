-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatMemberStatus where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

data SetChatMemberStatus = 
 SetChatMemberStatus { status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON SetChatMemberStatus where
 toJSON (SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatMemberStatus", "status" A..= status, "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatMemberStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatMemberStatus" -> parseSetChatMemberStatus v
   _ -> mempty
  where
   parseSetChatMemberStatus :: A.Value -> T.Parser SetChatMemberStatus
   parseSetChatMemberStatus = A.withObject "SetChatMemberStatus" $ \o -> do
    status <- optional $ o A..: "status"
    user_id <- optional $ o A..: "user_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ SetChatMemberStatus { status = status, user_id = user_id, chat_id = chat_id }