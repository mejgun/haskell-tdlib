-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UpgradeBasicGroupChatToSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UpgradeBasicGroupChatToSupergroupChat = 
 UpgradeBasicGroupChatToSupergroupChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON UpgradeBasicGroupChatToSupergroupChat where
 toJSON (UpgradeBasicGroupChatToSupergroupChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "upgradeBasicGroupChatToSupergroupChat", "chat_id" A..= chat_id ]
-- upgradeBasicGroupChatToSupergroupChat UpgradeBasicGroupChatToSupergroupChat  { chat_id :: Int } 

