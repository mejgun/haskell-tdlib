module TD.Query.InviteGroupCallParticipants
  (InviteGroupCallParticipants(..)
  , defaultInviteGroupCallParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Invites users to an active group call. Sends a service message of type messageInviteVideoChatParticipants for video chats. Returns 'TD.Data.Ok.Ok'
data InviteGroupCallParticipants
  = InviteGroupCallParticipants
    { group_call_id :: Maybe Int   -- ^ Group call identifier
    , user_ids      :: Maybe [Int] -- ^ User identifiers. At most 10 users can be invited simultaneously
    }
  deriving (Eq, Show)

instance I.ShortShow InviteGroupCallParticipants where
  shortShow
    InviteGroupCallParticipants
      { group_call_id = group_call_id_
      , user_ids      = user_ids_
      }
        = "InviteGroupCallParticipants"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "user_ids"      `I.p` user_ids_
          ]

instance AT.ToJSON InviteGroupCallParticipants where
  toJSON
    InviteGroupCallParticipants
      { group_call_id = group_call_id_
      , user_ids      = user_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "inviteGroupCallParticipants"
          , "group_call_id" A..= group_call_id_
          , "user_ids"      A..= user_ids_
          ]

defaultInviteGroupCallParticipants :: InviteGroupCallParticipants
defaultInviteGroupCallParticipants =
  InviteGroupCallParticipants
    { group_call_id = Nothing
    , user_ids      = Nothing
    }

