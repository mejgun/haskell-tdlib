module TD.Query.DisableProxy
  (DisableProxy(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Disables the currently enabled proxy. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data DisableProxy
  = DisableProxy
  deriving (Eq, Show)

instance I.ShortShow DisableProxy where
  shortShow
    DisableProxy
        = "DisableProxy"

instance AT.ToJSON DisableProxy where
  toJSON
    DisableProxy
        = A.object
          [ "@type" A..= AT.String "disableProxy"
          ]

