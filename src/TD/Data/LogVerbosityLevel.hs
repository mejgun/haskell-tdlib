module TD.Data.LogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data LogVerbosityLevel
  = LogVerbosityLevel -- ^ Contains a TDLib internal log verbosity level
    { verbosity_level :: Maybe Int -- ^ Log verbosity level
    }
  deriving (Eq)

instance Show LogVerbosityLevel where
  show LogVerbosityLevel
    { verbosity_level = verbosity_level_
    }
      = "LogVerbosityLevel"
        ++ I.cc
        [ "verbosity_level" `I.p` verbosity_level_
        ]

instance AT.FromJSON LogVerbosityLevel where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "logVerbosityLevel" -> parseLogVerbosityLevel v
      _                   -> mempty
    
    where
      parseLogVerbosityLevel :: A.Value -> AT.Parser LogVerbosityLevel
      parseLogVerbosityLevel = A.withObject "LogVerbosityLevel" $ \o -> do
        verbosity_level_ <- o A..:?  "verbosity_level"
        pure $ LogVerbosityLevel
          { verbosity_level = verbosity_level_
          }

instance AT.ToJSON LogVerbosityLevel where
  toJSON LogVerbosityLevel
    { verbosity_level = verbosity_level_
    }
      = A.object
        [ "@type"           A..= AT.String "logVerbosityLevel"
        , "verbosity_level" A..= verbosity_level_
        ]
