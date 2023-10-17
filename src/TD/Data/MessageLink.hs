module TD.Data.MessageLink
  (MessageLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data MessageLink
  = MessageLink -- ^ Contains an HTTPS link to a message in a supergroup or channel, or a forum topic
    { link      :: Maybe T.Text -- ^ The link
    , is_public :: Maybe Bool   -- ^ True, if the link will work for non-members of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow MessageLink where
  shortShow MessageLink
    { link      = link_
    , is_public = is_public_
    }
      = "MessageLink"
        ++ I.cc
        [ "link"      `I.p` link_
        , "is_public" `I.p` is_public_
        ]

instance AT.FromJSON MessageLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageLink" -> parseMessageLink v
      _             -> mempty
    
    where
      parseMessageLink :: A.Value -> AT.Parser MessageLink
      parseMessageLink = A.withObject "MessageLink" $ \o -> do
        link_      <- o A..:?  "link"
        is_public_ <- o A..:?  "is_public"
        pure $ MessageLink
          { link      = link_
          , is_public = is_public_
          }
  parseJSON _ = mempty

