-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenMessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data OpenMessageContent = 
 OpenMessageContent { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON OpenMessageContent where
 toJSON (OpenMessageContent { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "openMessageContent", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- openMessageContent OpenMessageContent  { message_id :: Int, chat_id :: Int } 

