module TD.Query.SetChatAvailableReactions
  (SetChatAvailableReactions(..)
  , defaultSetChatAvailableReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions

-- | Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right. Returns 'TD.Data.Ok.Ok'
data SetChatAvailableReactions
  = SetChatAvailableReactions
    { chat_id             :: Maybe Int                                           -- ^ Identifier of the chat
    , available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions -- ^ Reactions available in the chat. All explicitly specified emoji reactions must be active. In channel chats up to the chat's boost level custom emoji reactions can be explicitly specified
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatAvailableReactions where
  shortShow
    SetChatAvailableReactions
      { chat_id             = chat_id_
      , available_reactions = available_reactions_
      }
        = "SetChatAvailableReactions"
          ++ I.cc
          [ "chat_id"             `I.p` chat_id_
          , "available_reactions" `I.p` available_reactions_
          ]

instance AT.ToJSON SetChatAvailableReactions where
  toJSON
    SetChatAvailableReactions
      { chat_id             = chat_id_
      , available_reactions = available_reactions_
      }
        = A.object
          [ "@type"               A..= AT.String "setChatAvailableReactions"
          , "chat_id"             A..= chat_id_
          , "available_reactions" A..= available_reactions_
          ]

defaultSetChatAvailableReactions :: SetChatAvailableReactions
defaultSetChatAvailableReactions =
  SetChatAvailableReactions
    { chat_id             = Nothing
    , available_reactions = Nothing
    }

