module TD.Query.GetLogTagVerbosityLevel
  (GetLogTagVerbosityLevel(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously. Returns 'TD.Data.LogVerbosityLevel.LogVerbosityLevel'
data GetLogTagVerbosityLevel
  = GetLogTagVerbosityLevel
    { tag :: Maybe T.Text -- ^ Logging tag to change verbosity level
    }
  deriving (Eq, Show)

instance I.ShortShow GetLogTagVerbosityLevel where
  shortShow
    GetLogTagVerbosityLevel
      { tag = tag_
      }
        = "GetLogTagVerbosityLevel"
          ++ I.cc
          [ "tag" `I.p` tag_
          ]

instance AT.ToJSON GetLogTagVerbosityLevel where
  toJSON
    GetLogTagVerbosityLevel
      { tag = tag_
      }
        = A.object
          [ "@type" A..= AT.String "getLogTagVerbosityLevel"
          , "tag"   A..= tag_
          ]

