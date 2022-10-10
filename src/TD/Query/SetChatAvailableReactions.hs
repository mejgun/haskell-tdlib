{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatAvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified Utils as U

-- |
-- Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right @chat_id Identifier of the chat @available_reactions Reactions available in the chat. All emoji reactions must be active
data SetChatAvailableReactions = SetChatAvailableReactions
  { -- |
    available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatAvailableReactions where
  show
    SetChatAvailableReactions
      { available_reactions = available_reactions_,
        chat_id = chat_id_
      } =
      "SetChatAvailableReactions"
        ++ U.cc
          [ U.p "available_reactions" available_reactions_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatAvailableReactions where
  toJSON
    SetChatAvailableReactions
      { available_reactions = available_reactions_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatAvailableReactions",
          "available_reactions" A..= available_reactions_,
          "chat_id" A..= chat_id_
        ]
