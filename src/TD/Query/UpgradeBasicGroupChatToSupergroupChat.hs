module TD.Query.UpgradeBasicGroupChatToSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data UpgradeBasicGroupChatToSupergroupChat -- ^ Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires creator privileges. Deactivates the original basic group
  = UpgradeBasicGroupChatToSupergroupChat
    { chat_id :: Maybe Int -- ^ Identifier of the chat to upgrade
    }
  deriving (Eq)

instance Show UpgradeBasicGroupChatToSupergroupChat where
  show
    UpgradeBasicGroupChatToSupergroupChat
      { chat_id = chat_id_
      }
        = "UpgradeBasicGroupChatToSupergroupChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON UpgradeBasicGroupChatToSupergroupChat where
  toJSON
    UpgradeBasicGroupChatToSupergroupChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "upgradeBasicGroupChatToSupergroupChat"
          , "chat_id" A..= chat_id_
          ]
