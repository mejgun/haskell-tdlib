module TD.Query.EndGroupCallRecording where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data EndGroupCallRecording -- ^ Ends recording of an active group call. Requires groupCall.can_be_managed group call flag
  = EndGroupCallRecording
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq)

instance Show EndGroupCallRecording where
  show
    EndGroupCallRecording
      { group_call_id = group_call_id_
      }
        = "EndGroupCallRecording"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON EndGroupCallRecording where
  toJSON
    EndGroupCallRecording
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "endGroupCallRecording"
          , "group_call_id" A..= group_call_id_
          ]
