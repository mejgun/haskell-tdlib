module TD.Data.ChatBoostLink
  (ChatBoostLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatBoostLink
  = ChatBoostLink -- ^ Contains an HTTPS link to boost a chat
    { link      :: Maybe T.Text -- ^ The link
    , is_public :: Maybe Bool   -- ^ True, if the link will work for non-members of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostLink where
  shortShow ChatBoostLink
    { link      = link_
    , is_public = is_public_
    }
      = "ChatBoostLink"
        ++ I.cc
        [ "link"      `I.p` link_
        , "is_public" `I.p` is_public_
        ]

instance AT.FromJSON ChatBoostLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostLink" -> parseChatBoostLink v
      _               -> mempty
    
    where
      parseChatBoostLink :: A.Value -> AT.Parser ChatBoostLink
      parseChatBoostLink = A.withObject "ChatBoostLink" $ \o -> do
        link_      <- o A..:?  "link"
        is_public_ <- o A..:?  "is_public"
        pure $ ChatBoostLink
          { link      = link_
          , is_public = is_public_
          }
  parseJSON _ = mempty

