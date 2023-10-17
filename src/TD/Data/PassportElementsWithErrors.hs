module TD.Data.PassportElementsWithErrors
  (PassportElementsWithErrors(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElement as PassportElement
import qualified TD.Data.PassportElementError as PassportElementError

data PassportElementsWithErrors
  = PassportElementsWithErrors -- ^ Contains information about a Telegram Passport elements and corresponding errors
    { elements :: Maybe [PassportElement.PassportElement]           -- ^ Telegram Passport elements
    , errors   :: Maybe [PassportElementError.PassportElementError] -- ^ Errors in the elements that are already available
    }
  deriving (Eq, Show)

instance I.ShortShow PassportElementsWithErrors where
  shortShow PassportElementsWithErrors
    { elements = elements_
    , errors   = errors_
    }
      = "PassportElementsWithErrors"
        ++ I.cc
        [ "elements" `I.p` elements_
        , "errors"   `I.p` errors_
        ]

instance AT.FromJSON PassportElementsWithErrors where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportElementsWithErrors" -> parsePassportElementsWithErrors v
      _                            -> mempty
    
    where
      parsePassportElementsWithErrors :: A.Value -> AT.Parser PassportElementsWithErrors
      parsePassportElementsWithErrors = A.withObject "PassportElementsWithErrors" $ \o -> do
        elements_ <- o A..:?  "elements"
        errors_   <- o A..:?  "errors"
        pure $ PassportElementsWithErrors
          { elements = elements_
          , errors   = errors_
          }
  parseJSON _ = mempty

