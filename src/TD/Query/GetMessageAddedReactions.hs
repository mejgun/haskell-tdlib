{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { limit = limit_,
        offset = offset_,
        reaction = reaction_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageAddedReactions"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "reaction" reaction_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageAddedReactions where
  toJSON
    GetMessageAddedReactions
      { limit = limit_,
        offset = offset_,
        reaction = reaction_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageAddedReactions",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "reaction" A..= reaction_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
