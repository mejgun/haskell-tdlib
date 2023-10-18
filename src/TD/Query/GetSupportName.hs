module TD.Query.GetSupportName
  (GetSupportName(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns localized name of the Telegram support user; for Telegram support only. Returns 'TD.Data.Text.Text'
data GetSupportName
  = GetSupportName
  deriving (Eq, Show)

instance I.ShortShow GetSupportName where
  shortShow
    GetSupportName
        = "GetSupportName"

instance AT.ToJSON GetSupportName where
  toJSON
    GetSupportName
        = A.object
          [ "@type" A..= AT.String "getSupportName"
          ]

