module TD.Query.GetLogStream
  (GetLogStream(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously
data GetLogStream
  = GetLogStream
  deriving (Eq)

instance Show GetLogStream where
  show
    GetLogStream
        = "GetLogStream"

instance AT.ToJSON GetLogStream where
  toJSON
    GetLogStream
        = A.object
          [ "@type" A..= AT.String "getLogStream"
          ]

