{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TestVectorIntObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TestInt as TestInt
import qualified Utils as U

-- |
data TestVectorIntObject = -- | A simple object containing a vector of objects that hold a number; for testing only @value Vector of objects
  TestVectorIntObject
  { -- |
    value :: Maybe [TestInt.TestInt]
  }
  deriving (Eq)

instance Show TestVectorIntObject where
  show
    TestVectorIntObject
      { value = value_
      } =
      "TestVectorIntObject"
        ++ U.cc
          [ U.p "value" value_
          ]

instance T.FromJSON TestVectorIntObject where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testVectorIntObject" -> parseTestVectorIntObject v
      _ -> mempty
    where
      parseTestVectorIntObject :: A.Value -> T.Parser TestVectorIntObject
      parseTestVectorIntObject = A.withObject "TestVectorIntObject" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestVectorIntObject {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestVectorIntObject where
  toJSON
    TestVectorIntObject
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "testVectorIntObject",
          "value" A..= value_
        ]
