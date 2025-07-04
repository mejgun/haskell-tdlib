module TD.Query.GetVideoChatInviteLink
  (GetVideoChatInviteLink(..)
  , defaultGetVideoChatInviteLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns invite link to a video chat in a public chat. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetVideoChatInviteLink
  = GetVideoChatInviteLink
    { group_call_id   :: Maybe Int  -- ^ Group call identifier
    , can_self_unmute :: Maybe Bool -- ^ Pass true if the invite link needs to contain an invite hash, passing which to joinVideoChat would allow the invited user to unmute themselves. Requires groupCall.can_be_managed right
    }
  deriving (Eq, Show)

instance I.ShortShow GetVideoChatInviteLink where
  shortShow
    GetVideoChatInviteLink
      { group_call_id   = group_call_id_
      , can_self_unmute = can_self_unmute_
      }
        = "GetVideoChatInviteLink"
          ++ I.cc
          [ "group_call_id"   `I.p` group_call_id_
          , "can_self_unmute" `I.p` can_self_unmute_
          ]

instance AT.ToJSON GetVideoChatInviteLink where
  toJSON
    GetVideoChatInviteLink
      { group_call_id   = group_call_id_
      , can_self_unmute = can_self_unmute_
      }
        = A.object
          [ "@type"           A..= AT.String "getVideoChatInviteLink"
          , "group_call_id"   A..= group_call_id_
          , "can_self_unmute" A..= can_self_unmute_
          ]

defaultGetVideoChatInviteLink :: GetVideoChatInviteLink
defaultGetVideoChatInviteLink =
  GetVideoChatInviteLink
    { group_call_id   = Nothing
    , can_self_unmute = Nothing
    }

