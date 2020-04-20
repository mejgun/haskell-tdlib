-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsMessageInteractionCounters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatStatisticsMessageInteractionCounters = 
 ChatStatisticsMessageInteractionCounters { forward_count :: Int, view_count :: Int, message_id :: Int }  -- deriving (Show)

instance T.ToJSON ChatStatisticsMessageInteractionCounters where
 toJSON (ChatStatisticsMessageInteractionCounters { forward_count = forward_count, view_count = view_count, message_id = message_id }) =
  A.object [ "@type" A..= T.String "chatStatisticsMessageInteractionCounters", "forward_count" A..= forward_count, "view_count" A..= view_count, "message_id" A..= message_id ]
-- chatStatisticsMessageInteractionCounters ChatStatisticsMessageInteractionCounters  { forward_count :: Int, view_count :: Int, message_id :: Int } 

