{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ProcessChatJoinRequests where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Handles all pending join requests for a given link in a chat
data ProcessChatJoinRequests = ProcessChatJoinRequests
  { -- | Pass true to approve all requests; pass false to decline them
    approve :: Maybe Bool,
    -- | Invite link for which to process join requests. If empty, all join requests will be processed. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
    invite_link :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ProcessChatJoinRequests where
  show
    ProcessChatJoinRequests
      { approve = approve_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      "ProcessChatJoinRequests"
        ++ U.cc
          [ U.p "approve" approve_,
            U.p "invite_link" invite_link_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ProcessChatJoinRequests where
  toJSON
    ProcessChatJoinRequests
      { approve = approve_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "processChatJoinRequests",
          "approve" A..= approve_,
          "invite_link" A..= invite_link_,
          "chat_id" A..= chat_id_
        ]
