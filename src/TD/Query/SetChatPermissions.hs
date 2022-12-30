{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatPermissions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified Utils as U

-- |
-- Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right
data SetChatPermissions = SetChatPermissions
  { -- | New non-administrator members permissions in the chat
    permissions :: Maybe ChatPermissions.ChatPermissions,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatPermissions where
  show
    SetChatPermissions
      { permissions = permissions_,
        chat_id = chat_id_
      } =
      "SetChatPermissions"
        ++ U.cc
          [ U.p "permissions" permissions_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatPermissions where
  toJSON
    SetChatPermissions
      { permissions = permissions_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatPermissions",
          "permissions" A..= permissions_,
          "chat_id" A..= chat_id_
        ]
