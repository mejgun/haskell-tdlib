-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DraftMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent

--main = putStrLn "ok"

data DraftMessage = 
 DraftMessage { input_message_text :: InputMessageContent.InputMessageContent, date :: Int, reply_to_message_id :: Int }  -- deriving (Show)

instance T.ToJSON DraftMessage where
 toJSON (DraftMessage { input_message_text = input_message_text, date = date, reply_to_message_id = reply_to_message_id }) =
  A.object [ "@type" A..= T.String "draftMessage", "input_message_text" A..= input_message_text, "date" A..= date, "reply_to_message_id" A..= reply_to_message_id ]
-- draftMessage DraftMessage  { input_message_text :: InputMessageContent.InputMessageContent, date :: Int, reply_to_message_id :: Int } 

