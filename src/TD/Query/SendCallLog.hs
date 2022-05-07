{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SendCallLog where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Sends log file for a call to Telegram servers @call_id Call identifier @log_file Call log file. Only inputFileLocal and inputFileGenerated are supported
data SendCallLog = SendCallLog
  { -- |
    log_file :: Maybe InputFile.InputFile,
    -- |
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendCallLog where
  show
    SendCallLog
      { log_file = log_file,
        call_id = call_id
      } =
      "SendCallLog"
        ++ U.cc
          [ U.p "log_file" log_file,
            U.p "call_id" call_id
          ]

instance T.ToJSON SendCallLog where
  toJSON
    SendCallLog
      { log_file = log_file,
        call_id = call_id
      } =
      A.object
        [ "@type" A..= T.String "sendCallLog",
          "log_file" A..= log_file,
          "call_id" A..= call_id
        ]
