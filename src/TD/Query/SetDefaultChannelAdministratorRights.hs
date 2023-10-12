module TD.Query.SetDefaultChannelAdministratorRights where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights

data SetDefaultChannelAdministratorRights -- ^ Sets default administrator rights for adding the bot to channel chats; for bots only
  = SetDefaultChannelAdministratorRights
    { default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Default administrator rights for adding the bot to channels; pass null to remove default rights
    }
  deriving (Eq)

instance Show SetDefaultChannelAdministratorRights where
  show
    SetDefaultChannelAdministratorRights
      { default_channel_administrator_rights = default_channel_administrator_rights_
      }
        = "SetDefaultChannelAdministratorRights"
          ++ I.cc
          [ "default_channel_administrator_rights" `I.p` default_channel_administrator_rights_
          ]

instance AT.ToJSON SetDefaultChannelAdministratorRights where
  toJSON
    SetDefaultChannelAdministratorRights
      { default_channel_administrator_rights = default_channel_administrator_rights_
      }
        = A.object
          [ "@type"                                A..= AT.String "setDefaultChannelAdministratorRights"
          , "default_channel_administrator_rights" A..= default_channel_administrator_rights_
          ]
