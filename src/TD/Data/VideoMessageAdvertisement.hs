module TD.Data.VideoMessageAdvertisement
  (VideoMessageAdvertisement(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.AdvertisementSponsor as AdvertisementSponsor

data VideoMessageAdvertisement
  = VideoMessageAdvertisement -- ^ Describes an advertisent to be shown while a video from a message is watched
    { unique_id            :: Maybe Int                                       -- ^ Unique identifier of this result
    , text                 :: Maybe T.Text                                    -- ^ Text of the advertisement
    , min_display_duration :: Maybe Int                                       -- ^ The minimum amount of time the advertisement must be displayed before it can be hidden by the user, in seconds
    , max_display_duration :: Maybe Int                                       -- ^ The maximum amount of time the advertisement must be displayed before it must be automatically hidden, in seconds
    , can_be_reported      :: Maybe Bool                                      -- ^ True, if the advertisement can be reported to Telegram moderators through reportVideoMessageAdvertisement
    , sponsor              :: Maybe AdvertisementSponsor.AdvertisementSponsor -- ^ Information about the sponsor of the advertisement
    , title                :: Maybe T.Text                                    -- ^ Title of the sponsored message
    , additional_info      :: Maybe T.Text                                    -- ^ If non-empty, additional information about the sponsored message to be shown along with the message
    }
  deriving (Eq, Show)

instance I.ShortShow VideoMessageAdvertisement where
  shortShow VideoMessageAdvertisement
    { unique_id            = unique_id_
    , text                 = text_
    , min_display_duration = min_display_duration_
    , max_display_duration = max_display_duration_
    , can_be_reported      = can_be_reported_
    , sponsor              = sponsor_
    , title                = title_
    , additional_info      = additional_info_
    }
      = "VideoMessageAdvertisement"
        ++ I.cc
        [ "unique_id"            `I.p` unique_id_
        , "text"                 `I.p` text_
        , "min_display_duration" `I.p` min_display_duration_
        , "max_display_duration" `I.p` max_display_duration_
        , "can_be_reported"      `I.p` can_be_reported_
        , "sponsor"              `I.p` sponsor_
        , "title"                `I.p` title_
        , "additional_info"      `I.p` additional_info_
        ]

instance AT.FromJSON VideoMessageAdvertisement where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoMessageAdvertisement" -> parseVideoMessageAdvertisement v
      _                           -> mempty
    
    where
      parseVideoMessageAdvertisement :: A.Value -> AT.Parser VideoMessageAdvertisement
      parseVideoMessageAdvertisement = A.withObject "VideoMessageAdvertisement" $ \o -> do
        unique_id_            <- o A..:?  "unique_id"
        text_                 <- o A..:?  "text"
        min_display_duration_ <- o A..:?  "min_display_duration"
        max_display_duration_ <- o A..:?  "max_display_duration"
        can_be_reported_      <- o A..:?  "can_be_reported"
        sponsor_              <- o A..:?  "sponsor"
        title_                <- o A..:?  "title"
        additional_info_      <- o A..:?  "additional_info"
        pure $ VideoMessageAdvertisement
          { unique_id            = unique_id_
          , text                 = text_
          , min_display_duration = min_display_duration_
          , max_display_duration = max_display_duration_
          , can_be_reported      = can_be_reported_
          , sponsor              = sponsor_
          , title                = title_
          , additional_info      = additional_info_
          }
  parseJSON _ = mempty

