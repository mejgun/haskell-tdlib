module TD.Data.Point
  ( Point(..)    
  , defaultPoint 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Point
  = Point -- ^ A point on a Cartesian plane
    { x :: Maybe Double -- ^ The point's first coordinate
    , y :: Maybe Double -- ^ The point's second coordinate
    }
  deriving (Eq)

instance Show Point where
  show Point
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

instance AT.ToJSON Point where
  toJSON Point
    { x = x_
    , y = y_
    }
      = A.object
        [ "@type" A..= AT.String "point"
        , "x"     A..= x_
        , "y"     A..= y_
        ]

defaultPoint :: Point
defaultPoint =
  Point
    { x = Nothing
    , y = Nothing
    }

