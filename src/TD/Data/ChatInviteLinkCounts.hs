{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatInviteLinkCounts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLinkCount as ChatInviteLinkCount
import qualified Utils as U

-- |
data ChatInviteLinkCounts = -- | Contains a list of chat invite link counts @invite_link_counts List of invite link counts
  ChatInviteLinkCounts
  { -- |
    invite_link_counts :: Maybe [ChatInviteLinkCount.ChatInviteLinkCount]
  }
  deriving (Eq)

instance Show ChatInviteLinkCounts where
  show
    ChatInviteLinkCounts
      { invite_link_counts = invite_link_counts_
      } =
      "ChatInviteLinkCounts"
        ++ U.cc
          [ U.p "invite_link_counts" invite_link_counts_
          ]

instance T.FromJSON ChatInviteLinkCounts where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinkCounts" -> parseChatInviteLinkCounts v
      _ -> mempty
    where
      parseChatInviteLinkCounts :: A.Value -> T.Parser ChatInviteLinkCounts
      parseChatInviteLinkCounts = A.withObject "ChatInviteLinkCounts" $ \o -> do
        invite_link_counts_ <- o A..:? "invite_link_counts"
        return $ ChatInviteLinkCounts {invite_link_counts = invite_link_counts_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkCounts where
  toJSON
    ChatInviteLinkCounts
      { invite_link_counts = invite_link_counts_
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkCounts",
          "invite_link_counts" A..= invite_link_counts_
        ]
