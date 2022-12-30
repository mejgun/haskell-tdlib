{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMapThumbnailFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified Utils as U

-- |
-- Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded
data GetMapThumbnailFile = GetMapThumbnailFile
  { -- | Identifier of a chat in which the thumbnail will be shown. Use 0 if unknown
    chat_id :: Maybe Int,
    -- | Map scale; 1-3
    scale :: Maybe Int,
    -- | Map height in pixels before applying scale; 16-1024
    height :: Maybe Int,
    -- | Map width in pixels before applying scale; 16-1024
    width :: Maybe Int,
    -- | Map zoom level; 13-20
    zoom :: Maybe Int,
    -- | Location of the map center
    location :: Maybe Location.Location
  }
  deriving (Eq)

instance Show GetMapThumbnailFile where
  show
    GetMapThumbnailFile
      { chat_id = chat_id_,
        scale = scale_,
        height = height_,
        width = width_,
        zoom = zoom_,
        location = location_
      } =
      "GetMapThumbnailFile"
        ++ U.cc
          [ U.p "chat_id" chat_id_,
            U.p "scale" scale_,
            U.p "height" height_,
            U.p "width" width_,
            U.p "zoom" zoom_,
            U.p "location" location_
          ]

instance T.ToJSON GetMapThumbnailFile where
  toJSON
    GetMapThumbnailFile
      { chat_id = chat_id_,
        scale = scale_,
        height = height_,
        width = width_,
        zoom = zoom_,
        location = location_
      } =
      A.object
        [ "@type" A..= T.String "getMapThumbnailFile",
          "chat_id" A..= chat_id_,
          "scale" A..= scale_,
          "height" A..= height_,
          "width" A..= width_,
          "zoom" A..= zoom_,
          "location" A..= location_
        ]
