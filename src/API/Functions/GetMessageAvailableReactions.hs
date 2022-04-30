-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageAvailableReactions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns reactions, which can be added to a message. The list can change after updateReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
data GetMessageAvailableReactions = 

 GetMessageAvailableReactions { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageAvailableReactions where
 show GetMessageAvailableReactions { message_id=message_id, chat_id=chat_id } =
  "GetMessageAvailableReactions" ++ U.cc [U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON GetMessageAvailableReactions where
 toJSON GetMessageAvailableReactions { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageAvailableReactions", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageAvailableReactions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageAvailableReactions" -> parseGetMessageAvailableReactions v
   _ -> mempty
  where
   parseGetMessageAvailableReactions :: A.Value -> T.Parser GetMessageAvailableReactions
   parseGetMessageAvailableReactions = A.withObject "GetMessageAvailableReactions" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageAvailableReactions { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
