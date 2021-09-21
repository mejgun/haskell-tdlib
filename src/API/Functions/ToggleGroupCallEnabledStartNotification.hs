-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallEnabledStartNotification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Toggles whether the current user will receive a notification when the group call will start; scheduled group calls only
-- 
-- __group_call_id__ Group call identifier
-- 
-- __enabled_start_notification__ New value of the enabled_start_notification setting
data ToggleGroupCallEnabledStartNotification = 

 ToggleGroupCallEnabledStartNotification { enabled_start_notification :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ToggleGroupCallEnabledStartNotification where
 toJSON (ToggleGroupCallEnabledStartNotification { enabled_start_notification = enabled_start_notification, group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "toggleGroupCallEnabledStartNotification", "enabled_start_notification" A..= enabled_start_notification, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallEnabledStartNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallEnabledStartNotification" -> parseToggleGroupCallEnabledStartNotification v
   _ -> mempty
  where
   parseToggleGroupCallEnabledStartNotification :: A.Value -> T.Parser ToggleGroupCallEnabledStartNotification
   parseToggleGroupCallEnabledStartNotification = A.withObject "ToggleGroupCallEnabledStartNotification" $ \o -> do
    enabled_start_notification <- o A..:? "enabled_start_notification"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallEnabledStartNotification { enabled_start_notification = enabled_start_notification, group_call_id = group_call_id }