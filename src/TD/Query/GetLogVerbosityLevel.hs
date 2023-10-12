module TD.Query.GetLogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetLogVerbosityLevel -- ^ Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
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
