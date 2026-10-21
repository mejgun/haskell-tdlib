module TD.Data.UserLink
  (UserLink(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data UserLink
  = UserLink -- ^ Contains an HTTPS URL, which can be used to get information about a user
    { url                    :: Maybe T.Text -- ^ The URL
    , expires_in             :: Maybe Int    -- ^ Left time for which the link is valid, in seconds; 0 if the link is permanent
    , can_get_permanent_link :: Maybe Bool   -- ^ True, if a permanent link to the current user can be received; false if all links to the current user expire
    }
  deriving (Eq, Show)

instance I.ShortShow UserLink where
  shortShow UserLink
    { url                    = url_
    , expires_in             = expires_in_
    , can_get_permanent_link = can_get_permanent_link_
    }
      = "UserLink"
        ++ I.cc
        [ "url"                    `I.p` url_
        , "expires_in"             `I.p` expires_in_
        , "can_get_permanent_link" `I.p` can_get_permanent_link_
        ]

instance AT.FromJSON UserLink where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userLink" -> parseUserLink v
      _          -> mempty
    
    where
      parseUserLink :: A.Value -> AT.Parser UserLink
      parseUserLink = A.withObject "UserLink" $ \o -> do
        url_                    <- o A..:?  "url"
        expires_in_             <- o A..:?  "expires_in"
        can_get_permanent_link_ <- o A..:?  "can_get_permanent_link"
        pure $ UserLink
          { url                    = url_
          , expires_in             = expires_in_
          , can_get_permanent_link = can_get_permanent_link_
          }
  parseJSON _ = mempty

