-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatRecentLocationMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchChatRecentLocationMessages = 
 SearchChatRecentLocationMessages { limit :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchChatRecentLocationMessages where
 toJSON (SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatRecentLocationMessages", "limit" A..= limit, "chat_id" A..= chat_id ]
-- searchChatRecentLocationMessages SearchChatRecentLocationMessages  { limit :: Int, chat_id :: Int } 

