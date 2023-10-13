module TD.Query.GetRecentInlineBots(GetRecentInlineBots(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetRecentInlineBots -- ^ Returns up to 20 recently used inline bots in the order of their last usage
  = GetRecentInlineBots
  deriving (Eq)

instance Show GetRecentInlineBots where
  show
    GetRecentInlineBots
        = "GetRecentInlineBots"

instance AT.ToJSON GetRecentInlineBots where
  toJSON
    GetRecentInlineBots
        = A.object
          [ "@type" A..= AT.String "getRecentInlineBots"
          ]
