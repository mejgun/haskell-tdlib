module TD.Query.GetLogVerbosityLevel
  (GetLogVerbosityLevel(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
data GetLogVerbosityLevel
  = GetLogVerbosityLevel
  deriving (Eq)

instance Show GetLogVerbosityLevel where
  show
    GetLogVerbosityLevel
        = "GetLogVerbosityLevel"

instance AT.ToJSON GetLogVerbosityLevel where
  toJSON
    GetLogVerbosityLevel
        = A.object
          [ "@type" A..= AT.String "getLogVerbosityLevel"
          ]

