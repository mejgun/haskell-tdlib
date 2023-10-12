module TD.Query.GetForumTopicDefaultIcons where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetForumTopicDefaultIcons -- ^ Returns list of custom emojis, which can be used as forum topic icon by all users
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
