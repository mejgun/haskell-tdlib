{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatFolderInviteLink = -- | Contains a chat folder invite link
  ChatFolderInviteLink
  { -- | Identifiers of chats, included in the link
    chat_ids :: Maybe [Int],
    -- | Name of the link
    name :: Maybe String,
    -- | The chat folder invite link
    invite_link :: Maybe String
  }
  deriving (Eq)

instance Show ChatFolderInviteLink where
  show
    ChatFolderInviteLink
      { chat_ids = chat_ids_,
        name = name_,
        invite_link = invite_link_
      } =
      "ChatFolderInviteLink"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_,
            U.p "name" name_,
            U.p "invite_link" invite_link_
          ]

instance T.FromJSON ChatFolderInviteLink where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFolderInviteLink" -> parseChatFolderInviteLink v
      _ -> mempty
    where
      parseChatFolderInviteLink :: A.Value -> T.Parser ChatFolderInviteLink
      parseChatFolderInviteLink = A.withObject "ChatFolderInviteLink" $ \o -> do
        chat_ids_ <- o A..:? "chat_ids"
        name_ <- o A..:? "name"
        invite_link_ <- o A..:? "invite_link"
        return $ ChatFolderInviteLink {chat_ids = chat_ids_, name = name_, invite_link = invite_link_}
  parseJSON _ = mempty

instance T.ToJSON ChatFolderInviteLink where
  toJSON
    ChatFolderInviteLink
      { chat_ids = chat_ids_,
        name = name_,
        invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "chatFolderInviteLink",
          "chat_ids" A..= chat_ids_,
          "name" A..= name_,
          "invite_link" A..= invite_link_
        ]
