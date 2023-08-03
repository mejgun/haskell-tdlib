{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetDefaultChannelAdministratorRights where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified Utils as U

-- |
-- Sets default administrator rights for adding the bot to channel chats; for bots only @default_channel_administrator_rights Default administrator rights for adding the bot to channels; pass null to remove default rights
data SetDefaultChannelAdministratorRights = SetDefaultChannelAdministratorRights
  { -- |
    default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights
  }
  deriving (Eq)

instance Show SetDefaultChannelAdministratorRights where
  show
    SetDefaultChannelAdministratorRights
      { default_channel_administrator_rights = default_channel_administrator_rights_
      } =
      "SetDefaultChannelAdministratorRights"
        ++ U.cc
          [ U.p "default_channel_administrator_rights" default_channel_administrator_rights_
          ]

instance T.ToJSON SetDefaultChannelAdministratorRights where
  toJSON
    SetDefaultChannelAdministratorRights
      { default_channel_administrator_rights = default_channel_administrator_rights_
      } =
      A.object
        [ "@type" A..= T.String "setDefaultChannelAdministratorRights",
          "default_channel_administrator_rights" A..= default_channel_administrator_rights_
        ]
