-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatStatisticsGraph where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChatStatisticsGraph = 
 GetChatStatisticsGraph { x :: Int, token :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatStatisticsGraph where
 toJSON (GetChatStatisticsGraph { x = x, token = token, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatStatisticsGraph", "x" A..= x, "token" A..= token, "chat_id" A..= chat_id ]
-- getChatStatisticsGraph GetChatStatisticsGraph  { x :: Int, token :: String, chat_id :: Int } 

