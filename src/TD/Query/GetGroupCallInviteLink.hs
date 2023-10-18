module TD.Query.GetGroupCallInviteLink
  (GetGroupCallInviteLink(..)
  , defaultGetGroupCallInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns invite link to a video chat in a public chat. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetGroupCallInviteLink
  = GetGroupCallInviteLink
    { group_call_id   :: Maybe Int  -- ^ Group call identifier
    , can_self_unmute :: Maybe Bool -- ^ Pass true if the invite link needs to contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themselves. Requires groupCall.can_be_managed group call flag
    }
  deriving (Eq, Show)

instance I.ShortShow GetGroupCallInviteLink where
  shortShow
    GetGroupCallInviteLink
      { group_call_id   = group_call_id_
      , can_self_unmute = can_self_unmute_
      }
        = "GetGroupCallInviteLink"
          ++ I.cc
          [ "group_call_id"   `I.p` group_call_id_
          , "can_self_unmute" `I.p` can_self_unmute_
          ]

instance AT.ToJSON GetGroupCallInviteLink where
  toJSON
    GetGroupCallInviteLink
      { group_call_id   = group_call_id_
      , can_self_unmute = can_self_unmute_
      }
        = A.object
          [ "@type"           A..= AT.String "getGroupCallInviteLink"
          , "group_call_id"   A..= group_call_id_
          , "can_self_unmute" A..= can_self_unmute_
          ]

defaultGetGroupCallInviteLink :: GetGroupCallInviteLink
defaultGetGroupCallInviteLink =
  GetGroupCallInviteLink
    { group_call_id   = Nothing
    , can_self_unmute = Nothing
    }

