module TD.Query.SetVideoChatDefaultParticipant
  (SetVideoChatDefaultParticipant(..)
  , defaultSetVideoChatDefaultParticipant
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Changes default participant identifier, on whose behalf a video chat in the chat will be joined. Returns 'TD.Data.Ok.Ok'
data SetVideoChatDefaultParticipant
  = SetVideoChatDefaultParticipant
    { chat_id                :: Maybe Int                         -- ^ Chat identifier
    , default_participant_id :: Maybe MessageSender.MessageSender -- ^ Default group call participant identifier to join the video chats
    }
  deriving (Eq, Show)

instance I.ShortShow SetVideoChatDefaultParticipant where
  shortShow
    SetVideoChatDefaultParticipant
      { chat_id                = chat_id_
      , default_participant_id = default_participant_id_
      }
        = "SetVideoChatDefaultParticipant"
          ++ I.cc
          [ "chat_id"                `I.p` chat_id_
          , "default_participant_id" `I.p` default_participant_id_
          ]

instance AT.ToJSON SetVideoChatDefaultParticipant where
  toJSON
    SetVideoChatDefaultParticipant
      { chat_id                = chat_id_
      , default_participant_id = default_participant_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "setVideoChatDefaultParticipant"
          , "chat_id"                A..= chat_id_
          , "default_participant_id" A..= default_participant_id_
          ]

defaultSetVideoChatDefaultParticipant :: SetVideoChatDefaultParticipant
defaultSetVideoChatDefaultParticipant =
  SetVideoChatDefaultParticipant
    { chat_id                = Nothing
    , default_participant_id = Nothing
    }

