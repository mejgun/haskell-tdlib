{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatPermissions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatPermissions as ChatPermissions
import qualified Utils as U

-- |
-- Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right
data SetChatPermissions = SetChatPermissions
  { -- |
    permissions :: Maybe ChatPermissions.ChatPermissions,
    -- | Chat identifier @permissions New non-administrator members permissions in the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatPermissions where
  show
    SetChatPermissions
      { permissions = permissions,
        chat_id = chat_id
      } =
      "SetChatPermissions"
        ++ U.cc
          [ U.p "permissions" permissions,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatPermissions where
  toJSON
    SetChatPermissions
      { permissions = permissions,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatPermissions",
          "permissions" A..= permissions,
          "chat_id" A..= chat_id
        ]
