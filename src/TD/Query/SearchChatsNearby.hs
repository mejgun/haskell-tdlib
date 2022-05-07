{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchChatsNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified Utils as U

-- |
-- Returns a list of users and location-based supergroups nearby. The list of users nearby will be updated for 60 seconds after the request by the updates updateUsersNearby. The request must be sent again every 25 seconds with adjusted location to not miss new chats @location Current user location
data SearchChatsNearby = SearchChatsNearby
  { -- |
    location :: Maybe Location.Location
  }
  deriving (Eq)

instance Show SearchChatsNearby where
  show
    SearchChatsNearby
      { location = location
      } =
      "SearchChatsNearby"
        ++ U.cc
          [ U.p "location" location
          ]

instance T.ToJSON SearchChatsNearby where
  toJSON
    SearchChatsNearby
      { location = location
      } =
      A.object
        [ "@type" A..= T.String "searchChatsNearby",
          "location" A..= location
        ]
