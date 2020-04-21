-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundFill where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data BackgroundFill = 
 BackgroundFillSolid { color :: Int }  
 | BackgroundFillGradient { rotation_angle :: Int, bottom_color :: Int, top_color :: Int }  deriving (Show)

instance T.ToJSON BackgroundFill where
 toJSON (BackgroundFillSolid { color = color }) =
  A.object [ "@type" A..= T.String "backgroundFillSolid", "color" A..= color ]

 toJSON (BackgroundFillGradient { rotation_angle = rotation_angle, bottom_color = bottom_color, top_color = top_color }) =
  A.object [ "@type" A..= T.String "backgroundFillGradient", "rotation_angle" A..= rotation_angle, "bottom_color" A..= bottom_color, "top_color" A..= top_color ]

instance T.FromJSON BackgroundFill where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "backgroundFillSolid" -> parseBackgroundFillSolid v
   "backgroundFillGradient" -> parseBackgroundFillGradient v
   _ -> mempty
  where
   parseBackgroundFillSolid :: A.Value -> T.Parser BackgroundFill
   parseBackgroundFillSolid = A.withObject "BackgroundFillSolid" $ \o -> do
    color <- o A..: "color"
    return $ BackgroundFillSolid { color = color }

   parseBackgroundFillGradient :: A.Value -> T.Parser BackgroundFill
   parseBackgroundFillGradient = A.withObject "BackgroundFillGradient" $ \o -> do
    rotation_angle <- o A..: "rotation_angle"
    bottom_color <- o A..: "bottom_color"
    top_color <- o A..: "top_color"
    return $ BackgroundFillGradient { rotation_angle = rotation_angle, bottom_color = bottom_color, top_color = top_color }