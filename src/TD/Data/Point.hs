module TD.Data.Point
  (Point(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Point
  = Point -- ^ A point on a Cartesian plane
    { x :: Maybe Double -- ^ The point's first coordinate
    , y :: Maybe Double -- ^ The point's second coordinate
    }
  deriving (Eq, Show)

instance I.ShortShow Point where
  shortShow Point
    { x = x_
    , y = y_
    }
      = "Point"
        ++ I.cc
        [ "x" `I.p` x_
        , "y" `I.p` y_
        ]

instance AT.FromJSON Point where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "point" -> parsePoint v
      _       -> mempty
    
    where
      parsePoint :: A.Value -> AT.Parser Point
      parsePoint = A.withObject "Point" $ \o -> do
        x_ <- o A..:?  "x"
        y_ <- o A..:?  "y"
        pure $ Point
          { x = x_
          , y = y_
          }
  parseJSON _ = mempty

