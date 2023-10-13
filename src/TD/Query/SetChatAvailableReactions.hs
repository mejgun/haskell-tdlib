module TD.Query.SetChatAvailableReactions(SetChatAvailableReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions

data SetChatAvailableReactions -- ^ Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right
  = SetChatAvailableReactions
    { chat_id             :: Maybe Int                                           -- ^ Identifier of the chat
    , available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions -- ^ Reactions available in the chat. All emoji reactions must be active
    }
  deriving (Eq)

instance Show SetChatAvailableReactions where
  show
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
