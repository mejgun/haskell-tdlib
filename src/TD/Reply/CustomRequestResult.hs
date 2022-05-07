{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.CustomRequestResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data CustomRequestResult = -- | Contains the result of a custom request @result A JSON-serialized result
  CustomRequestResult
  { -- |
    result :: Maybe String
  }
  deriving (Eq)

instance Show CustomRequestResult where
  show
    CustomRequestResult
      { result = result
      } =
      "CustomRequestResult"
        ++ U.cc
          [ U.p "result" result
          ]

instance T.FromJSON CustomRequestResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "customRequestResult" -> parseCustomRequestResult v
      _ -> fail ""
    where
      parseCustomRequestResult :: A.Value -> T.Parser CustomRequestResult
      parseCustomRequestResult = A.withObject "CustomRequestResult" $ \o -> do
        result_ <- o A..:? "result"
        return $ CustomRequestResult {result = result_}
  parseJSON _ = fail ""

instance T.ToJSON CustomRequestResult where
  toJSON
    CustomRequestResult
      { result = result
      } =
      A.object
        [ "@type" A..= T.String "customRequestResult",
          "result" A..= result
        ]
