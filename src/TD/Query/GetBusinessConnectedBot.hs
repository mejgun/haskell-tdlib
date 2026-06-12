module TD.Query.GetBusinessConnectedBot
  (GetBusinessConnectedBot(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about the business bot that is connected to the current user account. Returns a 404 error if there is no connected bot. Returns 'TD.Data.BusinessConnectedBotInfo.BusinessConnectedBotInfo'
data GetBusinessConnectedBot
  = GetBusinessConnectedBot
  deriving (Eq, Show)

instance I.ShortShow GetBusinessConnectedBot where
  shortShow
    GetBusinessConnectedBot
        = "GetBusinessConnectedBot"

instance AT.ToJSON GetBusinessConnectedBot where
  toJSON
    GetBusinessConnectedBot
        = A.object
          [ "@type" A..= AT.String "getBusinessConnectedBot"
          ]

