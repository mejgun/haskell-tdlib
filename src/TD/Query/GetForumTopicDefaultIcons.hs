module TD.Query.GetForumTopicDefaultIcons
  (GetForumTopicDefaultIcons(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns list of custom emojis, which can be used as forum topic icon by all users
data GetForumTopicDefaultIcons
  = GetForumTopicDefaultIcons
  deriving (Eq)

instance Show GetForumTopicDefaultIcons where
  show
    GetForumTopicDefaultIcons
        = "GetForumTopicDefaultIcons"

instance AT.ToJSON GetForumTopicDefaultIcons where
  toJSON
    GetForumTopicDefaultIcons
        = A.object
          [ "@type" A..= AT.String "getForumTopicDefaultIcons"
          ]

