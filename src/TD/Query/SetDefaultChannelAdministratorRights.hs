module TD.Query.SetDefaultChannelAdministratorRights
  (SetDefaultChannelAdministratorRights(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights

-- | Sets default administrator rights for adding the bot to channel chats; for bots only. Returns 'TD.Data.Ok.Ok'
data SetDefaultChannelAdministratorRights
  = SetDefaultChannelAdministratorRights
    { default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Default administrator rights for adding the bot to channels; pass null to remove default rights
    }
  deriving (Eq, Show)

instance I.ShortShow SetDefaultChannelAdministratorRights where
  shortShow
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

