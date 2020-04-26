-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageSchedulingState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState

-- |
-- 
-- Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed 
-- 
-- __chat_id__ The chat the message belongs to
-- 
-- __message_id__ Identifier of the message
-- 
-- __scheduling_state__ The new message scheduling state. Pass null to send the message immediately
data EditMessageSchedulingState = 
 EditMessageSchedulingState { scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON EditMessageSchedulingState where
 toJSON (EditMessageSchedulingState { scheduling_state = scheduling_state, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageSchedulingState", "scheduling_state" A..= scheduling_state, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageSchedulingState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageSchedulingState" -> parseEditMessageSchedulingState v
   _ -> mempty
  where
   parseEditMessageSchedulingState :: A.Value -> T.Parser EditMessageSchedulingState
   parseEditMessageSchedulingState = A.withObject "EditMessageSchedulingState" $ \o -> do
    scheduling_state <- o A..:? "scheduling_state"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditMessageSchedulingState { scheduling_state = scheduling_state, message_id = message_id, chat_id = chat_id }