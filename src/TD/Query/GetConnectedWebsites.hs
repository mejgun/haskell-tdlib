module TD.Query.GetConnectedWebsites
  (GetConnectedWebsites(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns all website where the current user used Telegram to log in
data GetConnectedWebsites
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

