{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Count where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Count = -- | Contains a counter @count Count
  Count
  { -- |
    count :: Maybe Int
  }
  deriving (Eq)

instance Show Count where
  show
    Count
      { count = count_
      } =
      "Count"
        ++ U.cc
          [ U.p "count" count_
          ]

instance T.FromJSON Count where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "count" -> parseCount v
      _ -> mempty
    where
      parseCount :: A.Value -> T.Parser Count
      parseCount = A.withObject "Count" $ \o -> do
        count_ <- mconcat [o A..:? "count", U.rm <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Count {count = count_}
  parseJSON _ = mempty

instance T.ToJSON Count where
  toJSON
    Count
      { count = count_
      } =
      A.object
        [ "@type" A..= T.String "count",
          "count" A..= count_
        ]
