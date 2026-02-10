module TD.Data.AddedProxies
  (AddedProxies(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AddedProxy as AddedProxy

data AddedProxies
  = AddedProxies -- ^ Represents a list of added proxy servers
    { proxies :: Maybe [AddedProxy.AddedProxy] -- ^ List of proxy servers
    }
  deriving (Eq, Show)

instance I.ShortShow AddedProxies where
  shortShow AddedProxies
    { proxies = proxies_
    }
      = "AddedProxies"
        ++ I.cc
        [ "proxies" `I.p` proxies_
        ]

instance AT.FromJSON AddedProxies where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "addedProxies" -> parseAddedProxies v
      _              -> mempty
    
    where
      parseAddedProxies :: A.Value -> AT.Parser AddedProxies
      parseAddedProxies = A.withObject "AddedProxies" $ \o -> do
        proxies_ <- o A..:?  "proxies"
        pure $ AddedProxies
          { proxies = proxies_
          }
  parseJSON _ = mempty

