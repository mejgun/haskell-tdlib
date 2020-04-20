-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPollAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetPollAnswer = 
 SetPollAnswer { option_ids :: [Int], message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetPollAnswer where
 toJSON (SetPollAnswer { option_ids = option_ids, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setPollAnswer", "option_ids" A..= option_ids, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- setPollAnswer SetPollAnswer  { option_ids :: [Int], message_id :: Int, chat_id :: Int } 

