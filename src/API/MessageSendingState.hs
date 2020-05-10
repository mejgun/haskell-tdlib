-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSendingState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about the sending state of the message
data MessageSendingState = 
 -- |
 -- 
 -- The message is being sent now, but has not yet been delivered to the server
 MessageSendingStatePending |
 -- |
 -- 
 -- The message failed to be sent 
 -- 
 -- __error_code__ An error code; 0 if unknown
 -- 
 -- __error_message__ Error message
 -- 
 -- __can_retry__ True, if the message can be re-sent
 -- 
 -- __retry_after__ Time left before the message can be re-sent, in seconds. No update is sent when this field changes
 MessageSendingStateFailed { retry_after :: Maybe Float, can_retry :: Maybe Bool, error_message :: Maybe String, error_code :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageSendingState where
 toJSON (MessageSendingStatePending {  }) =
  A.object [ "@type" A..= T.String "messageSendingStatePending" ]

 toJSON (MessageSendingStateFailed { retry_after = retry_after, can_retry = can_retry, error_message = error_message, error_code = error_code }) =
  A.object [ "@type" A..= T.String "messageSendingStateFailed", "retry_after" A..= retry_after, "can_retry" A..= can_retry, "error_message" A..= error_message, "error_code" A..= error_code ]

instance T.FromJSON MessageSendingState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSendingStatePending" -> parseMessageSendingStatePending v
   "messageSendingStateFailed" -> parseMessageSendingStateFailed v
   _ -> mempty
  where
   parseMessageSendingStatePending :: A.Value -> T.Parser MessageSendingState
   parseMessageSendingStatePending = A.withObject "MessageSendingStatePending" $ \o -> do
    return $ MessageSendingStatePending {  }

   parseMessageSendingStateFailed :: A.Value -> T.Parser MessageSendingState
   parseMessageSendingStateFailed = A.withObject "MessageSendingStateFailed" $ \o -> do
    retry_after <- o A..:? "retry_after"
    can_retry <- o A..:? "can_retry"
    error_message <- o A..:? "error_message"
    error_code <- mconcat [ o A..:? "error_code", readMaybe <$> (o A..: "error_code" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageSendingStateFailed { retry_after = retry_after, can_retry = can_retry, error_message = error_message, error_code = error_code }