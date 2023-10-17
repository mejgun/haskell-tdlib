module TD.Data.ConnectedWebsites
  (ConnectedWebsites(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ConnectedWebsite as ConnectedWebsite

data ConnectedWebsites
  = ConnectedWebsites -- ^ Contains a list of websites the current user is logged in with Telegram
    { websites :: Maybe [ConnectedWebsite.ConnectedWebsite] -- ^ List of connected websites
    }
  deriving (Eq, Show)

instance I.ShortShow ConnectedWebsites where
  shortShow ConnectedWebsites
    { websites = websites_
    }
      = "ConnectedWebsites"
        ++ I.cc
        [ "websites" `I.p` websites_
        ]

instance AT.FromJSON ConnectedWebsites where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "connectedWebsites" -> parseConnectedWebsites v
      _                   -> mempty
    
    where
      parseConnectedWebsites :: A.Value -> AT.Parser ConnectedWebsites
      parseConnectedWebsites = A.withObject "ConnectedWebsites" $ \o -> do
        websites_ <- o A..:?  "websites"
        pure $ ConnectedWebsites
          { websites = websites_
          }
  parseJSON _ = mempty

