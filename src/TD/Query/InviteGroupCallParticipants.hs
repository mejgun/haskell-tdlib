{-# LANGUAGE OverloadedStrings #-}

module TD.Query.InviteGroupCallParticipants where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Invites users to an active group call. Sends a service message of type messageInviteToGroupCall for video chats
data InviteGroupCallParticipants = InviteGroupCallParticipants
  { -- |
    user_ids :: Maybe [Int],
    -- | Group call identifier @user_ids User identifiers. At most 10 users can be invited simultaneously
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show InviteGroupCallParticipants where
  show
    InviteGroupCallParticipants
      { user_ids = user_ids,
        group_call_id = group_call_id
      } =
      "InviteGroupCallParticipants"
        ++ U.cc
          [ U.p "user_ids" user_ids,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON InviteGroupCallParticipants where
  toJSON
    InviteGroupCallParticipants
      { user_ids = user_ids,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "inviteGroupCallParticipants",
          "user_ids" A..= user_ids,
          "group_call_id" A..= group_call_id
        ]
