module TD.Query.SearchChatsNearby
  (SearchChatsNearby(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location

-- | Returns a list of users and location-based supergroups nearby. The method was disabled and returns an empty list of chats now. Returns 'TD.Data.ChatsNearby.ChatsNearby'
data SearchChatsNearby
  = SearchChatsNearby
    { location :: Maybe Location.Location -- ^ Current user location
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChatsNearby where
  shortShow
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

