-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageLiveLocation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the content of a live location in an inline message sent via a bot; for bots only 
-- 
-- __inline_message_id__ Inline message identifier
-- 
-- __reply_markup__ The new message reply markup
-- 
-- __location__ New location content of the message; may be null. Pass null to stop sharing the live location
-- 
-- __heading__ The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
-- 
-- __proximity_alert_radius__ The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
data EditInlineMessageLiveLocation = 

 EditInlineMessageLiveLocation { proximity_alert_radius :: Maybe Int, heading :: Maybe Int, location :: Maybe Location.Location, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, inline_message_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON EditInlineMessageLiveLocation where
 toJSON (EditInlineMessageLiveLocation { proximity_alert_radius = proximity_alert_radius, heading = heading, location = location, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageLiveLocation", "proximity_alert_radius" A..= proximity_alert_radius, "heading" A..= heading, "location" A..= location, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON EditInlineMessageLiveLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageLiveLocation" -> parseEditInlineMessageLiveLocation v
   _ -> mempty
  where
   parseEditInlineMessageLiveLocation :: A.Value -> T.Parser EditInlineMessageLiveLocation
   parseEditInlineMessageLiveLocation = A.withObject "EditInlineMessageLiveLocation" $ \o -> do
    proximity_alert_radius <- mconcat [ o A..:? "proximity_alert_radius", readMaybe <$> (o A..: "proximity_alert_radius" :: T.Parser String)] :: T.Parser (Maybe Int)
    heading <- mconcat [ o A..:? "heading", readMaybe <$> (o A..: "heading" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    reply_markup <- o A..:? "reply_markup"
    inline_message_id <- o A..:? "inline_message_id"
    return $ EditInlineMessageLiveLocation { proximity_alert_radius = proximity_alert_radius, heading = heading, location = location, reply_markup = reply_markup, inline_message_id = inline_message_id }