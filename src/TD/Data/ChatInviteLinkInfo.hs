{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatInviteLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatType as ChatType
import qualified Utils as U

data ChatInviteLinkInfo = -- | Contains information about a chat invite link
  ChatInviteLinkInfo
  { -- | True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
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
    _type :: Maybe ChatType.ChatType,
    -- | If non-zero, the amount of time for which read access to the chat will remain available, in seconds
    accessible_for :: Maybe Int,
    -- | Chat identifier of the invite link; 0 if the user has no access to the chat before joining
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinkInfo where
  show
    ChatInviteLinkInfo
      { is_public = is_public,
        creates_join_request = creates_join_request,
        member_user_ids = member_user_ids,
        member_count = member_count,
        description = description,
        photo = photo,
        title = title,
        _type = _type,
        accessible_for = accessible_for,
        chat_id = chat_id
      } =
      "ChatInviteLinkInfo"
        ++ U.cc
          [ U.p "is_public" is_public,
            U.p "creates_join_request" creates_join_request,
            U.p "member_user_ids" member_user_ids,
            U.p "member_count" member_count,
            U.p "description" description,
            U.p "photo" photo,
            U.p "title" title,
            U.p "_type" _type,
            U.p "accessible_for" accessible_for,
            U.p "chat_id" chat_id
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
        is_public_ <- o A..:? "is_public"
        creates_join_request_ <- o A..:? "creates_join_request"
        member_user_ids_ <- o A..:? "member_user_ids"
        member_count_ <- mconcat [o A..:? "member_count", U.rm <$> (o A..: "member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        description_ <- o A..:? "description"
        photo_ <- o A..:? "photo"
        title_ <- o A..:? "title"
        _type_ <- o A..:? "type"
        accessible_for_ <- mconcat [o A..:? "accessible_for", U.rm <$> (o A..: "accessible_for" :: T.Parser String)] :: T.Parser (Maybe Int)
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatInviteLinkInfo {is_public = is_public_, creates_join_request = creates_join_request_, member_user_ids = member_user_ids_, member_count = member_count_, description = description_, photo = photo_, title = title_, _type = _type_, accessible_for = accessible_for_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkInfo where
  toJSON
    ChatInviteLinkInfo
      { is_public = is_public,
        creates_join_request = creates_join_request,
        member_user_ids = member_user_ids,
        member_count = member_count,
        description = description,
        photo = photo,
        title = title,
        _type = _type,
        accessible_for = accessible_for,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkInfo",
          "is_public" A..= is_public,
          "creates_join_request" A..= creates_join_request,
          "member_user_ids" A..= member_user_ids,
          "member_count" A..= member_count,
          "description" A..= description,
          "photo" A..= photo,
          "title" A..= title,
          "type" A..= _type,
          "accessible_for" A..= accessible_for,
          "chat_id" A..= chat_id
        ]
