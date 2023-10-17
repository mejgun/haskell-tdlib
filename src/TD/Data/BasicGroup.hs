module TD.Data.BasicGroup
  (BasicGroup(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus

data BasicGroup
  = BasicGroup -- ^ Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
    { _id                       :: Maybe Int                               -- ^ Group identifier
    , member_count              :: Maybe Int                               -- ^ Number of members in the group
    , status                    :: Maybe ChatMemberStatus.ChatMemberStatus -- ^ Status of the current user in the group
    , is_active                 :: Maybe Bool                              -- ^ True, if the group is active
    , upgraded_to_supergroup_id :: Maybe Int                               -- ^ Identifier of the supergroup to which this group was upgraded; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow BasicGroup where
  shortShow BasicGroup
    { _id                       = _id_
    , member_count              = member_count_
    , status                    = status_
    , is_active                 = is_active_
    , upgraded_to_supergroup_id = upgraded_to_supergroup_id_
    }
      = "BasicGroup"
        ++ I.cc
        [ "_id"                       `I.p` _id_
        , "member_count"              `I.p` member_count_
        , "status"                    `I.p` status_
        , "is_active"                 `I.p` is_active_
        , "upgraded_to_supergroup_id" `I.p` upgraded_to_supergroup_id_
        ]

instance AT.FromJSON BasicGroup where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "basicGroup" -> parseBasicGroup v
      _            -> mempty
    
    where
      parseBasicGroup :: A.Value -> AT.Parser BasicGroup
      parseBasicGroup = A.withObject "BasicGroup" $ \o -> do
        _id_                       <- o A..:?  "id"
        member_count_              <- o A..:?  "member_count"
        status_                    <- o A..:?  "status"
        is_active_                 <- o A..:?  "is_active"
        upgraded_to_supergroup_id_ <- o A..:?  "upgraded_to_supergroup_id"
        pure $ BasicGroup
          { _id                       = _id_
          , member_count              = member_count_
          , status                    = status_
          , is_active                 = is_active_
          , upgraded_to_supergroup_id = upgraded_to_supergroup_id_
          }
  parseJSON _ = mempty

