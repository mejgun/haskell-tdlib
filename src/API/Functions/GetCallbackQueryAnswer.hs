-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCallbackQueryAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallbackQueryPayload as CallbackQueryPayload

--main = putStrLn "ok"

data GetCallbackQueryAnswer = 
 GetCallbackQueryAnswer { payload :: CallbackQueryPayload.CallbackQueryPayload, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetCallbackQueryAnswer where
 toJSON (GetCallbackQueryAnswer { payload = payload, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getCallbackQueryAnswer", "payload" A..= payload, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getCallbackQueryAnswer GetCallbackQueryAnswer  { payload :: CallbackQueryPayload.CallbackQueryPayload, message_id :: Int, chat_id :: Int } 

