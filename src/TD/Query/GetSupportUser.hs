module TD.Query.GetSupportUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetSupportUser -- ^ Returns a user that can be contacted to get support
  = GetSupportUser
  deriving (Eq)

instance Show GetSupportUser where
  show
    GetSupportUser
        = "GetSupportUser"

instance AT.ToJSON GetSupportUser where
  toJSON
    GetSupportUser
        = A.object
          [ "@type" A..= AT.String "getSupportUser"
          ]
