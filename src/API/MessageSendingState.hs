-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSendingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data MessageSendingState = 
 MessageSendingStatePending 
 | MessageSendingStateFailed { retry_after :: Float, can_retry :: Bool, error_message :: String, error_code :: Int }  -- deriving (Show)

instance T.ToJSON MessageSendingState where
 toJSON (MessageSendingStatePending {  }) =
  A.object [ "@type" A..= T.String "messageSendingStatePending" ]

 toJSON (MessageSendingStateFailed { retry_after = retry_after, can_retry = can_retry, error_message = error_message, error_code = error_code }) =
  A.object [ "@type" A..= T.String "messageSendingStateFailed", "retry_after" A..= retry_after, "can_retry" A..= can_retry, "error_message" A..= error_message, "error_code" A..= error_code ]
-- messageSendingStatePending MessageSendingState 

-- messageSendingStateFailed MessageSendingState  { retry_after :: Float, can_retry :: Bool, error_message :: String, error_code :: Int } 

