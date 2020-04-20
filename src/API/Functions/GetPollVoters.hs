-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPollVoters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPollVoters = 
 GetPollVoters { limit :: Int, offset :: Int, option_id :: Int, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetPollVoters where
 toJSON (GetPollVoters { limit = limit, offset = offset, option_id = option_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPollVoters", "limit" A..= limit, "offset" A..= offset, "option_id" A..= option_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getPollVoters GetPollVoters  { limit :: Int, offset :: Int, option_id :: Int, message_id :: Int, chat_id :: Int } 

