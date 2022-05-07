{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PassportElementsWithErrors where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PassportElement as PassportElement
import qualified TD.Reply.PassportElementError as PassportElementError
import qualified Utils as U

data PassportElementsWithErrors = -- | Contains information about a Telegram Passport elements and corresponding errors @elements Telegram Passport elements @errors Errors in the elements that are already available
  PassportElementsWithErrors
  { -- |
    errors :: Maybe [PassportElementError.PassportElementError],
    -- |
    elements :: Maybe [PassportElement.PassportElement]
  }
  deriving (Eq)

instance Show PassportElementsWithErrors where
  show
    PassportElementsWithErrors
      { errors = errors,
        elements = elements
      } =
      "PassportElementsWithErrors"
        ++ U.cc
          [ U.p "errors" errors,
            U.p "elements" elements
          ]

instance T.FromJSON PassportElementsWithErrors where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElementsWithErrors" -> parsePassportElementsWithErrors v
      _ -> fail ""
    where
      parsePassportElementsWithErrors :: A.Value -> T.Parser PassportElementsWithErrors
      parsePassportElementsWithErrors = A.withObject "PassportElementsWithErrors" $ \o -> do
        errors_ <- o A..:? "errors"
        elements_ <- o A..:? "elements"
        return $ PassportElementsWithErrors {errors = errors_, elements = elements_}
  parseJSON _ = fail ""

instance T.ToJSON PassportElementsWithErrors where
  toJSON
    PassportElementsWithErrors
      { errors = errors,
        elements = elements
      } =
      A.object
        [ "@type" A..= T.String "passportElementsWithErrors",
          "errors" A..= errors,
          "elements" A..= elements
        ]
