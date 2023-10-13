module TD.Query.DisableProxy(DisableProxy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data DisableProxy -- ^ Disables the currently enabled proxy. Can be called before authorization
  = DisableProxy
  deriving (Eq)

instance Show DisableProxy where
  show
    DisableProxy
        = "DisableProxy"

instance AT.ToJSON DisableProxy where
  toJSON
    DisableProxy
        = A.object
          [ "@type" A..= AT.String "disableProxy"
          ]
