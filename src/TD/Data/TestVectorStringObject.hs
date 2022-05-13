{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TestVectorStringObject where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TestString as TestString
import qualified Utils as U

data TestVectorStringObject = -- | A simple object containing a vector of objects that hold a string; for testing only @value Vector of objects
  TestVectorStringObject
  { -- |
    value :: Maybe [TestString.TestString]
  }
  deriving (Eq)

instance Show TestVectorStringObject where
  show
    TestVectorStringObject
      { value = value_
      } =
      "TestVectorStringObject"
        ++ U.cc
          [ U.p "value" value_
          ]

instance T.FromJSON TestVectorStringObject where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testVectorStringObject" -> parseTestVectorStringObject v
      _ -> mempty
    where
      parseTestVectorStringObject :: A.Value -> T.Parser TestVectorStringObject
      parseTestVectorStringObject = A.withObject "TestVectorStringObject" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestVectorStringObject {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestVectorStringObject where
  toJSON
    TestVectorStringObject
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "testVectorStringObject",
          "value" A..= value_
        ]
