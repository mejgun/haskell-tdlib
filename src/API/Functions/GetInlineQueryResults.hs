-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInlineQueryResults where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data GetInlineQueryResults = 
 GetInlineQueryResults { offset :: String, query :: String, user_location :: Location.Location, chat_id :: Int, bot_user_id :: Int }  -- deriving (Show)

instance T.ToJSON GetInlineQueryResults where
 toJSON (GetInlineQueryResults { offset = offset, query = query, user_location = user_location, chat_id = chat_id, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "getInlineQueryResults", "offset" A..= offset, "query" A..= query, "user_location" A..= user_location, "chat_id" A..= chat_id, "bot_user_id" A..= bot_user_id ]
-- getInlineQueryResults GetInlineQueryResults  { offset :: String, query :: String, user_location :: Location.Location, chat_id :: Int, bot_user_id :: Int } 

