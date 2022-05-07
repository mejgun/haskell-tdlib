{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Point where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Point = -- | A point on a Cartesian plane @x The point's first coordinate @y The point's second coordinate
  Point
  { -- |
    y :: Maybe Float,
    -- |
    x :: Maybe Float
  }
  deriving (Eq)

instance Show Point where
  show
    Point
      { y = y,
        x = x
      } =
      "Point"
        ++ U.cc
          [ U.p "y" y,
            U.p "x" x
          ]

instance T.FromJSON Point where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "point" -> parsePoint v
      _ -> mempty
    where
      parsePoint :: A.Value -> T.Parser Point
      parsePoint = A.withObject "Point" $ \o -> do
        y_ <- o A..:? "y"
        x_ <- o A..:? "x"
        return $ Point {y = y_, x = x_}
  parseJSON _ = mempty

instance T.ToJSON Point where
  toJSON
    Point
      { y = y,
        x = x
      } =
      A.object
        [ "@type" A..= T.String "point",
          "y" A..= y,
          "x" A..= x
        ]
