{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatAvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right @chat_id Identifier of the chat @available_reactions New list of reactions, available in the chat. All reactions must be active
data SetChatAvailableReactions = SetChatAvailableReactions
  { -- |
    available_reactions :: Maybe [String],
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatAvailableReactions where
  show
    SetChatAvailableReactions
      { available_reactions = available_reactions,
        chat_id = chat_id
      } =
      "SetChatAvailableReactions"
        ++ U.cc
          [ U.p "available_reactions" available_reactions,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatAvailableReactions where
  toJSON
    SetChatAvailableReactions
      { available_reactions = available_reactions,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatAvailableReactions",
          "available_reactions" A..= available_reactions,
          "chat_id" A..= chat_id
        ]
