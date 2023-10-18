module TD.Query.GetLogVerbosityLevel
  (GetLogVerbosityLevel(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns current verbosity level of the internal logging of TDLib. Can be called synchronously. Returns 'TD.Data.LogVerbosityLevel.LogVerbosityLevel'
data GetLogVerbosityLevel
  = GetLogVerbosityLevel
  deriving (Eq, Show)

instance I.ShortShow GetLogVerbosityLevel where
  shortShow
    GetLogVerbosityLevel
        = "GetLogVerbosityLevel"

instance AT.ToJSON GetLogVerbosityLevel where
  toJSON
    GetLogVerbosityLevel
        = A.object
          [ "@type" A..= AT.String "getLogVerbosityLevel"
          ]

