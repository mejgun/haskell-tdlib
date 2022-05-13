{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetDefaultGroupAdministratorRights where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified Utils as U

-- |
-- Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots only @default_group_administrator_rights Default administrator rights for adding the bot to basic group and supergroup chats; may be null
data SetDefaultGroupAdministratorRights = SetDefaultGroupAdministratorRights
  { -- |
    default_group_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights
  }
  deriving (Eq)

instance Show SetDefaultGroupAdministratorRights where
  show
    SetDefaultGroupAdministratorRights
      { default_group_administrator_rights = default_group_administrator_rights_
      } =
      "SetDefaultGroupAdministratorRights"
        ++ U.cc
          [ U.p "default_group_administrator_rights" default_group_administrator_rights_
          ]

instance T.ToJSON SetDefaultGroupAdministratorRights where
  toJSON
    SetDefaultGroupAdministratorRights
      { default_group_administrator_rights = default_group_administrator_rights_
      } =
      A.object
        [ "@type" A..= T.String "setDefaultGroupAdministratorRights",
          "default_group_administrator_rights" A..= default_group_administrator_rights_
        ]
