module TD.Query.SetDefaultGroupAdministratorRights
  (SetDefaultGroupAdministratorRights(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights

-- | Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots only. Returns 'TD.Data.Ok.Ok'
data SetDefaultGroupAdministratorRights
  = SetDefaultGroupAdministratorRights
    { default_group_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Default administrator rights for adding the bot to basic group and supergroup chats; pass null to remove default rights
    }
  deriving (Eq, Show)

instance I.ShortShow SetDefaultGroupAdministratorRights where
  shortShow
    SetDefaultGroupAdministratorRights
      { default_group_administrator_rights = default_group_administrator_rights_
      }
        = "SetDefaultGroupAdministratorRights"
          ++ I.cc
          [ "default_group_administrator_rights" `I.p` default_group_administrator_rights_
          ]

instance AT.ToJSON SetDefaultGroupAdministratorRights where
  toJSON
    SetDefaultGroupAdministratorRights
      { default_group_administrator_rights = default_group_administrator_rights_
      }
        = A.object
          [ "@type"                              A..= AT.String "setDefaultGroupAdministratorRights"
          , "default_group_administrator_rights" A..= default_group_administrator_rights_
          ]

