module TD.Query.GetSupportName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetSupportName -- ^ Returns localized name of the Telegram support user; for Telegram support only
  = GetSupportName
  deriving (Eq)

instance Show GetSupportName where
  show
    GetSupportName
        = "GetSupportName"

instance AT.ToJSON GetSupportName where
  toJSON
    GetSupportName
        = A.object
          [ "@type" A..= AT.String "getSupportName"
          ]
