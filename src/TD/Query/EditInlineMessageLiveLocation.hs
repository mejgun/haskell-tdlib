{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditInlineMessageLiveLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified Utils as U

-- |
-- Edits the content of a live location in an inline message sent via a bot; for bots only
data EditInlineMessageLiveLocation = EditInlineMessageLiveLocation
  { -- | The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
    proximity_alert_radius :: Maybe Int,
    -- | The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    heading :: Maybe Int,
    -- | New location content of the message; pass null to stop sharing the live location
    location :: Maybe Location.Location,
    -- | The new message reply markup; pass null if none
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Inline message identifier
    inline_message_id :: Maybe String
  }
  deriving (Eq)

instance Show EditInlineMessageLiveLocation where
  show
    EditInlineMessageLiveLocation
      { proximity_alert_radius = proximity_alert_radius,
        heading = heading,
        location = location,
        reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      "EditInlineMessageLiveLocation"
        ++ U.cc
          [ U.p "proximity_alert_radius" proximity_alert_radius,
            U.p "heading" heading,
            U.p "location" location,
            U.p "reply_markup" reply_markup,
            U.p "inline_message_id" inline_message_id
          ]

instance T.ToJSON EditInlineMessageLiveLocation where
  toJSON
    EditInlineMessageLiveLocation
      { proximity_alert_radius = proximity_alert_radius,
        heading = heading,
        location = location,
        reply_markup = reply_markup,
        inline_message_id = inline_message_id
      } =
      A.object
        [ "@type" A..= T.String "editInlineMessageLiveLocation",
          "proximity_alert_radius" A..= proximity_alert_radius,
          "heading" A..= heading,
          "location" A..= location,
          "reply_markup" A..= reply_markup,
          "inline_message_id" A..= inline_message_id
        ]
