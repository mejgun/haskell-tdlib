module TD.Query.SetChatPermissions
  (SetChatPermissions(..)
  , defaultSetChatPermissions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPermissions as ChatPermissions

-- | Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right. Returns 'TD.Data.Ok.Ok'
data SetChatPermissions
  = SetChatPermissions
    { chat_id     :: Maybe Int                             -- ^ Chat identifier
    , permissions :: Maybe ChatPermissions.ChatPermissions -- ^ New non-administrator members permissions in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatPermissions where
  shortShow
    SetChatPermissions
      { chat_id     = chat_id_
      , permissions = permissions_
      }
        = "SetChatPermissions"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "permissions" `I.p` permissions_
          ]

instance AT.ToJSON SetChatPermissions where
  toJSON
    SetChatPermissions
      { chat_id     = chat_id_
      , permissions = permissions_
      }
        = A.object
          [ "@type"       A..= AT.String "setChatPermissions"
          , "chat_id"     A..= chat_id_
          , "permissions" A..= permissions_
          ]

defaultSetChatPermissions :: SetChatPermissions
defaultSetChatPermissions =
  SetChatPermissions
    { chat_id     = Nothing
    , permissions = Nothing
    }

