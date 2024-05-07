module TD.Query.GetRecommendedChats
  (GetRecommendedChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of channel chats recommended to the current user. Returns 'TD.Data.Chats.Chats'
data GetRecommendedChats
  = GetRecommendedChats
  deriving (Eq, Show)

instance I.ShortShow GetRecommendedChats where
  shortShow
    GetRecommendedChats
        = "GetRecommendedChats"

instance AT.ToJSON GetRecommendedChats where
  toJSON
    GetRecommendedChats
        = A.object
          [ "@type" A..= AT.String "getRecommendedChats"
          ]

