module TD.Query.GetLogStream(GetLogStream(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetLogStream -- ^ Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously
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
