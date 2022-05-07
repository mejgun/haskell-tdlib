{-# LANGUAGE OverloadedStrings #-}

module TD.Data.TestString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data TestString = -- | A simple object containing a string; for testing only @value String
  TestString
  { -- |
    value :: Maybe String
  }
  deriving (Eq)

instance Show TestString where
  show
    TestString
      { value = value
      } =
      "TestString"
        ++ U.cc
          [ U.p "value" value
          ]

instance T.FromJSON TestString where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testString" -> parseTestString v
      _ -> mempty
    where
      parseTestString :: A.Value -> T.Parser TestString
      parseTestString = A.withObject "TestString" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestString {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestString where
  toJSON
    TestString
      { value = value
      } =
      A.object
        [ "@type" A..= T.String "testString",
          "value" A..= value
        ]
