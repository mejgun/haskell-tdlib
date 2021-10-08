-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetVoiceChatDefaultParticipant where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Changes default participant identifier, which can be used to join voice chats in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __default_participant_id__ Default group call participant identifier to join the voice chats
data SetVoiceChatDefaultParticipant = 

 SetVoiceChatDefaultParticipant { default_participant_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetVoiceChatDefaultParticipant where
 show SetVoiceChatDefaultParticipant { default_participant_id=default_participant_id, chat_id=chat_id } =
  "SetVoiceChatDefaultParticipant" ++ cc [p "default_participant_id" default_participant_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetVoiceChatDefaultParticipant where
 toJSON SetVoiceChatDefaultParticipant { default_participant_id = default_participant_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setVoiceChatDefaultParticipant", "default_participant_id" A..= default_participant_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetVoiceChatDefaultParticipant where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setVoiceChatDefaultParticipant" -> parseSetVoiceChatDefaultParticipant v
   _ -> mempty
  where
   parseSetVoiceChatDefaultParticipant :: A.Value -> T.Parser SetVoiceChatDefaultParticipant
   parseSetVoiceChatDefaultParticipant = A.withObject "SetVoiceChatDefaultParticipant" $ \o -> do
    default_participant_id <- o A..:? "default_participant_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetVoiceChatDefaultParticipant { default_participant_id = default_participant_id, chat_id = chat_id }
 parseJSON _ = mempty
