-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallScreenSharingIsPaused where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Pauses or unpauses screen sharing in a joined group call 
-- 
-- __group_call_id__ Group call identifier
-- 
-- __is_paused__ True if screen sharing is paused
data ToggleGroupCallScreenSharingIsPaused = 

 ToggleGroupCallScreenSharingIsPaused { is_paused :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show ToggleGroupCallScreenSharingIsPaused where
 show ToggleGroupCallScreenSharingIsPaused { is_paused=is_paused, group_call_id=group_call_id } =
  "ToggleGroupCallScreenSharingIsPaused" ++ U.cc [U.p "is_paused" is_paused, U.p "group_call_id" group_call_id ]

instance T.ToJSON ToggleGroupCallScreenSharingIsPaused where
 toJSON ToggleGroupCallScreenSharingIsPaused { is_paused = is_paused, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "toggleGroupCallScreenSharingIsPaused", "is_paused" A..= is_paused, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallScreenSharingIsPaused where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallScreenSharingIsPaused" -> parseToggleGroupCallScreenSharingIsPaused v
   _ -> mempty
  where
   parseToggleGroupCallScreenSharingIsPaused :: A.Value -> T.Parser ToggleGroupCallScreenSharingIsPaused
   parseToggleGroupCallScreenSharingIsPaused = A.withObject "ToggleGroupCallScreenSharingIsPaused" $ \o -> do
    is_paused <- o A..:? "is_paused"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallScreenSharingIsPaused { is_paused = is_paused, group_call_id = group_call_id }
 parseJSON _ = mempty
