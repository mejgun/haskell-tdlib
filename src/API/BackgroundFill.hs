-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundFill where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a fill of a background
data BackgroundFill = 
 BackgroundFillSolid { color :: Maybe Int }  
 | BackgroundFillGradient { rotation_angle :: Maybe Int, bottom_color :: Maybe Int, top_color :: Maybe Int }  deriving (Show, Eq)

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
    color <- mconcat [ o A..:? "color", readMaybe <$> (o A..: "color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BackgroundFillSolid { color = color }

   parseBackgroundFillGradient :: A.Value -> T.Parser BackgroundFill
   parseBackgroundFillGradient = A.withObject "BackgroundFillGradient" $ \o -> do
    rotation_angle <- mconcat [ o A..:? "rotation_angle", readMaybe <$> (o A..: "rotation_angle" :: T.Parser String)] :: T.Parser (Maybe Int)
    bottom_color <- mconcat [ o A..:? "bottom_color", readMaybe <$> (o A..: "bottom_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    top_color <- mconcat [ o A..:? "top_color", readMaybe <$> (o A..: "top_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BackgroundFillGradient { rotation_angle = rotation_angle, bottom_color = bottom_color, top_color = top_color }