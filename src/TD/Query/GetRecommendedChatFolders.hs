module TD.Query.GetRecommendedChatFolders
  (GetRecommendedChatFolders(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns recommended chat folders for the current user. Returns 'TD.Data.RecommendedChatFolders.RecommendedChatFolders'
data GetRecommendedChatFolders
  = GetRecommendedChatFolders
  deriving (Eq, Show)

instance I.ShortShow GetRecommendedChatFolders where
  shortShow
    GetRecommendedChatFolders
        = "GetRecommendedChatFolders"

instance AT.ToJSON GetRecommendedChatFolders where
  toJSON
    GetRecommendedChatFolders
        = A.object
          [ "@type" A..= AT.String "getRecommendedChatFolders"
          ]

