module TD.Query.GetMe where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetMe -- ^ Returns the current user
  = GetMe
  deriving (Eq)

instance Show GetMe where
  show
    GetMe
        = "GetMe"

instance AT.ToJSON GetMe where
  toJSON
    GetMe
        = A.object
          [ "@type" A..= AT.String "getMe"
          ]
