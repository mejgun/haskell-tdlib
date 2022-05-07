{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetGroupCallInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns invite link to a video chat in a public chat
data GetGroupCallInviteLink = GetGroupCallInviteLink
  { -- | Pass true if the invite link needs to contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themselves. Requires groupCall.can_be_managed group call flag
    can_self_unmute :: Maybe Bool,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetGroupCallInviteLink where
  show
    GetGroupCallInviteLink
      { can_self_unmute = can_self_unmute,
        group_call_id = group_call_id
      } =
      "GetGroupCallInviteLink"
        ++ U.cc
          [ U.p "can_self_unmute" can_self_unmute,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON GetGroupCallInviteLink where
  toJSON
    GetGroupCallInviteLink
      { can_self_unmute = can_self_unmute,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "getGroupCallInviteLink",
          "can_self_unmute" A..= can_self_unmute,
          "group_call_id" A..= group_call_id
        ]
