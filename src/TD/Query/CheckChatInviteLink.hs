{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the validity of an invite link for a chat and returns information about the corresponding chat @invite_link Invite link to be checked
data CheckChatInviteLink = CheckChatInviteLink
  { -- |
    invite_link :: Maybe String
  }
  deriving (Eq)

instance Show CheckChatInviteLink where
  show
    CheckChatInviteLink
      { invite_link = invite_link_
      } =
      "CheckChatInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link_
          ]

instance T.ToJSON CheckChatInviteLink where
  toJSON
    CheckChatInviteLink
      { invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "checkChatInviteLink",
          "invite_link" A..= invite_link_
        ]
