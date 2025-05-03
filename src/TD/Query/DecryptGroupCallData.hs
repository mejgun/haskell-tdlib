module TD.Query.DecryptGroupCallData
  (DecryptGroupCallData(..)
  , defaultDecryptGroupCallData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.GroupCallDataChannel as GroupCallDataChannel
import qualified Data.ByteString as BS

-- | Decrypts group call data received by tgcalls. Returns 'TD.Data.Data.Data'
data DecryptGroupCallData
  = DecryptGroupCallData
    { group_call_id  :: Maybe Int                                       -- ^ Group call identifier. The call must not be a video chat
    , participant_id :: Maybe MessageSender.MessageSender               -- ^ Identifier of the group call participant, which sent the data
    , data_channel   :: Maybe GroupCallDataChannel.GroupCallDataChannel -- ^ Data channel for which data was encrypted; pass null if unknown
    , _data          :: Maybe BS.ByteString                             -- ^ Data to decrypt
    }
  deriving (Eq, Show)

instance I.ShortShow DecryptGroupCallData where
  shortShow
    DecryptGroupCallData
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , data_channel   = data_channel_
      , _data          = _data_
      }
        = "DecryptGroupCallData"
          ++ I.cc
          [ "group_call_id"  `I.p` group_call_id_
          , "participant_id" `I.p` participant_id_
          , "data_channel"   `I.p` data_channel_
          , "_data"          `I.p` _data_
          ]

instance AT.ToJSON DecryptGroupCallData where
  toJSON
    DecryptGroupCallData
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , data_channel   = data_channel_
      , _data          = _data_
      }
        = A.object
          [ "@type"          A..= AT.String "decryptGroupCallData"
          , "group_call_id"  A..= group_call_id_
          , "participant_id" A..= participant_id_
          , "data_channel"   A..= data_channel_
          , "data"           A..= fmap I.writeBytes  _data_
          ]

defaultDecryptGroupCallData :: DecryptGroupCallData
defaultDecryptGroupCallData =
  DecryptGroupCallData
    { group_call_id  = Nothing
    , participant_id = Nothing
    , data_channel   = Nothing
    , _data          = Nothing
    }

