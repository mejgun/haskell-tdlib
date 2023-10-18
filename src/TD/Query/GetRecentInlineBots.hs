module TD.Query.GetRecentInlineBots
  (GetRecentInlineBots(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns up to 20 recently used inline bots in the order of their last usage. Returns 'TD.Data.Users.Users'
data GetRecentInlineBots
  = GetRecentInlineBots
  deriving (Eq, Show)

instance I.ShortShow GetRecentInlineBots where
  shortShow
    GetRecentInlineBots
        = "GetRecentInlineBots"

instance AT.ToJSON GetRecentInlineBots where
  toJSON
    GetRecentInlineBots
        = A.object
          [ "@type" A..= AT.String "getRecentInlineBots"
          ]

