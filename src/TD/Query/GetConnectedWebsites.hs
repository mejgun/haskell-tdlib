module TD.Query.GetConnectedWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
