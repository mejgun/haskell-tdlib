{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.InputPassportElementError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputPassportElementErrorSource as InputPassportElementErrorSource
import qualified TD.Reply.PassportElementType as PassportElementType
import qualified Utils as U

data InputPassportElementError = -- | Contains the description of an error in a Telegram Passport element; for bots only @type Type of Telegram Passport element that has the error @message Error message @source Error source
  InputPassportElementError
  { -- |
    source :: Maybe InputPassportElementErrorSource.InputPassportElementErrorSource,
    -- |
    message :: Maybe String,
    -- |
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show InputPassportElementError where
  show
    InputPassportElementError
      { source = source,
        message = message,
        _type = _type
      } =
      "InputPassportElementError"
        ++ U.cc
          [ U.p "source" source,
            U.p "message" message,
            U.p "_type" _type
          ]

instance T.FromJSON InputPassportElementError where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputPassportElementError" -> parseInputPassportElementError v
      _ -> fail ""
    where
      parseInputPassportElementError :: A.Value -> T.Parser InputPassportElementError
      parseInputPassportElementError = A.withObject "InputPassportElementError" $ \o -> do
        source_ <- o A..:? "source"
        message_ <- o A..:? "message"
        _type_ <- o A..:? "type"
        return $ InputPassportElementError {source = source_, message = message_, _type = _type_}
  parseJSON _ = fail ""

instance T.ToJSON InputPassportElementError where
  toJSON
    InputPassportElementError
      { source = source,
        message = message,
        _type = _type
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementError",
          "source" A..= source,
          "message" A..= message,
          "type" A..= _type
        ]
