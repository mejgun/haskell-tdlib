{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetPollVoters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns users voted for the specified option in a non-anonymous polls. For optimal performance, the number of returned users is chosen by TDLib
data GetPollVoters = GetPollVoters
  { -- | The maximum number of users to be returned; must be positive and can't be greater than 50. For optimal performance, the number of returned users is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached
    limit :: Maybe Int,
    -- | Number of users to skip in the result; must be non-negative
    offset :: Maybe Int,
    -- | 0-based identifier of the answer option
    option_id :: Maybe Int,
    -- | Identifier of the message containing the poll
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the poll belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPollVoters where
  show
    GetPollVoters
      { limit = limit,
        offset = offset,
        option_id = option_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetPollVoters"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "option_id" option_id,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetPollVoters where
  toJSON
    GetPollVoters
      { limit = limit,
        offset = offset,
        option_id = option_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getPollVoters",
          "limit" A..= limit,
          "offset" A..= offset,
          "option_id" A..= option_id,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
