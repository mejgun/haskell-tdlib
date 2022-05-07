{-# LANGUAGE OverloadedStrings #-}

module TD.Query.JoinChatByInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Uses an invite link to add the current user to the chat if possible @invite_link Invite link to use
data JoinChatByInviteLink = JoinChatByInviteLink
  { -- |
    invite_link :: Maybe String
  }
  deriving (Eq)

instance Show JoinChatByInviteLink where
  show
    JoinChatByInviteLink
      { invite_link = invite_link
      } =
      "JoinChatByInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link
          ]

instance T.ToJSON JoinChatByInviteLink where
  toJSON
    JoinChatByInviteLink
      { invite_link = invite_link
      } =
      A.object
        [ "@type" A..= T.String "joinChatByInviteLink",
          "invite_link" A..= invite_link
        ]
