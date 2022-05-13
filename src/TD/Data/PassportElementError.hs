{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportElementError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PassportElementErrorSource as PassportElementErrorSource
import qualified TD.Data.PassportElementType as PassportElementType
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
      { source = source_,
        message = message_,
        _type = _type_
      } =
      "PassportElementError"
        ++ U.cc
          [ U.p "source" source_,
            U.p "message" message_,
            U.p "_type" _type_
          ]

instance T.FromJSON PassportElementError where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElementError" -> parsePassportElementError v
      _ -> mempty
    where
      parsePassportElementError :: A.Value -> T.Parser PassportElementError
      parsePassportElementError = A.withObject "PassportElementError" $ \o -> do
        source_ <- o A..:? "source"
        message_ <- o A..:? "message"
        _type_ <- o A..:? "type"
        return $ PassportElementError {source = source_, message = message_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON PassportElementError where
  toJSON
    PassportElementError
      { source = source_,
        message = message_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "passportElementError",
          "source" A..= source_,
          "message" A..= message_,
          "type" A..= _type_
        ]
