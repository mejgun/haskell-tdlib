{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ActivateStoryStealthMode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Activates stealth mode for stories, which hides all views of stories from the current user in the last "story_stealth_mode_past_period" seconds
-- and for the next "story_stealth_mode_future_period" seconds; for Telegram Premium users only
data ActivateStoryStealthMode = ActivateStoryStealthMode
  {
  }
  deriving (Eq)

instance Show ActivateStoryStealthMode where
  show ActivateStoryStealthMode =
    "ActivateStoryStealthMode"
      ++ U.cc
        []

instance T.ToJSON ActivateStoryStealthMode where
  toJSON ActivateStoryStealthMode =
    A.object
      [ "@type" A..= T.String "activateStoryStealthMode"
      ]
