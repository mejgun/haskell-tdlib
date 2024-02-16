module TD.Query.UpgradeBasicGroupChatToSupergroupChat
  (UpgradeBasicGroupChatToSupergroupChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires owner privileges. Deactivates the original basic group. Returns 'TD.Data.Chat.Chat'
data UpgradeBasicGroupChatToSupergroupChat
  = UpgradeBasicGroupChatToSupergroupChat
    { chat_id :: Maybe Int -- ^ Identifier of the chat to upgrade
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradeBasicGroupChatToSupergroupChat where
  shortShow
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

