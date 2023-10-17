module TD.Data.PassportElements
  (PassportElements(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElement as PassportElement

data PassportElements
  = PassportElements -- ^ Contains information about saved Telegram Passport elements
    { elements :: Maybe [PassportElement.PassportElement] -- ^ Telegram Passport elements
    }
  deriving (Eq, Show)

instance I.ShortShow PassportElements where
  shortShow PassportElements
    { elements = elements_
    }
      = "PassportElements"
        ++ I.cc
        [ "elements" `I.p` elements_
        ]

instance AT.FromJSON PassportElements where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportElements" -> parsePassportElements v
      _                  -> mempty
    
    where
      parsePassportElements :: A.Value -> AT.Parser PassportElements
      parsePassportElements = A.withObject "PassportElements" $ \o -> do
        elements_ <- o A..:?  "elements"
        pure $ PassportElements
          { elements = elements_
          }
  parseJSON _ = mempty

