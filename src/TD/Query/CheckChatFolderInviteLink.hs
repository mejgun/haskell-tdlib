{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder @invite_link Invite link to be checked
data CheckChatFolderInviteLink = CheckChatFolderInviteLink
  { -- |
    invite_link :: Maybe String
  }
  deriving (Eq)

instance Show CheckChatFolderInviteLink where
  show
    CheckChatFolderInviteLink
      { invite_link = invite_link_
      } =
      "CheckChatFolderInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link_
          ]

instance T.ToJSON CheckChatFolderInviteLink where
  toJSON
    CheckChatFolderInviteLink
      { invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "checkChatFolderInviteLink",
          "invite_link" A..= invite_link_
        ]
