{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessageAddedReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns reactions added for a message, along with their sender
data GetMessageAddedReactions = GetMessageAddedReactions
  { -- | The maximum number of reactions to be returned; must be positive and can't be greater than 100
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | If non-empty, only added reactions with the specified text representation will be returned
    reaction :: Maybe String,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageAddedReactions where
  show
    GetMessageAddedReactions
      { limit = limit,
        offset = offset,
        reaction = reaction,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessageAddedReactions"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "reaction" reaction,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessageAddedReactions where
  toJSON
    GetMessageAddedReactions
      { limit = limit,
        offset = offset,
        reaction = reaction,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessageAddedReactions",
          "limit" A..= limit,
          "offset" A..= offset,
          "reaction" A..= reaction,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
