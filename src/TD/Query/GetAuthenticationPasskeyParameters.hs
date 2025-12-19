module TD.Query.GetAuthenticationPasskeyParameters
  (GetAuthenticationPasskeyParameters(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns parameters for authentication using a passkey as JSON-serialized string. Returns 'TD.Data.Text.Text'
data GetAuthenticationPasskeyParameters
  = GetAuthenticationPasskeyParameters
  deriving (Eq, Show)

instance I.ShortShow GetAuthenticationPasskeyParameters where
  shortShow
    GetAuthenticationPasskeyParameters
        = "GetAuthenticationPasskeyParameters"

instance AT.ToJSON GetAuthenticationPasskeyParameters where
  toJSON
    GetAuthenticationPasskeyParameters
        = A.object
          [ "@type" A..= AT.String "getAuthenticationPasskeyParameters"
          ]

