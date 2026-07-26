module TD.Data.Community
  (Community(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.CommunityMemberStatus as CommunityMemberStatus
import qualified TD.Data.CommunityPermissions as CommunityPermissions

data Community
  = Community -- ^ Represents a community consisting of supergroup chats, channel chats and chats with bots
    { _id         :: Maybe Int                                         -- ^ Community identifier
    , have_access :: Maybe Bool                                        -- ^ If false, the community is inaccessible, and the only information known about the community is inside this class. Identifier of the community can't be passed to any method
    , name        :: Maybe T.Text                                      -- ^ Community name
    , photo       :: Maybe ChatPhotoInfo.ChatPhotoInfo                 -- ^ Community photo; may be null
    , date        :: Maybe Int                                         -- ^ Point in time (Unix timestamp) when the community was joined, or the point in time when the community was created, in case the user is not a member of any chat in the community
    , status      :: Maybe CommunityMemberStatus.CommunityMemberStatus -- ^ Status of the current user in the community
    , permissions :: Maybe CommunityPermissions.CommunityPermissions   -- ^ Actions that non-administrator community members are allowed to take in the community
    }
  deriving (Eq, Show)

instance I.ShortShow Community where
  shortShow Community
    { _id         = _id_
    , have_access = have_access_
    , name        = name_
    , photo       = photo_
    , date        = date_
    , status      = status_
    , permissions = permissions_
    }
      = "Community"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "have_access" `I.p` have_access_
        , "name"        `I.p` name_
        , "photo"       `I.p` photo_
        , "date"        `I.p` date_
        , "status"      `I.p` status_
        , "permissions" `I.p` permissions_
        ]

instance AT.FromJSON Community where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "community" -> parseCommunity v
      _           -> mempty
    
    where
      parseCommunity :: A.Value -> AT.Parser Community
      parseCommunity = A.withObject "Community" $ \o -> do
        _id_         <- o A..:?  "id"
        have_access_ <- o A..:?  "have_access"
        name_        <- o A..:?  "name"
        photo_       <- o A..:?  "photo"
        date_        <- o A..:?  "date"
        status_      <- o A..:?  "status"
        permissions_ <- o A..:?  "permissions"
        pure $ Community
          { _id         = _id_
          , have_access = have_access_
          , name        = name_
          , photo       = photo_
          , date        = date_
          , status      = status_
          , permissions = permissions_
          }
  parseJSON _ = mempty

