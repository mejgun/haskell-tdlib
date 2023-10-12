module TD.Query.SendCallLog where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data SendCallLog -- ^ Sends log file for a call to Telegram servers
  = SendCallLog
    { call_id  :: Maybe Int                 -- ^ Call identifier
    , log_file :: Maybe InputFile.InputFile -- ^ Call log file. Only inputFileLocal and inputFileGenerated are supported
    }
  deriving (Eq)

instance Show SendCallLog where
  show
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
