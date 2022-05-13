{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RevokeGroupCallInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Revokes invite link for a group call. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier
data RevokeGroupCallInviteLink = RevokeGroupCallInviteLink
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show RevokeGroupCallInviteLink where
  show
    RevokeGroupCallInviteLink
      { group_call_id = group_call_id_
      } =
      "RevokeGroupCallInviteLink"
        ++ U.cc
          [ U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON RevokeGroupCallInviteLink where
  toJSON
    RevokeGroupCallInviteLink
      { group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "revokeGroupCallInviteLink",
          "group_call_id" A..= group_call_id_
        ]
