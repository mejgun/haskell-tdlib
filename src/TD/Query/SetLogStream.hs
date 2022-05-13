{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetLogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LogStream as LogStream
import qualified Utils as U

-- |
-- Sets new log stream for internal logging of TDLib. Can be called synchronously @log_stream New log stream
data SetLogStream = SetLogStream
  { -- |
    log_stream :: Maybe LogStream.LogStream
  }
  deriving (Eq)

instance Show SetLogStream where
  show
    SetLogStream
      { log_stream = log_stream_
      } =
      "SetLogStream"
        ++ U.cc
          [ U.p "log_stream" log_stream_
          ]

instance T.ToJSON SetLogStream where
  toJSON
    SetLogStream
      { log_stream = log_stream_
      } =
      A.object
        [ "@type" A..= T.String "setLogStream",
          "log_stream" A..= log_stream_
        ]
