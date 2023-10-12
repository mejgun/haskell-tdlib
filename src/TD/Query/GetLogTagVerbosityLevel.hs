module TD.Query.GetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetLogTagVerbosityLevel -- ^ Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously
  = GetLogTagVerbosityLevel
    { tag :: Maybe T.Text -- ^ Logging tag to change verbosity level
    }
  deriving (Eq)

instance Show GetLogTagVerbosityLevel where
  show
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
