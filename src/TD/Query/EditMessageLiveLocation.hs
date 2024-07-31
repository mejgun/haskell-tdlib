module TD.Query.EditMessageLiveLocation
  (EditMessageLiveLocation(..)
  , defaultEditMessageLiveLocation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.Location as Location

-- | Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side. Returns 'TD.Data.Message.Message'
data EditMessageLiveLocation
  = EditMessageLiveLocation
    { chat_id                :: Maybe Int                     -- ^ The chat the message belongs to
    , message_id             :: Maybe Int                     -- ^ Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup -- ^ The new message reply markup; pass null if none; for bots only
    , location               :: Maybe Location.Location       -- ^ New location content of the message; pass null to stop sharing the live location
    , live_period            :: Maybe Int                     -- ^ New time relative to the message send date, for which the location can be updated, in seconds. If 0x7FFFFFFF specified, then the location can be updated forever. Otherwise, must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days. Pass 0 to keep the current live_period
    , heading                :: Maybe Int                     -- ^ The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    , proximity_alert_radius :: Maybe Int                     -- ^ The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageLiveLocation where
  shortShow
    EditMessageLiveLocation
      { chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , location               = location_
      , live_period            = live_period_
      , heading                = heading_
      , proximity_alert_radius = proximity_alert_radius_
      }
        = "EditMessageLiveLocation"
          ++ I.cc
          [ "chat_id"                `I.p` chat_id_
          , "message_id"             `I.p` message_id_
          , "reply_markup"           `I.p` reply_markup_
          , "location"               `I.p` location_
          , "live_period"            `I.p` live_period_
          , "heading"                `I.p` heading_
          , "proximity_alert_radius" `I.p` proximity_alert_radius_
          ]

instance AT.ToJSON EditMessageLiveLocation where
  toJSON
    EditMessageLiveLocation
      { chat_id                = chat_id_
      , message_id             = message_id_
      , reply_markup           = reply_markup_
      , location               = location_
      , live_period            = live_period_
      , heading                = heading_
      , proximity_alert_radius = proximity_alert_radius_
      }
        = A.object
          [ "@type"                  A..= AT.String "editMessageLiveLocation"
          , "chat_id"                A..= chat_id_
          , "message_id"             A..= message_id_
          , "reply_markup"           A..= reply_markup_
          , "location"               A..= location_
          , "live_period"            A..= live_period_
          , "heading"                A..= heading_
          , "proximity_alert_radius" A..= proximity_alert_radius_
          ]

defaultEditMessageLiveLocation :: EditMessageLiveLocation
defaultEditMessageLiveLocation =
  EditMessageLiveLocation
    { chat_id                = Nothing
    , message_id             = Nothing
    , reply_markup           = Nothing
    , location               = Nothing
    , live_period            = Nothing
    , heading                = Nothing
    , proximity_alert_radius = Nothing
    }

