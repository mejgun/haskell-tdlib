module TD.Query.DisconnectAllWebsites
  (DisconnectAllWebsites(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Disconnects all websites from the current user's Telegram account
data DisconnectAllWebsites
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

