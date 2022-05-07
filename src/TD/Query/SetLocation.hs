{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Location as Location
import qualified Utils as U

-- |
-- Changes the location of the current user. Needs to be called if GetOption("is_location_visible") is true and location changes for more than 1 kilometer @location The new location of the user
data SetLocation = SetLocation
  { -- |
    location :: Maybe Location.Location
  }
  deriving (Eq)

instance Show SetLocation where
  show
    SetLocation
      { location = location
      } =
      "SetLocation"
        ++ U.cc
          [ U.p "location" location
          ]

instance T.ToJSON SetLocation where
  toJSON
    SetLocation
      { location = location
      } =
      A.object
        [ "@type" A..= T.String "setLocation",
          "location" A..= location
        ]
