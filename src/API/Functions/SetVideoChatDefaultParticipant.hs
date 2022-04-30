-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetVideoChatDefaultParticipant where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Changes default participant identifier, on whose behalf a video chat in the chat will be joined 
-- 
-- __chat_id__ Chat identifier
-- 
-- __default_participant_id__ Default group call participant identifier to join the video chats
data SetVideoChatDefaultParticipant = 

 SetVideoChatDefaultParticipant { default_participant_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetVideoChatDefaultParticipant where
 show SetVideoChatDefaultParticipant { default_participant_id=default_participant_id, chat_id=chat_id } =
  "SetVideoChatDefaultParticipant" ++ U.cc [U.p "default_participant_id" default_participant_id, U.p "chat_id" chat_id ]

instance T.ToJSON SetVideoChatDefaultParticipant where
 toJSON SetVideoChatDefaultParticipant { default_participant_id = default_participant_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setVideoChatDefaultParticipant", "default_participant_id" A..= default_participant_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetVideoChatDefaultParticipant where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setVideoChatDefaultParticipant" -> parseSetVideoChatDefaultParticipant v
   _ -> mempty
  where
   parseSetVideoChatDefaultParticipant :: A.Value -> T.Parser SetVideoChatDefaultParticipant
   parseSetVideoChatDefaultParticipant = A.withObject "SetVideoChatDefaultParticipant" $ \o -> do
    default_participant_id <- o A..:? "default_participant_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetVideoChatDefaultParticipant { default_participant_id = default_participant_id, chat_id = chat_id }
 parseJSON _ = mempty
