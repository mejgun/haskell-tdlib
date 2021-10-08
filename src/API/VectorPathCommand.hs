-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VectorPathCommand where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Point as Point

-- |
-- 
-- Represents a vector path command
data VectorPathCommand = 
 -- |
 -- 
 -- A straight line to a given point 
 -- 
 -- __end_point__ The end point of the straight line
 VectorPathCommandLine { end_point :: Maybe Point.Point }  |
 -- |
 -- 
 -- A cubic Bézier curve to a given point 
 -- 
 -- __start_control_point__ The start control point of the curve
 -- 
 -- __end_control_point__ The end control point of the curve
 -- 
 -- __end_point__ The end point of the curve
 VectorPathCommandCubicBezierCurve { end_point :: Maybe Point.Point, end_control_point :: Maybe Point.Point, start_control_point :: Maybe Point.Point }  deriving (Eq)

instance Show VectorPathCommand where
 show VectorPathCommandLine { end_point=end_point } =
  "VectorPathCommandLine" ++ cc [p "end_point" end_point ]

 show VectorPathCommandCubicBezierCurve { end_point=end_point, end_control_point=end_control_point, start_control_point=start_control_point } =
  "VectorPathCommandCubicBezierCurve" ++ cc [p "end_point" end_point, p "end_control_point" end_control_point, p "start_control_point" start_control_point ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON VectorPathCommand where
 toJSON VectorPathCommandLine { end_point = end_point } =
  A.object [ "@type" A..= T.String "vectorPathCommandLine", "end_point" A..= end_point ]

 toJSON VectorPathCommandCubicBezierCurve { end_point = end_point, end_control_point = end_control_point, start_control_point = start_control_point } =
  A.object [ "@type" A..= T.String "vectorPathCommandCubicBezierCurve", "end_point" A..= end_point, "end_control_point" A..= end_control_point, "start_control_point" A..= start_control_point ]

instance T.FromJSON VectorPathCommand where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "vectorPathCommandLine" -> parseVectorPathCommandLine v
   "vectorPathCommandCubicBezierCurve" -> parseVectorPathCommandCubicBezierCurve v
   _ -> mempty
  where
   parseVectorPathCommandLine :: A.Value -> T.Parser VectorPathCommand
   parseVectorPathCommandLine = A.withObject "VectorPathCommandLine" $ \o -> do
    end_point <- o A..:? "end_point"
    return $ VectorPathCommandLine { end_point = end_point }

   parseVectorPathCommandCubicBezierCurve :: A.Value -> T.Parser VectorPathCommand
   parseVectorPathCommandCubicBezierCurve = A.withObject "VectorPathCommandCubicBezierCurve" $ \o -> do
    end_point <- o A..:? "end_point"
    end_control_point <- o A..:? "end_control_point"
    start_control_point <- o A..:? "start_control_point"
    return $ VectorPathCommandCubicBezierCurve { end_point = end_point, end_control_point = end_control_point, start_control_point = start_control_point }
 parseJSON _ = mempty
