{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStoryNotificationSettingsExceptions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of chats with non-default notification settings for stories
data GetStoryNotificationSettingsExceptions = GetStoryNotificationSettingsExceptions
  {
  }
  deriving (Eq)

instance Show GetStoryNotificationSettingsExceptions where
  show GetStoryNotificationSettingsExceptions =
    "GetStoryNotificationSettingsExceptions"
      ++ U.cc
        []

instance T.ToJSON GetStoryNotificationSettingsExceptions where
  toJSON GetStoryNotificationSettingsExceptions =
    A.object
      [ "@type" A..= T.String "getStoryNotificationSettingsExceptions"
      ]
