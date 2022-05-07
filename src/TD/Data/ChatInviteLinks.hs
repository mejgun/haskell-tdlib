{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLink as ChatInviteLink
import qualified Utils as U

data ChatInviteLinks = -- | Contains a list of chat invite links @total_count Approximate total number of chat invite links found @invite_links List of invite links
  ChatInviteLinks
  { -- |
    invite_links :: Maybe [ChatInviteLink.ChatInviteLink],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinks where
  show
    ChatInviteLinks
      { invite_links = invite_links,
        total_count = total_count
      } =
      "ChatInviteLinks"
        ++ U.cc
          [ U.p "invite_links" invite_links,
            U.p "total_count" total_count
          ]

instance T.FromJSON ChatInviteLinks where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinks" -> parseChatInviteLinks v
      _ -> mempty
    where
      parseChatInviteLinks :: A.Value -> T.Parser ChatInviteLinks
      parseChatInviteLinks = A.withObject "ChatInviteLinks" $ \o -> do
        invite_links_ <- o A..:? "invite_links"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatInviteLinks {invite_links = invite_links_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinks where
  toJSON
    ChatInviteLinks
      { invite_links = invite_links,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinks",
          "invite_links" A..= invite_links,
          "total_count" A..= total_count
        ]
