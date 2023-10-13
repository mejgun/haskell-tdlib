module TD.Query.SearchChatsNearby
  (SearchChatsNearby(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location

data SearchChatsNearby -- ^ Returns a list of users and location-based supergroups nearby. The list of users nearby will be updated for 60 seconds after the request by the updates updateUsersNearby. The request must be sent again every 25 seconds with adjusted location to not miss new chats
  = SearchChatsNearby
    { location :: Maybe Location.Location -- ^ Current user location
    }
  deriving (Eq)

instance Show SearchChatsNearby where
  show
    SearchChatsNearby
      { location = location_
      }
        = "SearchChatsNearby"
          ++ I.cc
          [ "location" `I.p` location_
          ]

instance AT.ToJSON SearchChatsNearby where
  toJSON
    SearchChatsNearby
      { location = location_
      }
        = A.object
          [ "@type"    A..= AT.String "searchChatsNearby"
          , "location" A..= location_
          ]

