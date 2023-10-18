module TD.Query.RevokeGroupCallInviteLink
  (RevokeGroupCallInviteLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Revokes invite link for a group call. Requires groupCall.can_be_managed group call flag. Returns 'TD.Data.Ok.Ok'
data RevokeGroupCallInviteLink
  = RevokeGroupCallInviteLink
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RevokeGroupCallInviteLink where
  shortShow
    RevokeGroupCallInviteLink
      { group_call_id = group_call_id_
      }
        = "RevokeGroupCallInviteLink"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON RevokeGroupCallInviteLink where
  toJSON
    RevokeGroupCallInviteLink
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "revokeGroupCallInviteLink"
          , "group_call_id" A..= group_call_id_
          ]

