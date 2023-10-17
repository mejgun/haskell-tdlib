module TD.Data.PassportRequiredElement
  (PassportRequiredElement(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportSuitableElement as PassportSuitableElement

data PassportRequiredElement
  = PassportRequiredElement -- ^ Contains a description of the required Telegram Passport element that was requested by a service
    { suitable_elements :: Maybe [PassportSuitableElement.PassportSuitableElement] -- ^ List of Telegram Passport elements any of which is enough to provide
    }
  deriving (Eq, Show)

instance I.ShortShow PassportRequiredElement where
  shortShow PassportRequiredElement
    { suitable_elements = suitable_elements_
    }
      = "PassportRequiredElement"
        ++ I.cc
        [ "suitable_elements" `I.p` suitable_elements_
        ]

instance AT.FromJSON PassportRequiredElement where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportRequiredElement" -> parsePassportRequiredElement v
      _                         -> mempty
    
    where
      parsePassportRequiredElement :: A.Value -> AT.Parser PassportRequiredElement
      parsePassportRequiredElement = A.withObject "PassportRequiredElement" $ \o -> do
        suitable_elements_ <- o A..:?  "suitable_elements"
        pure $ PassportRequiredElement
          { suitable_elements = suitable_elements_
          }
  parseJSON _ = mempty

