module TD.Data.VideoStoryboard
  (VideoStoryboard(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File

data VideoStoryboard
  = VideoStoryboard -- ^ Describes a storyboard for a video
    { storyboard_file :: Maybe File.File -- ^ A JPEG file that contains tiled previews of video
    , width           :: Maybe Int       -- ^ Width of a tile
    , height          :: Maybe Int       -- ^ Height of a tile
    , map_file        :: Maybe File.File -- ^ File that describes mapping of position in the video to a tile in the JPEG file
    }
  deriving (Eq, Show)

instance I.ShortShow VideoStoryboard where
  shortShow VideoStoryboard
    { storyboard_file = storyboard_file_
    , width           = width_
    , height          = height_
    , map_file        = map_file_
    }
      = "VideoStoryboard"
        ++ I.cc
        [ "storyboard_file" `I.p` storyboard_file_
        , "width"           `I.p` width_
        , "height"          `I.p` height_
        , "map_file"        `I.p` map_file_
        ]

instance AT.FromJSON VideoStoryboard where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "videoStoryboard" -> parseVideoStoryboard v
      _                 -> mempty
    
    where
      parseVideoStoryboard :: A.Value -> AT.Parser VideoStoryboard
      parseVideoStoryboard = A.withObject "VideoStoryboard" $ \o -> do
        storyboard_file_ <- o A..:?  "storyboard_file"
        width_           <- o A..:?  "width"
        height_          <- o A..:?  "height"
        map_file_        <- o A..:?  "map_file"
        pure $ VideoStoryboard
          { storyboard_file = storyboard_file_
          , width           = width_
          , height          = height_
          , map_file        = map_file_
          }
  parseJSON _ = mempty

