-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetVoiceChatAvailableParticipants where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns list of participant identifiers, which can be used to join voice chats in a chat 
-- 
-- __chat_id__ Chat identifier
data GetVoiceChatAvailableParticipants = 

 GetVoiceChatAvailableParticipants { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetVoiceChatAvailableParticipants where
 toJSON (GetVoiceChatAvailableParticipants { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getVoiceChatAvailableParticipants", "chat_id" A..= chat_id ]

instance T.FromJSON GetVoiceChatAvailableParticipants where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getVoiceChatAvailableParticipants" -> parseGetVoiceChatAvailableParticipants v
   _ -> mempty
  where
   parseGetVoiceChatAvailableParticipants :: A.Value -> T.Parser GetVoiceChatAvailableParticipants
   parseGetVoiceChatAvailableParticipants = A.withObject "GetVoiceChatAvailableParticipants" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetVoiceChatAvailableParticipants { chat_id = chat_id }