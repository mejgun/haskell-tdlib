module TD.Query.GetForumTopicDefaultIcons
  (GetForumTopicDefaultIcons(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of custom emoji, which can be used as forum topic icon by all users. Returns 'TD.Data.Stickers.Stickers'
data GetForumTopicDefaultIcons
  = GetForumTopicDefaultIcons
  deriving (Eq, Show)

instance I.ShortShow GetForumTopicDefaultIcons where
  shortShow
    GetForumTopicDefaultIcons
        = "GetForumTopicDefaultIcons"

instance AT.ToJSON GetForumTopicDefaultIcons where
  toJSON
    GetForumTopicDefaultIcons
        = A.object
          [ "@type" A..= AT.String "getForumTopicDefaultIcons"
          ]

