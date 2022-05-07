{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetVideoChatDefaultParticipant where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Changes default participant identifier, on whose behalf a video chat in the chat will be joined @chat_id Chat identifier @default_participant_id Default group call participant identifier to join the video chats
data SetVideoChatDefaultParticipant = SetVideoChatDefaultParticipant
  { -- |
    default_participant_id :: Maybe MessageSender.MessageSender,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetVideoChatDefaultParticipant where
  show
    SetVideoChatDefaultParticipant
      { default_participant_id = default_participant_id,
        chat_id = chat_id
      } =
      "SetVideoChatDefaultParticipant"
        ++ U.cc
          [ U.p "default_participant_id" default_participant_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetVideoChatDefaultParticipant where
  toJSON
    SetVideoChatDefaultParticipant
      { default_participant_id = default_participant_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setVideoChatDefaultParticipant",
          "default_participant_id" A..= default_participant_id,
          "chat_id" A..= chat_id
        ]
