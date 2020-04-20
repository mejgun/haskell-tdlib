-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLocally where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetMessageLocally = 
 GetMessageLocally { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetMessageLocally where
 toJSON (GetMessageLocally { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageLocally", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getMessageLocally GetMessageLocally  { message_id :: Int, chat_id :: Int } 

