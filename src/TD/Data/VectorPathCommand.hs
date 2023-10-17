module TD.Data.VectorPathCommand
  (VectorPathCommand(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Point as Point

-- | Represents a vector path command
data VectorPathCommand
  = VectorPathCommandLine -- ^ A straight line to a given point
    { end_point :: Maybe Point.Point -- ^ The end point of the straight line
    }
  | VectorPathCommandCubicBezierCurve -- ^ A cubic Bézier curve to a given point
    { start_control_point :: Maybe Point.Point -- ^ The start control point of the curve
    , end_control_point   :: Maybe Point.Point -- ^ The end control point of the curve
    , end_point           :: Maybe Point.Point -- ^ The end point of the curve
    }
  deriving (Eq, Show)

instance I.ShortShow VectorPathCommand where
  shortShow VectorPathCommandLine
    { end_point = end_point_
    }
      = "VectorPathCommandLine"
        ++ I.cc
        [ "end_point" `I.p` end_point_
        ]
  shortShow VectorPathCommandCubicBezierCurve
    { start_control_point = start_control_point_
    , end_control_point   = end_control_point_
    , end_point           = end_point_
    }
      = "VectorPathCommandCubicBezierCurve"
        ++ I.cc
        [ "start_control_point" `I.p` start_control_point_
        , "end_control_point"   `I.p` end_control_point_
        , "end_point"           `I.p` end_point_
        ]

instance AT.FromJSON VectorPathCommand where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "vectorPathCommandLine"             -> parseVectorPathCommandLine v
      "vectorPathCommandCubicBezierCurve" -> parseVectorPathCommandCubicBezierCurve v
      _                                   -> mempty
    
    where
      parseVectorPathCommandLine :: A.Value -> AT.Parser VectorPathCommand
      parseVectorPathCommandLine = A.withObject "VectorPathCommandLine" $ \o -> do
        end_point_ <- o A..:?  "end_point"
        pure $ VectorPathCommandLine
          { end_point = end_point_
          }
      parseVectorPathCommandCubicBezierCurve :: A.Value -> AT.Parser VectorPathCommand
      parseVectorPathCommandCubicBezierCurve = A.withObject "VectorPathCommandCubicBezierCurve" $ \o -> do
        start_control_point_ <- o A..:?  "start_control_point"
        end_control_point_   <- o A..:?  "end_control_point"
        end_point_           <- o A..:?  "end_point"
        pure $ VectorPathCommandCubicBezierCurve
          { start_control_point = start_control_point_
          , end_control_point   = end_control_point_
          , end_point           = end_point_
          }
  parseJSON _ = mempty

