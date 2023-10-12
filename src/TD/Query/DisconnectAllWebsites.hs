module TD.Query.DisconnectAllWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DisconnectAllWebsites -- ^ Disconnects all websites from the current user's Telegram account
  = DisconnectAllWebsites
  deriving (Eq)

instance Show DisconnectAllWebsites where
  show
    DisconnectAllWebsites
        = "DisconnectAllWebsites"

instance AT.ToJSON DisconnectAllWebsites where
  toJSON
    DisconnectAllWebsites
        = A.object
          [ "@type" A..= AT.String "disconnectAllWebsites"
          ]
