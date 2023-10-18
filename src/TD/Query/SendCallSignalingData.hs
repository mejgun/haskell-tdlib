module TD.Query.SendCallSignalingData
  (SendCallSignalingData(..)
  , defaultSendCallSignalingData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Sends call signaling data. Returns 'TD.Data.Ok.Ok'
data SendCallSignalingData
  = SendCallSignalingData
    { call_id :: Maybe Int           -- ^ Call identifier
    , _data   :: Maybe BS.ByteString -- ^ The data
    }
  deriving (Eq, Show)

instance I.ShortShow SendCallSignalingData where
  shortShow
    SendCallSignalingData
      { call_id = call_id_
      , _data   = _data_
      }
        = "SendCallSignalingData"
          ++ I.cc
          [ "call_id" `I.p` call_id_
          , "_data"   `I.p` _data_
          ]

instance AT.ToJSON SendCallSignalingData where
  toJSON
    SendCallSignalingData
      { call_id = call_id_
      , _data   = _data_
      }
        = A.object
          [ "@type"   A..= AT.String "sendCallSignalingData"
          , "call_id" A..= call_id_
          , "data"    A..= fmap I.writeBytes  _data_
          ]

defaultSendCallSignalingData :: SendCallSignalingData
defaultSendCallSignalingData =
  SendCallSignalingData
    { call_id = Nothing
    , _data   = Nothing
    }

