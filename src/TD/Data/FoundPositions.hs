{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FoundPositions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data FoundPositions = -- | Contains 0-based positions of matched objects @total_count Total number of matched objects @positions The positions of the matched objects
  FoundPositions
  { -- |
    positions :: Maybe [Int],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show FoundPositions where
  show
    FoundPositions
      { positions = positions_,
        total_count = total_count_
      } =
      "FoundPositions"
        ++ U.cc
          [ U.p "positions" positions_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON FoundPositions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundPositions" -> parseFoundPositions v
      _ -> mempty
    where
      parseFoundPositions :: A.Value -> T.Parser FoundPositions
      parseFoundPositions = A.withObject "FoundPositions" $ \o -> do
        positions_ <- o A..:? "positions"
        total_count_ <- o A..:? "total_count"
        return $ FoundPositions {positions = positions_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON FoundPositions where
  toJSON
    FoundPositions
      { positions = positions_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "foundPositions",
          "positions" A..= positions_,
          "total_count" A..= total_count_
        ]
