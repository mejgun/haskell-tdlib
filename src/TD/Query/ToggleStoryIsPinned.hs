module TD.Query.ToggleStoryIsPinned
  (ToggleStoryIsPinned(..)
  , defaultToggleStoryIsPinned
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a story is accessible after expiration
data ToggleStoryIsPinned
  = ToggleStoryIsPinned
    { story_id  :: Maybe Int  -- ^ Identifier of the story
    , is_pinned :: Maybe Bool -- ^ Pass true to make the story accessible after expiration; pass false to make it private
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleStoryIsPinned where
  shortShow
    ToggleStoryIsPinned
      { story_id  = story_id_
      , is_pinned = is_pinned_
      }
        = "ToggleStoryIsPinned"
          ++ I.cc
          [ "story_id"  `I.p` story_id_
          , "is_pinned" `I.p` is_pinned_
          ]

instance AT.ToJSON ToggleStoryIsPinned where
  toJSON
    ToggleStoryIsPinned
      { story_id  = story_id_
      , is_pinned = is_pinned_
      }
        = A.object
          [ "@type"     A..= AT.String "toggleStoryIsPinned"
          , "story_id"  A..= story_id_
          , "is_pinned" A..= is_pinned_
          ]

defaultToggleStoryIsPinned :: ToggleStoryIsPinned
defaultToggleStoryIsPinned =
  ToggleStoryIsPinned
    { story_id  = Nothing
    , is_pinned = Nothing
    }

