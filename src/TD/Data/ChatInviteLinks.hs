module TD.Data.ChatInviteLinks
  ( ChatInviteLinks(..)    
  , defaultChatInviteLinks 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatInviteLink as ChatInviteLink

data ChatInviteLinks
  = ChatInviteLinks -- ^ Contains a list of chat invite links
    { total_count  :: Maybe Int                             -- ^ Approximate total number of chat invite links found
    , invite_links :: Maybe [ChatInviteLink.ChatInviteLink] -- ^ List of invite links
    }
  deriving (Eq)

instance Show ChatInviteLinks where
  show ChatInviteLinks
    { total_count  = total_count_
    , invite_links = invite_links_
    }
      = "ChatInviteLinks"
        ++ I.cc
        [ "total_count"  `I.p` total_count_
        , "invite_links" `I.p` invite_links_
        ]

instance AT.FromJSON ChatInviteLinks where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatInviteLinks" -> parseChatInviteLinks v
      _                 -> mempty
    
    where
      parseChatInviteLinks :: A.Value -> AT.Parser ChatInviteLinks
      parseChatInviteLinks = A.withObject "ChatInviteLinks" $ \o -> do
        total_count_  <- o A..:?  "total_count"
        invite_links_ <- o A..:?  "invite_links"
        pure $ ChatInviteLinks
          { total_count  = total_count_
          , invite_links = invite_links_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatInviteLinks where
  toJSON ChatInviteLinks
    { total_count  = total_count_
    , invite_links = invite_links_
    }
      = A.object
        [ "@type"        A..= AT.String "chatInviteLinks"
        , "total_count"  A..= total_count_
        , "invite_links" A..= invite_links_
        ]

defaultChatInviteLinks :: ChatInviteLinks
defaultChatInviteLinks =
  ChatInviteLinks
    { total_count  = Nothing
    , invite_links = Nothing
    }

