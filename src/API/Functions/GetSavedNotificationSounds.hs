-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedNotificationSounds where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used
data GetSavedNotificationSounds = 

 GetSavedNotificationSounds deriving (Eq)

instance Show GetSavedNotificationSounds where
 show GetSavedNotificationSounds {  } =
  "GetSavedNotificationSounds" ++ U.cc [ ]

instance T.ToJSON GetSavedNotificationSounds where
 toJSON GetSavedNotificationSounds {  } =
  A.object [ "@type" A..= T.String "getSavedNotificationSounds" ]

instance T.FromJSON GetSavedNotificationSounds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSavedNotificationSounds" -> parseGetSavedNotificationSounds v
   _ -> mempty
  where
   parseGetSavedNotificationSounds :: A.Value -> T.Parser GetSavedNotificationSounds
   parseGetSavedNotificationSounds = A.withObject "GetSavedNotificationSounds" $ \o -> do
    return $ GetSavedNotificationSounds {  }
 parseJSON _ = mempty
