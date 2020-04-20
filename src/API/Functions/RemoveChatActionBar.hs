-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveChatActionBar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveChatActionBar = 
 RemoveChatActionBar { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON RemoveChatActionBar where
 toJSON (RemoveChatActionBar { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "removeChatActionBar", "chat_id" A..= chat_id ]
-- removeChatActionBar RemoveChatActionBar  { chat_id :: Int } 

