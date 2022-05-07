{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.VectorPathCommand where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Point as Point
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
      { end_point = end_point
      } =
      "VectorPathCommandLine"
        ++ U.cc
          [ U.p "end_point" end_point
          ]
  show
    VectorPathCommandCubicBezierCurve
      { end_point = end_point,
        end_control_point = end_control_point,
        start_control_point = start_control_point
      } =
      "VectorPathCommandCubicBezierCurve"
        ++ U.cc
          [ U.p "end_point" end_point,
            U.p "end_control_point" end_control_point,
            U.p "start_control_point" start_control_point
          ]

instance T.FromJSON VectorPathCommand where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "vectorPathCommandLine" -> parseVectorPathCommandLine v
      "vectorPathCommandCubicBezierCurve" -> parseVectorPathCommandCubicBezierCurve v
      _ -> fail ""
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
  parseJSON _ = fail ""

instance T.ToJSON VectorPathCommand where
  toJSON
    VectorPathCommandLine
      { end_point = end_point
      } =
      A.object
        [ "@type" A..= T.String "vectorPathCommandLine",
          "end_point" A..= end_point
        ]
  toJSON
    VectorPathCommandCubicBezierCurve
      { end_point = end_point,
        end_control_point = end_control_point,
        start_control_point = start_control_point
      } =
      A.object
        [ "@type" A..= T.String "vectorPathCommandCubicBezierCurve",
          "end_point" A..= end_point,
          "end_control_point" A..= end_control_point,
          "start_control_point" A..= start_control_point
        ]
