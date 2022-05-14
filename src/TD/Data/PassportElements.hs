{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PassportElement as PassportElement
import qualified Utils as U

-- |
data PassportElements = -- | Contains information about saved Telegram Passport elements @elements Telegram Passport elements
  PassportElements
  { -- |
    elements :: Maybe [PassportElement.PassportElement]
  }
  deriving (Eq)

instance Show PassportElements where
  show
    PassportElements
      { elements = elements_
      } =
      "PassportElements"
        ++ U.cc
          [ U.p "elements" elements_
          ]

instance T.FromJSON PassportElements where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElements" -> parsePassportElements v
      _ -> mempty
    where
      parsePassportElements :: A.Value -> T.Parser PassportElements
      parsePassportElements = A.withObject "PassportElements" $ \o -> do
        elements_ <- o A..:? "elements"
        return $ PassportElements {elements = elements_}
  parseJSON _ = mempty

instance T.ToJSON PassportElements where
  toJSON
    PassportElements
      { elements = elements_
      } =
      A.object
        [ "@type" A..= T.String "passportElements",
          "elements" A..= elements_
        ]
