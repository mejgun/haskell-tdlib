{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TestInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data TestInt = -- | A simple object containing a number; for testing only @value Number
  TestInt
  { -- |
    value :: Maybe Int
  }
  deriving (Eq)

instance Show TestInt where
  show
    TestInt
      { value = value_
      } =
      "TestInt"
        ++ U.cc
          [ U.p "value" value_
          ]

instance T.FromJSON TestInt where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testInt" -> parseTestInt v
      _ -> mempty
    where
      parseTestInt :: A.Value -> T.Parser TestInt
      parseTestInt = A.withObject "TestInt" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestInt {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestInt where
  toJSON
    TestInt
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "testInt",
          "value" A..= value_
        ]
