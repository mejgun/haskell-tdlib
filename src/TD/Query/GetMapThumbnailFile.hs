{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMapThumbnailFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Location as Location
import qualified Utils as U

-- |
-- Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded @location Location of the map center @zoom Map zoom level; 13-20 @width Map width in pixels before applying scale; 16-1024 @height Map height in pixels before applying scale; 16-1024 @scale Map scale; 1-3 @chat_id Identifier of a chat in which the thumbnail will be shown. Use 0 if unknown
data GetMapThumbnailFile = GetMapThumbnailFile
  { -- |
    chat_id :: Maybe Int,
    -- |
    scale :: Maybe Int,
    -- |
    height :: Maybe Int,
    -- |
    width :: Maybe Int,
    -- |
    zoom :: Maybe Int,
    -- |
    location :: Maybe Location.Location
  }
  deriving (Eq)

instance Show GetMapThumbnailFile where
  show
    GetMapThumbnailFile
      { chat_id = chat_id,
        scale = scale,
        height = height,
        width = width,
        zoom = zoom,
        location = location
      } =
      "GetMapThumbnailFile"
        ++ U.cc
          [ U.p "chat_id" chat_id,
            U.p "scale" scale,
            U.p "height" height,
            U.p "width" width,
            U.p "zoom" zoom,
            U.p "location" location
          ]

instance T.ToJSON GetMapThumbnailFile where
  toJSON
    GetMapThumbnailFile
      { chat_id = chat_id,
        scale = scale,
        height = height,
        width = width,
        zoom = zoom,
        location = location
      } =
      A.object
        [ "@type" A..= T.String "getMapThumbnailFile",
          "chat_id" A..= chat_id,
          "scale" A..= scale,
          "height" A..= height,
          "width" A..= width,
          "zoom" A..= zoom,
          "location" A..= location
        ]
