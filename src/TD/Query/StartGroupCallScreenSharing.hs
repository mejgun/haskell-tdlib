module TD.Query.StartGroupCallScreenSharing
  (StartGroupCallScreenSharing(..)
  , defaultStartGroupCallScreenSharing
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Starts screen sharing in a joined group call. Returns join response payload for tgcalls. Returns 'TD.Data.Text.Text'
data StartGroupCallScreenSharing
  = StartGroupCallScreenSharing
    { group_call_id   :: Maybe Int    -- ^ Group call identifier
    , audio_source_id :: Maybe Int    -- ^ Screen sharing audio channel synchronization source identifier; received from tgcalls
    , payload         :: Maybe T.Text -- ^ Group call join payload; received from tgcalls
    }
  deriving (Eq, Show)

instance I.ShortShow StartGroupCallScreenSharing where
  shortShow
    StartGroupCallScreenSharing
      { group_call_id   = group_call_id_
      , audio_source_id = audio_source_id_
      , payload         = payload_
      }
        = "StartGroupCallScreenSharing"
          ++ I.cc
          [ "group_call_id"   `I.p` group_call_id_
          , "audio_source_id" `I.p` audio_source_id_
          , "payload"         `I.p` payload_
          ]

instance AT.ToJSON StartGroupCallScreenSharing where
  toJSON
    StartGroupCallScreenSharing
      { group_call_id   = group_call_id_
      , audio_source_id = audio_source_id_
      , payload         = payload_
      }
        = A.object
          [ "@type"           A..= AT.String "startGroupCallScreenSharing"
          , "group_call_id"   A..= group_call_id_
          , "audio_source_id" A..= audio_source_id_
          , "payload"         A..= payload_
          ]

defaultStartGroupCallScreenSharing :: StartGroupCallScreenSharing
defaultStartGroupCallScreenSharing =
  StartGroupCallScreenSharing
    { group_call_id   = Nothing
    , audio_source_id = Nothing
    , payload         = Nothing
    }

