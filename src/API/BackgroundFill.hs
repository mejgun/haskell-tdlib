-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundFill where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes a fill of a background
data BackgroundFill = 
 -- |
 -- 
 -- Describes a solid fill of a background 
 -- 
 -- __color__ A color of the background in the RGB24 format
 BackgroundFillSolid { color :: Maybe Int }  |
 -- |
 -- 
 -- Describes a gradient fill of a background 
 -- 
 -- __top_color__ A top color of the background in the RGB24 format
 -- 
 -- __bottom_color__ A bottom color of the background in the RGB24 format
 -- 
 -- __rotation_angle__ Clockwise rotation angle of the gradient, in degrees; 0-359. Must be always divisible by 45
 BackgroundFillGradient { rotation_angle :: Maybe Int, bottom_color :: Maybe Int, top_color :: Maybe Int }  |
 -- |
 -- 
 -- Describes a freeform gradient fill of a background 
 -- 
 -- __colors__ A list of 3 or 4 colors of the freeform gradients in the RGB24 format
 BackgroundFillFreeformGradient { colors :: Maybe [Int] }  deriving (Eq)

instance Show BackgroundFill where
 show BackgroundFillSolid { color=color } =
  "BackgroundFillSolid" ++ U.cc [U.p "color" color ]

 show BackgroundFillGradient { rotation_angle=rotation_angle, bottom_color=bottom_color, top_color=top_color } =
  "BackgroundFillGradient" ++ U.cc [U.p "rotation_angle" rotation_angle, U.p "bottom_color" bottom_color, U.p "top_color" top_color ]

 show BackgroundFillFreeformGradient { colors=colors } =
  "BackgroundFillFreeformGradient" ++ U.cc [U.p "colors" colors ]

instance T.ToJSON BackgroundFill where
 toJSON BackgroundFillSolid { color = color } =
  A.object [ "@type" A..= T.String "backgroundFillSolid", "color" A..= color ]

 toJSON BackgroundFillGradient { rotation_angle = rotation_angle, bottom_color = bottom_color, top_color = top_color } =
  A.object [ "@type" A..= T.String "backgroundFillGradient", "rotation_angle" A..= rotation_angle, "bottom_color" A..= bottom_color, "top_color" A..= top_color ]

 toJSON BackgroundFillFreeformGradient { colors = colors } =
  A.object [ "@type" A..= T.String "backgroundFillFreeformGradient", "colors" A..= colors ]

instance T.FromJSON BackgroundFill where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "backgroundFillSolid" -> parseBackgroundFillSolid v
   "backgroundFillGradient" -> parseBackgroundFillGradient v
   "backgroundFillFreeformGradient" -> parseBackgroundFillFreeformGradient v
   _ -> mempty
  where
   parseBackgroundFillSolid :: A.Value -> T.Parser BackgroundFill
   parseBackgroundFillSolid = A.withObject "BackgroundFillSolid" $ \o -> do
    color <- mconcat [ o A..:? "color", readMaybe <$> (o A..: "color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BackgroundFillSolid { color = color }

   parseBackgroundFillGradient :: A.Value -> T.Parser BackgroundFill
   parseBackgroundFillGradient = A.withObject "BackgroundFillGradient" $ \o -> do
    rotation_angle <- mconcat [ o A..:? "rotation_angle", readMaybe <$> (o A..: "rotation_angle" :: T.Parser String)] :: T.Parser (Maybe Int)
    bottom_color <- mconcat [ o A..:? "bottom_color", readMaybe <$> (o A..: "bottom_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    top_color <- mconcat [ o A..:? "top_color", readMaybe <$> (o A..: "top_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BackgroundFillGradient { rotation_angle = rotation_angle, bottom_color = bottom_color, top_color = top_color }

   parseBackgroundFillFreeformGradient :: A.Value -> T.Parser BackgroundFill
   parseBackgroundFillFreeformGradient = A.withObject "BackgroundFillFreeformGradient" $ \o -> do
    colors <- o A..:? "colors"
    return $ BackgroundFillFreeformGradient { colors = colors }
 parseJSON _ = mempty
