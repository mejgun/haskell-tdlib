module TD.Query.SendCallDebugInformation
  (SendCallDebugInformation(..)
  , defaultSendCallDebugInformation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sends debug information for a call to Telegram servers. Returns 'TD.Data.Ok.Ok'
data SendCallDebugInformation
  = SendCallDebugInformation
    { call_id           :: Maybe Int    -- ^ Call identifier
    , debug_information :: Maybe T.Text -- ^ Debug information in application-specific format
    }
  deriving (Eq, Show)

instance I.ShortShow SendCallDebugInformation where
  shortShow
    SendCallDebugInformation
      { call_id           = call_id_
      , debug_information = debug_information_
      }
        = "SendCallDebugInformation"
          ++ I.cc
          [ "call_id"           `I.p` call_id_
          , "debug_information" `I.p` debug_information_
          ]

instance AT.ToJSON SendCallDebugInformation where
  toJSON
    SendCallDebugInformation
      { call_id           = call_id_
      , debug_information = debug_information_
      }
        = A.object
          [ "@type"             A..= AT.String "sendCallDebugInformation"
          , "call_id"           A..= call_id_
          , "debug_information" A..= debug_information_
          ]

defaultSendCallDebugInformation :: SendCallDebugInformation
defaultSendCallDebugInformation =
  SendCallDebugInformation
    { call_id           = Nothing
    , debug_information = Nothing
    }

