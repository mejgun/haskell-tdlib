{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatInviteLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.InviteLinkChatType as InviteLinkChatType
import qualified Utils as U

-- |
data ChatInviteLinkInfo = -- | Contains information about a chat invite link
  ChatInviteLinkInfo
  { -- | True, if many users reported this chat as a fake account
    is_fake :: Maybe Bool,
    -- | True, if many users reported this chat as a scam
    is_scam :: Maybe Bool,
    -- | True, if the chat is verified
    is_verified :: Maybe Bool,
    -- | True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
    is_public :: Maybe Bool,
    -- | True, if the link only creates join request
    creates_join_request :: Maybe Bool,
    -- | User identifiers of some chat members that may be known to the current user
    member_user_ids :: Maybe [Int],
    -- | Number of members in the chat
    member_count :: Maybe Int,
    -- |
    description :: Maybe String,
    -- | Chat photo; may be null
    photo :: Maybe ChatPhotoInfo.ChatPhotoInfo,
    -- | Title of the chat
    title :: Maybe String,
    -- | Type of the chat
    _type :: Maybe InviteLinkChatType.InviteLinkChatType,
    -- | If non-zero, the amount of time for which read access to the chat will remain available, in seconds
    accessible_for :: Maybe Int,
    -- | Chat identifier of the invite link; 0 if the user has no access to the chat before joining
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinkInfo where
  show
    ChatInviteLinkInfo
      { is_fake = is_fake_,
        is_scam = is_scam_,
        is_verified = is_verified_,
        is_public = is_public_,
        creates_join_request = creates_join_request_,
        member_user_ids = member_user_ids_,
        member_count = member_count_,
        description = description_,
        photo = photo_,
        title = title_,
        _type = _type_,
        accessible_for = accessible_for_,
        chat_id = chat_id_
      } =
      "ChatInviteLinkInfo"
        ++ U.cc
          [ U.p "is_fake" is_fake_,
            U.p "is_scam" is_scam_,
            U.p "is_verified" is_verified_,
            U.p "is_public" is_public_,
            U.p "creates_join_request" creates_join_request_,
            U.p "member_user_ids" member_user_ids_,
            U.p "member_count" member_count_,
            U.p "description" description_,
            U.p "photo" photo_,
            U.p "title" title_,
            U.p "_type" _type_,
            U.p "accessible_for" accessible_for_,
            U.p "chat_id" chat_id_
          ]

instance T.FromJSON ChatInviteLinkInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinkInfo" -> parseChatInviteLinkInfo v
      _ -> mempty
    where
      parseChatInviteLinkInfo :: A.Value -> T.Parser ChatInviteLinkInfo
      parseChatInviteLinkInfo = A.withObject "ChatInviteLinkInfo" $ \o -> do
        is_fake_ <- o A..:? "is_fake"
        is_scam_ <- o A..:? "is_scam"
        is_verified_ <- o A..:? "is_verified"
        is_public_ <- o A..:? "is_public"
        creates_join_request_ <- o A..:? "creates_join_request"
        member_user_ids_ <- o A..:? "member_user_ids"
        member_count_ <- o A..:? "member_count"
        description_ <- o A..:? "description"
        photo_ <- o A..:? "photo"
        title_ <- o A..:? "title"
        _type_ <- o A..:? "type"
        accessible_for_ <- o A..:? "accessible_for"
        chat_id_ <- o A..:? "chat_id"
        return $ ChatInviteLinkInfo {is_fake = is_fake_, is_scam = is_scam_, is_verified = is_verified_, is_public = is_public_, creates_join_request = creates_join_request_, member_user_ids = member_user_ids_, member_count = member_count_, description = description_, photo = photo_, title = title_, _type = _type_, accessible_for = accessible_for_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkInfo where
  toJSON
    ChatInviteLinkInfo
      { is_fake = is_fake_,
        is_scam = is_scam_,
        is_verified = is_verified_,
        is_public = is_public_,
        creates_join_request = creates_join_request_,
        member_user_ids = member_user_ids_,
        member_count = member_count_,
        description = description_,
        photo = photo_,
        title = title_,
        _type = _type_,
        accessible_for = accessible_for_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkInfo",
          "is_fake" A..= is_fake_,
          "is_scam" A..= is_scam_,
          "is_verified" A..= is_verified_,
          "is_public" A..= is_public_,
          "creates_join_request" A..= creates_join_request_,
          "member_user_ids" A..= member_user_ids_,
          "member_count" A..= member_count_,
          "description" A..= description_,
          "photo" A..= photo_,
          "title" A..= title_,
          "type" A..= _type_,
          "accessible_for" A..= accessible_for_,
          "chat_id" A..= chat_id_
        ]
