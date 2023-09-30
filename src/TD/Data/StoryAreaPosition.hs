{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryAreaPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data StoryAreaPosition = -- | Describes position of a clickable rectangle area on a story media
  StoryAreaPosition
  { -- | Clockwise rotation angle of the rectangle, in degrees; 0-360
    rotation_angle :: Maybe Float,
    -- | The ordinate of the rectangle's center, as a percentage of the media height
    height_percentage :: Maybe Float,
    -- | The width of the rectangle, as a percentage of the media width
    width_percentage :: Maybe Float,
    -- | The ordinate of the rectangle's center, as a percentage of the media height
    y_percentage :: Maybe Float,
    -- | The abscissa of the rectangle's center, as a percentage of the media width
    x_percentage :: Maybe Float
  }
  deriving (Eq)

instance Show StoryAreaPosition where
  show
    StoryAreaPosition
      { rotation_angle = rotation_angle_,
        height_percentage = height_percentage_,
        width_percentage = width_percentage_,
        y_percentage = y_percentage_,
        x_percentage = x_percentage_
      } =
      "StoryAreaPosition"
        ++ U.cc
          [ U.p "rotation_angle" rotation_angle_,
            U.p "height_percentage" height_percentage_,
            U.p "width_percentage" width_percentage_,
            U.p "y_percentage" y_percentage_,
            U.p "x_percentage" x_percentage_
          ]

instance T.FromJSON StoryAreaPosition where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyAreaPosition" -> parseStoryAreaPosition v
      _ -> mempty
    where
      parseStoryAreaPosition :: A.Value -> T.Parser StoryAreaPosition
      parseStoryAreaPosition = A.withObject "StoryAreaPosition" $ \o -> do
        rotation_angle_ <- o A..:? "rotation_angle"
        height_percentage_ <- o A..:? "height_percentage"
        width_percentage_ <- o A..:? "width_percentage"
        y_percentage_ <- o A..:? "y_percentage"
        x_percentage_ <- o A..:? "x_percentage"
        return $ StoryAreaPosition {rotation_angle = rotation_angle_, height_percentage = height_percentage_, width_percentage = width_percentage_, y_percentage = y_percentage_, x_percentage = x_percentage_}
  parseJSON _ = mempty

instance T.ToJSON StoryAreaPosition where
  toJSON
    StoryAreaPosition
      { rotation_angle = rotation_angle_,
        height_percentage = height_percentage_,
        width_percentage = width_percentage_,
        y_percentage = y_percentage_,
        x_percentage = x_percentage_
      } =
      A.object
        [ "@type" A..= T.String "storyAreaPosition",
          "rotation_angle" A..= rotation_angle_,
          "height_percentage" A..= height_percentage_,
          "width_percentage" A..= width_percentage_,
          "y_percentage" A..= y_percentage_,
          "x_percentage" A..= x_percentage_
        ]
