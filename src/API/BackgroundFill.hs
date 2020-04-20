-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundFill where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data BackgroundFill = 
 BackgroundFillSolid { color :: Int }  
 | BackgroundFillGradient { rotation_angle :: Int, bottom_color :: Int, top_color :: Int }  -- deriving (Show)

instance T.ToJSON BackgroundFill where
 toJSON (BackgroundFillSolid { color = color }) =
  A.object [ "@type" A..= T.String "backgroundFillSolid", "color" A..= color ]

 toJSON (BackgroundFillGradient { rotation_angle = rotation_angle, bottom_color = bottom_color, top_color = top_color }) =
  A.object [ "@type" A..= T.String "backgroundFillGradient", "rotation_angle" A..= rotation_angle, "bottom_color" A..= bottom_color, "top_color" A..= top_color ]
-- backgroundFillSolid BackgroundFill  { color :: Int } 

-- backgroundFillGradient BackgroundFill  { rotation_angle :: Int, bottom_color :: Int, top_color :: Int } 

