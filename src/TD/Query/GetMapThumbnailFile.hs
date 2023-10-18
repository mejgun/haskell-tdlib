module TD.Query.GetMapThumbnailFile
  (GetMapThumbnailFile(..)
  , defaultGetMapThumbnailFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location

-- | Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded. Returns 'TD.Data.File.File'
data GetMapThumbnailFile
  = GetMapThumbnailFile
    { location :: Maybe Location.Location -- ^ Location of the map center
    , zoom     :: Maybe Int               -- ^ Map zoom level; 13-20
    , width    :: Maybe Int               -- ^ Map width in pixels before applying scale; 16-1024
    , height   :: Maybe Int               -- ^ Map height in pixels before applying scale; 16-1024
    , scale    :: Maybe Int               -- ^ Map scale; 1-3
    , chat_id  :: Maybe Int               -- ^ Identifier of a chat in which the thumbnail will be shown. Use 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow GetMapThumbnailFile where
  shortShow
    GetMapThumbnailFile
      { location = location_
      , zoom     = zoom_
      , width    = width_
      , height   = height_
      , scale    = scale_
      , chat_id  = chat_id_
      }
        = "GetMapThumbnailFile"
          ++ I.cc
          [ "location" `I.p` location_
          , "zoom"     `I.p` zoom_
          , "width"    `I.p` width_
          , "height"   `I.p` height_
          , "scale"    `I.p` scale_
          , "chat_id"  `I.p` chat_id_
          ]

instance AT.ToJSON GetMapThumbnailFile where
  toJSON
    GetMapThumbnailFile
      { location = location_
      , zoom     = zoom_
      , width    = width_
      , height   = height_
      , scale    = scale_
      , chat_id  = chat_id_
      }
        = A.object
          [ "@type"    A..= AT.String "getMapThumbnailFile"
          , "location" A..= location_
          , "zoom"     A..= zoom_
          , "width"    A..= width_
          , "height"   A..= height_
          , "scale"    A..= scale_
          , "chat_id"  A..= chat_id_
          ]

defaultGetMapThumbnailFile :: GetMapThumbnailFile
defaultGetMapThumbnailFile =
  GetMapThumbnailFile
    { location = Nothing
    , zoom     = Nothing
    , width    = Nothing
    , height   = Nothing
    , scale    = Nothing
    , chat_id  = Nothing
    }

