-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatPermissions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

--main = putStrLn "ok"

data SetChatPermissions = 
 SetChatPermissions { permissions :: ChatPermissions.ChatPermissions, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatPermissions where
 toJSON (SetChatPermissions { permissions = permissions, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatPermissions", "permissions" A..= permissions, "chat_id" A..= chat_id ]
-- setChatPermissions SetChatPermissions  { permissions :: ChatPermissions.ChatPermissions, chat_id :: Int } 

