{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TestVectorInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data TestVectorInt = -- | A simple object containing a vector of numbers; for testing only @value Vector of numbers
  TestVectorInt
  { -- |
    value :: Maybe [Int]
  }
  deriving (Eq)

instance Show TestVectorInt where
  show
    TestVectorInt
      { value = value_
      } =
      "TestVectorInt"
        ++ U.cc
          [ U.p "value" value_
          ]

instance T.FromJSON TestVectorInt where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testVectorInt" -> parseTestVectorInt v
      _ -> mempty
    where
      parseTestVectorInt :: A.Value -> T.Parser TestVectorInt
      parseTestVectorInt = A.withObject "TestVectorInt" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestVectorInt {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestVectorInt where
  toJSON
    TestVectorInt
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "testVectorInt",
          "value" A..= value_
        ]
