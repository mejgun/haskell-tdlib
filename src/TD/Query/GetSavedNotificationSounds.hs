{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSavedNotificationSounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used
data GetSavedNotificationSounds = GetSavedNotificationSounds
  {
  }
  deriving (Eq)

instance Show GetSavedNotificationSounds where
  show GetSavedNotificationSounds =
    "GetSavedNotificationSounds"
      ++ U.cc
        []

instance T.ToJSON GetSavedNotificationSounds where
  toJSON GetSavedNotificationSounds =
    A.object
      [ "@type" A..= T.String "getSavedNotificationSounds"
      ]
