module TD.Query.ClearRecentReactions
  (ClearRecentReactions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears the list of recently used reactions. Returns 'TD.Data.Ok.Ok'
data ClearRecentReactions
  = ClearRecentReactions
  deriving (Eq, Show)

instance I.ShortShow ClearRecentReactions where
  shortShow
    ClearRecentReactions
        = "ClearRecentReactions"

instance AT.ToJSON ClearRecentReactions where
  toJSON
    ClearRecentReactions
        = A.object
          [ "@type" A..= AT.String "clearRecentReactions"
          ]

