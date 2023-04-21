{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFolderInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolderInviteLink as ChatFolderInviteLink
import qualified Utils as U

-- |
data ChatFolderInviteLinks = -- | Represents a list of chat folder invite links @invite_links List of the invite links
  ChatFolderInviteLinks
  { -- |
    invite_links :: Maybe [ChatFolderInviteLink.ChatFolderInviteLink]
  }
  deriving (Eq)

instance Show ChatFolderInviteLinks where
  show
    ChatFolderInviteLinks
      { invite_links = invite_links_
      } =
      "ChatFolderInviteLinks"
        ++ U.cc
          [ U.p "invite_links" invite_links_
          ]

instance T.FromJSON ChatFolderInviteLinks where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFolderInviteLinks" -> parseChatFolderInviteLinks v
      _ -> mempty
    where
      parseChatFolderInviteLinks :: A.Value -> T.Parser ChatFolderInviteLinks
      parseChatFolderInviteLinks = A.withObject "ChatFolderInviteLinks" $ \o -> do
        invite_links_ <- o A..:? "invite_links"
        return $ ChatFolderInviteLinks {invite_links = invite_links_}
  parseJSON _ = mempty

instance T.ToJSON ChatFolderInviteLinks where
  toJSON
    ChatFolderInviteLinks
      { invite_links = invite_links_
      } =
      A.object
        [ "@type" A..= T.String "chatFolderInviteLinks",
          "invite_links" A..= invite_links_
        ]
