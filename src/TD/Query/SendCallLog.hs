module TD.Query.SendCallLog
  (SendCallLog(..)
  , defaultSendCallLog
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Sends log file for a call to Telegram servers. Returns 'TD.Data.Ok.Ok'
data SendCallLog
  = SendCallLog
    { call_id  :: Maybe Int                 -- ^ Call identifier
    , log_file :: Maybe InputFile.InputFile -- ^ Call log file. Only inputFileLocal and inputFileGenerated are supported
    }
  deriving (Eq, Show)

instance I.ShortShow SendCallLog where
  shortShow
    SendCallLog
      { call_id  = call_id_
      , log_file = log_file_
      }
        = "SendCallLog"
          ++ I.cc
          [ "call_id"  `I.p` call_id_
          , "log_file" `I.p` log_file_
          ]

instance AT.ToJSON SendCallLog where
  toJSON
    SendCallLog
      { call_id  = call_id_
      , log_file = log_file_
      }
        = A.object
          [ "@type"    A..= AT.String "sendCallLog"
          , "call_id"  A..= call_id_
          , "log_file" A..= log_file_
          ]

defaultSendCallLog :: SendCallLog
defaultSendCallLog =
  SendCallLog
    { call_id  = Nothing
    , log_file = Nothing
    }

