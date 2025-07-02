module TD.Data.VideoMessageAdvertisements
  (VideoMessageAdvertisements(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.VideoMessageAdvertisement as VideoMessageAdvertisement

data VideoMessageAdvertisements
  = VideoMessageAdvertisements -- ^ Contains a list of advertisements to be shown while a video from a message is watched
    { advertisements :: Maybe [VideoMessageAdvertisement.VideoMessageAdvertisement] -- ^ List of advertisements
    , start_delay    :: Maybe Int                                                   -- ^ Delay before the first advertisement is shown, in seconds
    , between_delay  :: Maybe Int                                                   -- ^ Delay between consecutive advertisements, in seconds
    }
  deriving (Eq, Show)

instance I.ShortShow VideoMessageAdvertisements where
  shortShow VideoMessageAdvertisements
    { advertisements = advertisements_
    , start_delay    = start_delay_
    , between_delay  = between_delay_
    }
      = "VideoMessageAdvertisements"
        ++ I.cc
        [ "advertisements" `I.p` advertisements_
        , "start_delay"    `I.p` start_delay_
        , "between_delay"  `I.p` between_delay_
        ]

instance AT.FromJSON VideoMessageAdvertisements where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoMessageAdvertisements" -> parseVideoMessageAdvertisements v
      _                            -> mempty
    
    where
      parseVideoMessageAdvertisements :: A.Value -> AT.Parser VideoMessageAdvertisements
      parseVideoMessageAdvertisements = A.withObject "VideoMessageAdvertisements" $ \o -> do
        advertisements_ <- o A..:?  "advertisements"
        start_delay_    <- o A..:?  "start_delay"
        between_delay_  <- o A..:?  "between_delay"
        pure $ VideoMessageAdvertisements
          { advertisements = advertisements_
          , start_delay    = start_delay_
          , between_delay  = between_delay_
          }
  parseJSON _ = mempty

