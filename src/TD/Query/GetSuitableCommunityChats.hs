module TD.Query.GetSuitableCommunityChats
  (GetSuitableCommunityChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of supergroup and channel chats owned by the current user, which can be added to a community. Returns 'TD.Data.Chats.Chats'
data GetSuitableCommunityChats
  = GetSuitableCommunityChats
  deriving (Eq, Show)

instance I.ShortShow GetSuitableCommunityChats where
  shortShow
    GetSuitableCommunityChats
        = "GetSuitableCommunityChats"

instance AT.ToJSON GetSuitableCommunityChats where
  toJSON
    GetSuitableCommunityChats
        = A.object
          [ "@type" A..= AT.String "getSuitableCommunityChats"
          ]

