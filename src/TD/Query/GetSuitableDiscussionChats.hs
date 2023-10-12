module TD.Query.GetSuitableDiscussionChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetSuitableDiscussionChats -- ^ Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Returned basic group chats must be first upgraded to supergroups before they can be set as a discussion group. To set a returned supergroup as a discussion group, access to its old messages must be enabled using toggleSupergroupIsAllHistoryAvailable first
  = GetSuitableDiscussionChats
  deriving (Eq)

instance Show GetSuitableDiscussionChats where
  show
    GetSuitableDiscussionChats
        = "GetSuitableDiscussionChats"

instance AT.ToJSON GetSuitableDiscussionChats where
  toJSON
    GetSuitableDiscussionChats
        = A.object
          [ "@type" A..= AT.String "getSuitableDiscussionChats"
          ]
