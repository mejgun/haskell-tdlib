-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GenerateChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GenerateChatInviteLink = 
 GenerateChatInviteLink { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GenerateChatInviteLink where
 toJSON (GenerateChatInviteLink { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "generateChatInviteLink", "chat_id" A..= chat_id ]
-- generateChatInviteLink GenerateChatInviteLink  { chat_id :: Int } 

