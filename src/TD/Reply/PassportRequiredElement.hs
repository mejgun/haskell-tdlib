{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PassportRequiredElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PassportSuitableElement as PassportSuitableElement
import qualified Utils as U

data PassportRequiredElement = -- | Contains a description of the required Telegram Passport element that was requested by a service @suitable_elements List of Telegram Passport elements any of which is enough to provide
  PassportRequiredElement
  { -- |
    suitable_elements :: Maybe [PassportSuitableElement.PassportSuitableElement]
  }
  deriving (Eq)

instance Show PassportRequiredElement where
  show
    PassportRequiredElement
      { suitable_elements = suitable_elements
      } =
      "PassportRequiredElement"
        ++ U.cc
          [ U.p "suitable_elements" suitable_elements
          ]

instance T.FromJSON PassportRequiredElement where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportRequiredElement" -> parsePassportRequiredElement v
      _ -> fail ""
    where
      parsePassportRequiredElement :: A.Value -> T.Parser PassportRequiredElement
      parsePassportRequiredElement = A.withObject "PassportRequiredElement" $ \o -> do
        suitable_elements_ <- o A..:? "suitable_elements"
        return $ PassportRequiredElement {suitable_elements = suitable_elements_}
  parseJSON _ = fail ""

instance T.ToJSON PassportRequiredElement where
  toJSON
    PassportRequiredElement
      { suitable_elements = suitable_elements
      } =
      A.object
        [ "@type" A..= T.String "passportRequiredElement",
          "suitable_elements" A..= suitable_elements
        ]
