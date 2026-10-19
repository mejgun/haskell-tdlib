module TD.Query.GetOnRampProviders
  (GetOnRampProviders(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns available on-ramp providers. Returns 'TD.Data.OnRampProviders.OnRampProviders'
data GetOnRampProviders
  = GetOnRampProviders
    { cryptocurrency :: Maybe T.Text -- ^ Pass a cryptocurrency to receive only providers that support it; pass an empty string to receive all providers
    }
  deriving (Eq, Show)

instance I.ShortShow GetOnRampProviders where
  shortShow
    GetOnRampProviders
      { cryptocurrency = cryptocurrency_
      }
        = "GetOnRampProviders"
          ++ I.cc
          [ "cryptocurrency" `I.p` cryptocurrency_
          ]

instance AT.ToJSON GetOnRampProviders where
  toJSON
    GetOnRampProviders
      { cryptocurrency = cryptocurrency_
      }
        = A.object
          [ "@type"          A..= AT.String "getOnRampProviders"
          , "cryptocurrency" A..= cryptocurrency_
          ]

