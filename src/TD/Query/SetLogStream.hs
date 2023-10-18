module TD.Query.SetLogStream
  (SetLogStream(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LogStream as LogStream

-- | Sets new log stream for internal logging of TDLib. Can be called synchronously. Returns 'TD.Data.Ok.Ok'
data SetLogStream
  = SetLogStream
    { log_stream :: Maybe LogStream.LogStream -- ^ New log stream
    }
  deriving (Eq, Show)

instance I.ShortShow SetLogStream where
  shortShow
    SetLogStream
      { log_stream = log_stream_
      }
        = "SetLogStream"
          ++ I.cc
          [ "log_stream" `I.p` log_stream_
          ]

instance AT.ToJSON SetLogStream where
  toJSON
    SetLogStream
      { log_stream = log_stream_
      }
        = A.object
          [ "@type"      A..= AT.String "setLogStream"
          , "log_stream" A..= log_stream_
          ]

