{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatInviteLinkCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data ChatInviteLinkCount = -- | Describes a chat administrator with a number of active and revoked chat invite links
  ChatInviteLinkCount
  { -- | Number of revoked invite links
    revoked_invite_link_count :: Maybe Int,
    -- | Number of active invite links
    invite_link_count :: Maybe Int,
    -- | Administrator's user identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinkCount where
  show
    ChatInviteLinkCount
      { revoked_invite_link_count = revoked_invite_link_count,
        invite_link_count = invite_link_count,
        user_id = user_id
      } =
      "ChatInviteLinkCount"
        ++ U.cc
          [ U.p "revoked_invite_link_count" revoked_invite_link_count,
            U.p "invite_link_count" invite_link_count,
            U.p "user_id" user_id
          ]

instance T.FromJSON ChatInviteLinkCount where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinkCount" -> parseChatInviteLinkCount v
      _ -> mempty
    where
      parseChatInviteLinkCount :: A.Value -> T.Parser ChatInviteLinkCount
      parseChatInviteLinkCount = A.withObject "ChatInviteLinkCount" $ \o -> do
        revoked_invite_link_count_ <- mconcat [o A..:? "revoked_invite_link_count", U.rm <$> (o A..: "revoked_invite_link_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        invite_link_count_ <- mconcat [o A..:? "invite_link_count", U.rm <$> (o A..: "invite_link_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatInviteLinkCount {revoked_invite_link_count = revoked_invite_link_count_, invite_link_count = invite_link_count_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkCount where
  toJSON
    ChatInviteLinkCount
      { revoked_invite_link_count = revoked_invite_link_count,
        invite_link_count = invite_link_count,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkCount",
          "revoked_invite_link_count" A..= revoked_invite_link_count,
          "invite_link_count" A..= invite_link_count,
          "user_id" A..= user_id
        ]
