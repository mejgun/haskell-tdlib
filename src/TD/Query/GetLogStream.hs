module TD.Query.GetLogStream
  (GetLogStream(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously. Returns 'TD.Data.LogStream.LogStream'
data GetLogStream
  = GetLogStream
  deriving (Eq, Show)

instance I.ShortShow GetLogStream where
  shortShow
    GetLogStream
        = "GetLogStream"

instance AT.ToJSON GetLogStream where
  toJSON
    GetLogStream
        = A.object
          [ "@type" A..= AT.String "getLogStream"
          ]

