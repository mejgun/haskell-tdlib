-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetGameHighScores = 
 GetGameHighScores { user_id :: Int, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetGameHighScores where
 toJSON (GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getGameHighScores", "user_id" A..= user_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getGameHighScores GetGameHighScores  { user_id :: Int, message_id :: Int, chat_id :: Int } 

