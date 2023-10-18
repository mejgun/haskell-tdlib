module TD.Query.GetSuitableDiscussionChats
  (GetSuitableDiscussionChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Returned basic group chats must be first upgraded to supergroups before they can be set as a discussion group. To set a returned supergroup as a discussion group, access to its old messages must be enabled using toggleSupergroupIsAllHistoryAvailable first. Returns 'TD.Data.Chats.Chats'
data GetSuitableDiscussionChats
  = GetSuitableDiscussionChats
  deriving (Eq, Show)

instance I.ShortShow GetSuitableDiscussionChats where
  shortShow
    GetSuitableDiscussionChats
        = "GetSuitableDiscussionChats"

instance AT.ToJSON GetSuitableDiscussionChats where
  toJSON
    GetSuitableDiscussionChats
        = A.object
          [ "@type" A..= AT.String "getSuitableDiscussionChats"
          ]

