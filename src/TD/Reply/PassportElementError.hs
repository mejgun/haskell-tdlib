{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PassportElementError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PassportElementErrorSource as PassportElementErrorSource
import qualified TD.Reply.PassportElementType as PassportElementType
import qualified Utils as U

data PassportElementError = -- | Contains the description of an error in a Telegram Passport element @type Type of the Telegram Passport element which has the error @message Error message @source Error source
  PassportElementError
  { -- |
    source :: Maybe PassportElementErrorSource.PassportElementErrorSource,
    -- |
    message :: Maybe String,
    -- |
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show PassportElementError where
  show
    PassportElementError
      { source = source,
        message = message,
        _type = _type
      } =
      "PassportElementError"
        ++ U.cc
          [ U.p "source" source,
            U.p "message" message,
            U.p "_type" _type
          ]

instance T.FromJSON PassportElementError where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElementError" -> parsePassportElementError v
      _ -> fail ""
    where
      parsePassportElementError :: A.Value -> T.Parser PassportElementError
      parsePassportElementError = A.withObject "PassportElementError" $ \o -> do
        source_ <- o A..:? "source"
        message_ <- o A..:? "message"
        _type_ <- o A..:? "type"
        return $ PassportElementError {source = source_, message = message_, _type = _type_}
  parseJSON _ = fail ""

instance T.ToJSON PassportElementError where
  toJSON
    PassportElementError
      { source = source,
        message = message,
        _type = _type
      } =
      A.object
        [ "@type" A..= T.String "passportElementError",
          "source" A..= source,
          "message" A..= message,
          "type" A..= _type
        ]
