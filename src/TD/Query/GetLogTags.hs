module TD.Query.GetLogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetLogTags -- ^ Returns list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
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
