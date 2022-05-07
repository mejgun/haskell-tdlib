{-# LANGUAGE OverloadedStrings #-}

module TD.Data.TestBytes where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data TestBytes = -- | A simple object containing a sequence of bytes; for testing only @value Bytes
  TestBytes
  { -- |
    value :: Maybe String
  }
  deriving (Eq)

instance Show TestBytes where
  show
    TestBytes
      { value = value
      } =
      "TestBytes"
        ++ U.cc
          [ U.p "value" value
          ]

instance T.FromJSON TestBytes where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testBytes" -> parseTestBytes v
      _ -> mempty
    where
      parseTestBytes :: A.Value -> T.Parser TestBytes
      parseTestBytes = A.withObject "TestBytes" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestBytes {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestBytes where
  toJSON
    TestBytes
      { value = value
      } =
      A.object
        [ "@type" A..= T.String "testBytes",
          "value" A..= value
        ]
