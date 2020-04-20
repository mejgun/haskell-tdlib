-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerCallbackQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AnswerCallbackQuery = 
 AnswerCallbackQuery { cache_time :: Int, url :: String, show_alert :: Bool, text :: String, callback_query_id :: Int }  -- deriving (Show)

instance T.ToJSON AnswerCallbackQuery where
 toJSON (AnswerCallbackQuery { cache_time = cache_time, url = url, show_alert = show_alert, text = text, callback_query_id = callback_query_id }) =
  A.object [ "@type" A..= T.String "answerCallbackQuery", "cache_time" A..= cache_time, "url" A..= url, "show_alert" A..= show_alert, "text" A..= text, "callback_query_id" A..= callback_query_id ]
-- answerCallbackQuery AnswerCallbackQuery  { cache_time :: Int, url :: String, show_alert :: Bool, text :: String, callback_query_id :: Int } 

