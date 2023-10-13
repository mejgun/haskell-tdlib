module TD.Query.GetLogTags
  (GetLogTags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
data GetLogTags
  = GetLogTags
  deriving (Eq)

instance Show GetLogTags where
  show
    GetLogTags
        = "GetLogTags"

instance AT.ToJSON GetLogTags where
  toJSON
    GetLogTags
        = A.object
          [ "@type" A..= AT.String "getLogTags"
          ]

