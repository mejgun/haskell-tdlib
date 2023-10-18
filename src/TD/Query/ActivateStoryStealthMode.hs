module TD.Query.ActivateStoryStealthMode
  (ActivateStoryStealthMode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Activates stealth mode for stories, which hides all views of stories from the current user in the last "story_stealth_mode_past_period" seconds and for the next "story_stealth_mode_future_period" seconds; for Telegram Premium users only. Returns 'TD.Data.Ok.Ok'
data ActivateStoryStealthMode
  = ActivateStoryStealthMode
  deriving (Eq, Show)

instance I.ShortShow ActivateStoryStealthMode where
  shortShow
    ActivateStoryStealthMode
        = "ActivateStoryStealthMode"

instance AT.ToJSON ActivateStoryStealthMode where
  toJSON
    ActivateStoryStealthMode
        = A.object
          [ "@type" A..= AT.String "activateStoryStealthMode"
          ]

