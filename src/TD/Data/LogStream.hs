module TD.Data.LogStream
  ( LogStream(..)        
  , defaultLogStreamFile 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a stream to which TDLib internal log is written
data LogStream
  = LogStreamDefault -- ^ The log is written to stderr or an OS specific log
  | LogStreamFile -- ^ The log is written to a file
    { path            :: Maybe T.Text -- ^ Path to the file to where the internal TDLib log will be written
    , max_file_size   :: Maybe Int    -- ^ The maximum size of the file to where the internal TDLib log is written before the file will automatically be rotated, in bytes
    , redirect_stderr :: Maybe Bool   -- ^ Pass true to additionally redirect stderr to the log file. Ignored on Windows
    }
  | LogStreamEmpty -- ^ The log is written nowhere
  deriving (Eq)

instance Show LogStream where
  show LogStreamDefault
      = "LogStreamDefault"
  show LogStreamFile
    { path            = path_
    , max_file_size   = max_file_size_
    , redirect_stderr = redirect_stderr_
    }
      = "LogStreamFile"
        ++ I.cc
        [ "path"            `I.p` path_
        , "max_file_size"   `I.p` max_file_size_
        , "redirect_stderr" `I.p` redirect_stderr_
        ]
  show LogStreamEmpty
      = "LogStreamEmpty"

instance AT.FromJSON LogStream where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "logStreamDefault" -> pure LogStreamDefault
      "logStreamFile"    -> parseLogStreamFile v
      "logStreamEmpty"   -> pure LogStreamEmpty
      _                  -> mempty
    
    where
      parseLogStreamFile :: A.Value -> AT.Parser LogStream
      parseLogStreamFile = A.withObject "LogStreamFile" $ \o -> do
        path_            <- o A..:?  "path"
        max_file_size_   <- o A..:?  "max_file_size"
        redirect_stderr_ <- o A..:?  "redirect_stderr"
        pure $ LogStreamFile
          { path            = path_
          , max_file_size   = max_file_size_
          , redirect_stderr = redirect_stderr_
          }
  parseJSON _ = mempty

instance AT.ToJSON LogStream where
  toJSON LogStreamDefault
      = A.object
        [ "@type" A..= AT.String "logStreamDefault"
        ]
  toJSON LogStreamFile
    { path            = path_
    , max_file_size   = max_file_size_
    , redirect_stderr = redirect_stderr_
    }
      = A.object
        [ "@type"           A..= AT.String "logStreamFile"
        , "path"            A..= path_
        , "max_file_size"   A..= max_file_size_
        , "redirect_stderr" A..= redirect_stderr_
        ]
  toJSON LogStreamEmpty
      = A.object
        [ "@type" A..= AT.String "logStreamEmpty"
        ]

defaultLogStreamFile :: LogStream
defaultLogStreamFile =
  LogStreamFile
    { path            = Nothing
    , max_file_size   = Nothing
    , redirect_stderr = Nothing
    }

