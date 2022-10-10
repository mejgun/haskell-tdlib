{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageAddedReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
-- Returns reactions added for a message, along with their sender
data GetMessageAddedReactions = GetMessageAddedReactions
  { -- | The maximum number of reactions to be returned; must be positive and can't be greater than 100
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Type of the reactions to return; pass null to return all added reactions
    reaction_type :: Maybe ReactionType.ReactionType,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageAddedReactions where
  show
    GetMessageAddedReactions
      { limit = limit_,
        offset = offset_,
        reaction_type = reaction_type_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageAddedReactions"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "reaction_type" reaction_type_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageAddedReactions where
  toJSON
    GetMessageAddedReactions
      { limit = limit_,
        offset = offset_,
        reaction_type = reaction_type_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageAddedReactions",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "reaction_type" A..= reaction_type_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
