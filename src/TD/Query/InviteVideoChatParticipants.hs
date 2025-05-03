module TD.Query.InviteVideoChatParticipants
  (InviteVideoChatParticipants(..)
  , defaultInviteVideoChatParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Invites users to an active video chat. Sends a service message of the type messageInviteVideoChatParticipants to the chat bound to the group call. Returns 'TD.Data.Ok.Ok'
data InviteVideoChatParticipants
  = InviteVideoChatParticipants
    { group_call_id :: Maybe Int   -- ^ Group call identifier
    , user_ids      :: Maybe [Int] -- ^ User identifiers. At most 10 users can be invited simultaneously
    }
  deriving (Eq, Show)

instance I.ShortShow InviteVideoChatParticipants where
  shortShow
    InviteVideoChatParticipants
      { group_call_id = group_call_id_
      , user_ids      = user_ids_
      }
        = "InviteVideoChatParticipants"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "user_ids"      `I.p` user_ids_
          ]

instance AT.ToJSON InviteVideoChatParticipants where
  toJSON
    InviteVideoChatParticipants
      { group_call_id = group_call_id_
      , user_ids      = user_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "inviteVideoChatParticipants"
          , "group_call_id" A..= group_call_id_
          , "user_ids"      A..= user_ids_
          ]

defaultInviteVideoChatParticipants :: InviteVideoChatParticipants
defaultInviteVideoChatParticipants =
  InviteVideoChatParticipants
    { group_call_id = Nothing
    , user_ids      = Nothing
    }

