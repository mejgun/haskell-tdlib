module TD.Data.BusinessInfo
  (BusinessInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessLocation as BusinessLocation
import qualified TD.Data.BusinessOpeningHours as BusinessOpeningHours
import qualified TD.Data.BusinessGreetingMessageSettings as BusinessGreetingMessageSettings
import qualified TD.Data.BusinessAwayMessageSettings as BusinessAwayMessageSettings
import qualified TD.Data.BusinessStartPage as BusinessStartPage

data BusinessInfo
  = BusinessInfo -- ^ Contains information about a Telegram Business account
    { location                  :: Maybe BusinessLocation.BusinessLocation                               -- ^ Location of the business; may be null if none
    , opening_hours             :: Maybe BusinessOpeningHours.BusinessOpeningHours                       -- ^ Opening hours of the business; may be null if none. The hours are guaranteed to be valid and has already been split by week days
    , local_opening_hours       :: Maybe BusinessOpeningHours.BusinessOpeningHours                       -- ^ Opening hours of the business in the local time; may be null if none. The hours are guaranteed to be valid and has already been split by week days. Local time zone identifier will be empty. An updateUserFullInfo update is not triggered when value of this field changes
    , next_open_in              :: Maybe Int                                                             -- ^ Time left before the business will open the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes
    , next_close_in             :: Maybe Int                                                             -- ^ Time left before the business will close the next time, in seconds; 0 if unknown. An updateUserFullInfo update is not triggered when value of this field changes
    , greeting_message_settings :: Maybe BusinessGreetingMessageSettings.BusinessGreetingMessageSettings -- ^ The greeting message; may be null if none or the Business account is not of the current user
    , away_message_settings     :: Maybe BusinessAwayMessageSettings.BusinessAwayMessageSettings         -- ^ The away message; may be null if none or the Business account is not of the current user
    , start_page                :: Maybe BusinessStartPage.BusinessStartPage                             -- ^ Information about start page of the account; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessInfo where
  shortShow BusinessInfo
    { location                  = location_
    , opening_hours             = opening_hours_
    , local_opening_hours       = local_opening_hours_
    , next_open_in              = next_open_in_
    , next_close_in             = next_close_in_
    , greeting_message_settings = greeting_message_settings_
    , away_message_settings     = away_message_settings_
    , start_page                = start_page_
    }
      = "BusinessInfo"
        ++ I.cc
        [ "location"                  `I.p` location_
        , "opening_hours"             `I.p` opening_hours_
        , "local_opening_hours"       `I.p` local_opening_hours_
        , "next_open_in"              `I.p` next_open_in_
        , "next_close_in"             `I.p` next_close_in_
        , "greeting_message_settings" `I.p` greeting_message_settings_
        , "away_message_settings"     `I.p` away_message_settings_
        , "start_page"                `I.p` start_page_
        ]

instance AT.FromJSON BusinessInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessInfo" -> parseBusinessInfo v
      _              -> mempty
    
    where
      parseBusinessInfo :: A.Value -> AT.Parser BusinessInfo
      parseBusinessInfo = A.withObject "BusinessInfo" $ \o -> do
        location_                  <- o A..:?  "location"
        opening_hours_             <- o A..:?  "opening_hours"
        local_opening_hours_       <- o A..:?  "local_opening_hours"
        next_open_in_              <- o A..:?  "next_open_in"
        next_close_in_             <- o A..:?  "next_close_in"
        greeting_message_settings_ <- o A..:?  "greeting_message_settings"
        away_message_settings_     <- o A..:?  "away_message_settings"
        start_page_                <- o A..:?  "start_page"
        pure $ BusinessInfo
          { location                  = location_
          , opening_hours             = opening_hours_
          , local_opening_hours       = local_opening_hours_
          , next_open_in              = next_open_in_
          , next_close_in             = next_close_in_
          , greeting_message_settings = greeting_message_settings_
          , away_message_settings     = away_message_settings_
          , start_page                = start_page_
          }
  parseJSON _ = mempty

