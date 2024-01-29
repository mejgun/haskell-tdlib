module TD.Query.GetPinnedSavedMessagesTopics
  (GetPinnedSavedMessagesTopics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns list of all pinned Saved Messages topics. Returns 'TD.Data.FoundSavedMessagesTopics.FoundSavedMessagesTopics'
data GetPinnedSavedMessagesTopics
  = GetPinnedSavedMessagesTopics
  deriving (Eq, Show)

instance I.ShortShow GetPinnedSavedMessagesTopics where
  shortShow
    GetPinnedSavedMessagesTopics
        = "GetPinnedSavedMessagesTopics"

instance AT.ToJSON GetPinnedSavedMessagesTopics where
  toJSON
    GetPinnedSavedMessagesTopics
        = A.object
          [ "@type" A..= AT.String "getPinnedSavedMessagesTopics"
          ]

