{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.VectorPathCommand where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Point as Point
import qualified Utils as U

-- | Represents a vector path command
data VectorPathCommand
  = -- | A straight line to a given point @end_point The end point of the straight line
    VectorPathCommandLine
      { -- |
        end_point :: Maybe Point.Point
      }
  | -- | A cubic Bézier curve to a given point @start_control_point The start control point of the curve @end_control_point The end control point of the curve @end_point The end point of the curve
    VectorPathCommandCubicBezierCurve
      { -- |
        end_point :: Maybe Point.Point,
        -- |
        end_control_point :: Maybe Point.Point,
        -- |
        start_control_point :: Maybe Point.Point
      }
  deriving (Eq)

instance Show VectorPathCommand where
  show
    VectorPathCommandLine
      { end_point = end_point_
      } =
      "VectorPathCommandLine"
        ++ U.cc
          [ U.p "end_point" end_point_
          ]
  show
    VectorPathCommandCubicBezierCurve
      { end_point = end_point_,
        end_control_point = end_control_point_,
        start_control_point = start_control_point_
      } =
      "VectorPathCommandCubicBezierCurve"
        ++ U.cc
          [ U.p "end_point" end_point_,
            U.p "end_control_point" end_control_point_,
            U.p "start_control_point" start_control_point_
          ]

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
        end_point_ <- o A..:? "end_point"
        return $ VectorPathCommandLine {end_point = end_point_}

      parseVectorPathCommandCubicBezierCurve :: A.Value -> T.Parser VectorPathCommand
      parseVectorPathCommandCubicBezierCurve = A.withObject "VectorPathCommandCubicBezierCurve" $ \o -> do
        end_point_ <- o A..:? "end_point"
        end_control_point_ <- o A..:? "end_control_point"
        start_control_point_ <- o A..:? "start_control_point"
        return $ VectorPathCommandCubicBezierCurve {end_point = end_point_, end_control_point = end_control_point_, start_control_point = start_control_point_}
  parseJSON _ = mempty

instance T.ToJSON VectorPathCommand where
  toJSON
    VectorPathCommandLine
      { end_point = end_point_
      } =
      A.object
        [ "@type" A..= T.String "vectorPathCommandLine",
          "end_point" A..= end_point_
        ]
  toJSON
    VectorPathCommandCubicBezierCurve
      { end_point = end_point_,
        end_control_point = end_control_point_,
        start_control_point = start_control_point_
      } =
      A.object
        [ "@type" A..= T.String "vectorPathCommandCubicBezierCurve",
          "end_point" A..= end_point_,
          "end_control_point" A..= end_control_point_,
          "start_control_point" A..= start_control_point_
        ]
