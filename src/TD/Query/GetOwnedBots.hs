module TD.Query.GetOwnedBots
  (GetOwnedBots(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of bots owned by the current user. Returns 'TD.Data.Users.Users'
data GetOwnedBots
  = GetOwnedBots
  deriving (Eq, Show)

instance I.ShortShow GetOwnedBots where
  shortShow
    GetOwnedBots
        = "GetOwnedBots"

instance AT.ToJSON GetOwnedBots where
  toJSON
    GetOwnedBots
        = A.object
          [ "@type" A..= AT.String "getOwnedBots"
          ]

