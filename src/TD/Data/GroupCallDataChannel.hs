module TD.Data.GroupCallDataChannel
  (GroupCallDataChannel(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes data channel for a group call
data GroupCallDataChannel
  = GroupCallDataChannelMain -- ^ The main data channel for audio and video data
  | GroupCallDataChannelScreenSharing -- ^ The data channel for screen sharing
  deriving (Eq, Show)

instance I.ShortShow GroupCallDataChannel where
  shortShow GroupCallDataChannelMain
      = "GroupCallDataChannelMain"
  shortShow GroupCallDataChannelScreenSharing
      = "GroupCallDataChannelScreenSharing"

instance AT.FromJSON GroupCallDataChannel where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallDataChannelMain"          -> pure GroupCallDataChannelMain
      "groupCallDataChannelScreenSharing" -> pure GroupCallDataChannelScreenSharing
      _                                   -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON GroupCallDataChannel where
  toJSON GroupCallDataChannelMain
      = A.object
        [ "@type" A..= AT.String "groupCallDataChannelMain"
        ]
  toJSON GroupCallDataChannelScreenSharing
      = A.object
        [ "@type" A..= AT.String "groupCallDataChannelScreenSharing"
        ]

