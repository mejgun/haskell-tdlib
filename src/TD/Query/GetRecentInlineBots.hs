module TD.Query.GetRecentInlineBots where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
