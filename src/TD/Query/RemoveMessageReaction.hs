{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveMessageReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
-- Removes a reaction from a message. A chosen reaction can always be removed
data RemoveMessageReaction = RemoveMessageReaction
  { -- | Type of the reaction to remove
    reaction_type :: Maybe ReactionType.ReactionType,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show RemoveMessageReaction where
  show
    RemoveMessageReaction
      { reaction_type = reaction_type_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "RemoveMessageReaction"
        ++ U.cc
          [ U.p "reaction_type" reaction_type_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON RemoveMessageReaction where
  toJSON
    RemoveMessageReaction
      { reaction_type = reaction_type_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "removeMessageReaction",
          "reaction_type" A..= reaction_type_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
