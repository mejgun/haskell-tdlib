{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.UpgradeBasicGroupChatToSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires creator privileges. Deactivates the original basic group @chat_id Identifier of the chat to upgrade
data UpgradeBasicGroupChatToSupergroupChat = UpgradeBasicGroupChatToSupergroupChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show UpgradeBasicGroupChatToSupergroupChat where
  show
    UpgradeBasicGroupChatToSupergroupChat
      { chat_id = chat_id_
      } =
      "UpgradeBasicGroupChatToSupergroupChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON UpgradeBasicGroupChatToSupergroupChat where
  toJSON
    UpgradeBasicGroupChatToSupergroupChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "upgradeBasicGroupChatToSupergroupChat",
          "chat_id" A..= chat_id_
        ]
