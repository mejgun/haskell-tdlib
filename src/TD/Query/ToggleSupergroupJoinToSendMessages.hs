{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupJoinToSendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether joining is mandatory to send messages to a discussion supergroup; requires can_restrict_members administrator right @supergroup_id Identifier of the supergroup @join_to_send_messages New value of join_to_send_messages
data ToggleSupergroupJoinToSendMessages = ToggleSupergroupJoinToSendMessages
  { -- |
    join_to_send_messages :: Maybe Bool,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupJoinToSendMessages where
  show
    ToggleSupergroupJoinToSendMessages
      { join_to_send_messages = join_to_send_messages_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupJoinToSendMessages"
        ++ U.cc
          [ U.p "join_to_send_messages" join_to_send_messages_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupJoinToSendMessages where
  toJSON
    ToggleSupergroupJoinToSendMessages
      { join_to_send_messages = join_to_send_messages_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupJoinToSendMessages",
          "join_to_send_messages" A..= join_to_send_messages_,
          "supergroup_id" A..= supergroup_id_
        ]
