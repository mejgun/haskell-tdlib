module TD.Query.EditBusinessMessageLiveLocation
  (EditBusinessMessageLiveLocation(..)
  , defaultEditBusinessMessageLiveLocation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.Location as Location

-- | Edits the content of a live location in a message sent on behalf of a business account; for bots only. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data EditBusinessMessageLiveLocation
  = EditBusinessMessageLiveLocation
    { business_connection_id :: Maybe T.Text                  -- ^ Unique identifier of business connection on behalf of which the message was sent
    , chat_id                :: Maybe Int                     -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                     -- ^ Identifier of the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none
    , location               :: Maybe Location.Location       -- ^ New location content of the message; pass null to stop sharing the live location
    , live_period            :: Maybe Int                     -- ^ New time relative to the message send date, for which the location can be updated, in seconds. If 0x7FFFFFFF specified, then the location can be updated forever. Otherwise, must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days. Pass 0 to keep the current live_period
    , heading                :: Maybe Int                     -- ^ The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    , proximity_alert_radius :: Maybe Int                     -- ^ The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessMessageLiveLocation where
  shortShow
    EditBusinessMessageLiveLocation
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , location               = location_
      , live_period            = live_period_
      , heading                = heading_
      , proximity_alert_radius = proximity_alert_radius_
      }
        = "EditBusinessMessageLiveLocation"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          , "location"               `I.p` location_
          , "live_period"            `I.p` live_period_
          , "heading"                `I.p` heading_
          , "proximity_alert_radius" `I.p` proximity_alert_radius_
          ]

instance AT.ToJSON EditBusinessMessageLiveLocation where
  toJSON
    EditBusinessMessageLiveLocation
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , location               = location_
      , live_period            = live_period_
      , heading                = heading_
      , proximity_alert_radius = proximity_alert_radius_
      }
        = A.object
          [ "@type"                  A..= AT.String "editBusinessMessageLiveLocation"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          , "location"               A..= location_
          , "live_period"            A..= live_period_
          , "heading"                A..= heading_
          , "proximity_alert_radius" A..= proximity_alert_radius_
          ]

defaultEditBusinessMessageLiveLocation :: EditBusinessMessageLiveLocation
defaultEditBusinessMessageLiveLocation =
  EditBusinessMessageLiveLocation
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    , location               = Nothing
    , live_period            = Nothing
    , heading                = Nothing
    , proximity_alert_radius = Nothing
    }

