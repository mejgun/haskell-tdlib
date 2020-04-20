-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerCustomQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AnswerCustomQuery = 
 AnswerCustomQuery { _data :: String, custom_query_id :: Int }  -- deriving (Show)

instance T.ToJSON AnswerCustomQuery where
 toJSON (AnswerCustomQuery { _data = _data, custom_query_id = custom_query_id }) =
  A.object [ "@type" A..= T.String "answerCustomQuery", "data" A..= _data, "custom_query_id" A..= custom_query_id ]
-- answerCustomQuery AnswerCustomQuery  { _data :: String, custom_query_id :: Int } 

