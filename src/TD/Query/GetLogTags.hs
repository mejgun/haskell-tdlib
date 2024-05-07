module TD.Query.GetLogTags
  (GetLogTags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously. Returns 'TD.Data.LogTags.LogTags'
data GetLogTags
  = GetLogTags
  deriving (Eq, Show)

instance I.ShortShow GetLogTags where
  shortShow
    GetLogTags
        = "GetLogTags"

instance AT.ToJSON GetLogTags where
  toJSON
    GetLogTags
        = A.object
          [ "@type" A..= AT.String "getLogTags"
          ]

