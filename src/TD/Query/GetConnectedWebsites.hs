module TD.Query.GetConnectedWebsites(GetConnectedWebsites(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetConnectedWebsites -- ^ Returns all website where the current user used Telegram to log in
  = GetConnectedWebsites
  deriving (Eq)

instance Show GetConnectedWebsites where
  show
    GetConnectedWebsites
        = "GetConnectedWebsites"

instance AT.ToJSON GetConnectedWebsites where
  toJSON
    GetConnectedWebsites
        = A.object
          [ "@type" A..= AT.String "getConnectedWebsites"
          ]
