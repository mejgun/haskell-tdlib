module TD.Query.DisconnectAllWebsites
  (DisconnectAllWebsites(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Disconnects all websites from the current user's Telegram account. Returns 'TD.Data.Ok.Ok'
data DisconnectAllWebsites
  = DisconnectAllWebsites
  deriving (Eq, Show)

instance I.ShortShow DisconnectAllWebsites where
  shortShow
    DisconnectAllWebsites
        = "DisconnectAllWebsites"

instance AT.ToJSON DisconnectAllWebsites where
  toJSON
    DisconnectAllWebsites
        = A.object
          [ "@type" A..= AT.String "disconnectAllWebsites"
          ]

