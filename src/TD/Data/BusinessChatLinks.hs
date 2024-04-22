module TD.Data.BusinessChatLinks
  (BusinessChatLinks(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessChatLink as BusinessChatLink

data BusinessChatLinks
  = BusinessChatLinks -- ^ Contains a list of business chat links created by the user
    { links :: Maybe [BusinessChatLink.BusinessChatLink] -- ^ List of links
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessChatLinks where
  shortShow BusinessChatLinks
    { links = links_
    }
      = "BusinessChatLinks"
        ++ I.cc
        [ "links" `I.p` links_
        ]

instance AT.FromJSON BusinessChatLinks where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessChatLinks" -> parseBusinessChatLinks v
      _                   -> mempty
    
    where
      parseBusinessChatLinks :: A.Value -> AT.Parser BusinessChatLinks
      parseBusinessChatLinks = A.withObject "BusinessChatLinks" $ \o -> do
        links_ <- o A..:?  "links"
        pure $ BusinessChatLinks
          { links = links_
          }
  parseJSON _ = mempty

