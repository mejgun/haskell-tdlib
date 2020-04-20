-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

--main = putStrLn "ok"

data GetChatMessageCount = 
 GetChatMessageCount { return_local :: Bool, _filter :: SearchMessagesFilter.SearchMessagesFilter, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChatMessageCount where
 toJSON (GetChatMessageCount { return_local = return_local, _filter = _filter, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMessageCount", "return_local" A..= return_local, "filter" A..= _filter, "chat_id" A..= chat_id ]
-- getChatMessageCount GetChatMessageCount  { return_local :: Bool, _filter :: SearchMessagesFilter.SearchMessagesFilter, chat_id :: Int } 

