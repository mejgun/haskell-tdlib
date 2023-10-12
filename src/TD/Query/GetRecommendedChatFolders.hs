module TD.Query.GetRecommendedChatFolders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetRecommendedChatFolders -- ^ Returns recommended chat folders for the current user
  = GetRecommendedChatFolders
  deriving (Eq)

instance Show GetRecommendedChatFolders where
  show
    GetRecommendedChatFolders
        = "GetRecommendedChatFolders"

instance AT.ToJSON GetRecommendedChatFolders where
  toJSON
    GetRecommendedChatFolders
        = A.object
          [ "@type" A..= AT.String "getRecommendedChatFolders"
          ]
