{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Proxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Proxy as Proxy
import qualified Utils as U

data Proxies = -- | Represents a list of proxy servers @proxies List of proxy servers
  Proxies
  { -- |
    proxies :: Maybe [Proxy.Proxy]
  }
  deriving (Eq)

instance Show Proxies where
  show
    Proxies
      { proxies = proxies
      } =
      "Proxies"
        ++ U.cc
          [ U.p "proxies" proxies
          ]

instance T.FromJSON Proxies where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "proxies" -> parseProxies v
      _ -> fail ""
    where
      parseProxies :: A.Value -> T.Parser Proxies
      parseProxies = A.withObject "Proxies" $ \o -> do
        proxies_ <- o A..:? "proxies"
        return $ Proxies {proxies = proxies_}
  parseJSON _ = fail ""

instance T.ToJSON Proxies where
  toJSON
    Proxies
      { proxies = proxies
      } =
      A.object
        [ "@type" A..= T.String "proxies",
          "proxies" A..= proxies
        ]
