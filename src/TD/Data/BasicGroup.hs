{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BasicGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMemberStatus as ChatMemberStatus
import qualified Utils as U

-- |
data BasicGroup = -- | Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
  BasicGroup
  { -- | Identifier of the supergroup to which this group was upgraded; 0 if none
    upgraded_to_supergroup_id :: Maybe Int,
    -- | True, if the group is active
    is_active :: Maybe Bool,
    -- | Status of the current user in the group
    status :: Maybe ChatMemberStatus.ChatMemberStatus,
    -- | Number of members in the group
    member_count :: Maybe Int,
    -- | Group identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show BasicGroup where
  show
    BasicGroup
      { upgraded_to_supergroup_id = upgraded_to_supergroup_id_,
        is_active = is_active_,
        status = status_,
        member_count = member_count_,
        _id = _id_
      } =
      "BasicGroup"
        ++ U.cc
          [ U.p "upgraded_to_supergroup_id" upgraded_to_supergroup_id_,
            U.p "is_active" is_active_,
            U.p "status" status_,
            U.p "member_count" member_count_,
            U.p "_id" _id_
          ]

instance T.FromJSON BasicGroup where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "basicGroup" -> parseBasicGroup v
      _ -> mempty
    where
      parseBasicGroup :: A.Value -> T.Parser BasicGroup
      parseBasicGroup = A.withObject "BasicGroup" $ \o -> do
        upgraded_to_supergroup_id_ <- o A..:? "upgraded_to_supergroup_id"
        is_active_ <- o A..:? "is_active"
        status_ <- o A..:? "status"
        member_count_ <- o A..:? "member_count"
        _id_ <- o A..:? "id"
        return $ BasicGroup {upgraded_to_supergroup_id = upgraded_to_supergroup_id_, is_active = is_active_, status = status_, member_count = member_count_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON BasicGroup where
  toJSON
    BasicGroup
      { upgraded_to_supergroup_id = upgraded_to_supergroup_id_,
        is_active = is_active_,
        status = status_,
        member_count = member_count_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "basicGroup",
          "upgraded_to_supergroup_id" A..= upgraded_to_supergroup_id_,
          "is_active" A..= is_active_,
          "status" A..= status_,
          "member_count" A..= member_count_,
          "id" A..= _id_
        ]
