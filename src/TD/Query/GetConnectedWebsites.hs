module TD.Query.GetConnectedWebsites
  (GetConnectedWebsites(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all website where the current user used Telegram to log in. Returns 'TD.Data.ConnectedWebsites.ConnectedWebsites'
data GetConnectedWebsites
  = GetConnectedWebsites
  deriving (Eq, Show)

instance I.ShortShow GetConnectedWebsites where
  shortShow
    GetConnectedWebsites
        = "GetConnectedWebsites"

instance AT.ToJSON GetConnectedWebsites where
  toJSON
    GetConnectedWebsites
        = A.object
          [ "@type" A..= AT.String "getConnectedWebsites"
          ]

