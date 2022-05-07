{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatInviteLinkMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLinkMember as ChatInviteLinkMember
import qualified Utils as U

data ChatInviteLinkMembers = -- | Contains a list of chat members joined a chat via an invite link @total_count Approximate total number of chat members found @members List of chat members, joined a chat via an invite link
  ChatInviteLinkMembers
  { -- |
    members :: Maybe [ChatInviteLinkMember.ChatInviteLinkMember],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinkMembers where
  show
    ChatInviteLinkMembers
      { members = members,
        total_count = total_count
      } =
      "ChatInviteLinkMembers"
        ++ U.cc
          [ U.p "members" members,
            U.p "total_count" total_count
          ]

instance T.FromJSON ChatInviteLinkMembers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinkMembers" -> parseChatInviteLinkMembers v
      _ -> mempty
    where
      parseChatInviteLinkMembers :: A.Value -> T.Parser ChatInviteLinkMembers
      parseChatInviteLinkMembers = A.withObject "ChatInviteLinkMembers" $ \o -> do
        members_ <- o A..:? "members"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatInviteLinkMembers {members = members_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkMembers where
  toJSON
    ChatInviteLinkMembers
      { members = members,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkMembers",
          "members" A..= members,
          "total_count" A..= total_count
        ]
