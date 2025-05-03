module TD.Query.EncryptGroupCallData
  (EncryptGroupCallData(..)
  , defaultEncryptGroupCallData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallDataChannel as GroupCallDataChannel
import qualified Data.ByteString as BS

-- | Encrypts group call data before sending them over network using tgcalls. Returns 'TD.Data.Data.Data'
data EncryptGroupCallData
  = EncryptGroupCallData
    { group_call_id           :: Maybe Int                                       -- ^ Group call identifier. The call must not be a video chat
    , data_channel            :: Maybe GroupCallDataChannel.GroupCallDataChannel -- ^ Data channel for which data is encrypted
    , _data                   :: Maybe BS.ByteString                             -- ^ Data to encrypt
    , unencrypted_prefix_size :: Maybe Int                                       -- ^ Size of data prefix that must be kept unencrypted
    }
  deriving (Eq, Show)

instance I.ShortShow EncryptGroupCallData where
  shortShow
    EncryptGroupCallData
      { group_call_id           = group_call_id_
      , data_channel            = data_channel_
      , _data                   = _data_
      , unencrypted_prefix_size = unencrypted_prefix_size_
      }
        = "EncryptGroupCallData"
          ++ I.cc
          [ "group_call_id"           `I.p` group_call_id_
          , "data_channel"            `I.p` data_channel_
          , "_data"                   `I.p` _data_
          , "unencrypted_prefix_size" `I.p` unencrypted_prefix_size_
          ]

instance AT.ToJSON EncryptGroupCallData where
  toJSON
    EncryptGroupCallData
      { group_call_id           = group_call_id_
      , data_channel            = data_channel_
      , _data                   = _data_
      , unencrypted_prefix_size = unencrypted_prefix_size_
      }
        = A.object
          [ "@type"                   A..= AT.String "encryptGroupCallData"
          , "group_call_id"           A..= group_call_id_
          , "data_channel"            A..= data_channel_
          , "data"                    A..= fmap I.writeBytes  _data_
          , "unencrypted_prefix_size" A..= unencrypted_prefix_size_
          ]

defaultEncryptGroupCallData :: EncryptGroupCallData
defaultEncryptGroupCallData =
  EncryptGroupCallData
    { group_call_id           = Nothing
    , data_channel            = Nothing
    , _data                   = Nothing
    , unencrypted_prefix_size = Nothing
    }

