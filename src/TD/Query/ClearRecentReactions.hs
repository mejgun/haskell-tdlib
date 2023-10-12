module TD.Query.ClearRecentReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ClearRecentReactions -- ^ Clears the list of recently used reactions
  = ClearRecentReactions
  deriving (Eq)

instance Show ClearRecentReactions where
  show
    ClearRecentReactions
        = "ClearRecentReactions"

instance AT.ToJSON ClearRecentReactions where
  toJSON
    ClearRecentReactions
        = A.object
          [ "@type" A..= AT.String "clearRecentReactions"
          ]
