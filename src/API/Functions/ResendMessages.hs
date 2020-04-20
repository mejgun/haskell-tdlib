-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendMessages = 
 ResendMessages { message_ids :: [Int], chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ResendMessages where
 toJSON (ResendMessages { message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "resendMessages", "message_ids" A..= message_ids, "chat_id" A..= chat_id ]
-- resendMessages ResendMessages  { message_ids :: [Int], chat_id :: Int } 

