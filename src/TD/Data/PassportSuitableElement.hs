{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportSuitableElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Utils as U

-- |
data PassportSuitableElement = -- | Contains information about a Telegram Passport element that was requested by a service
  PassportSuitableElement
  { -- | True, if personal details must include the user's name in the language of their country of residence
    is_native_name_required :: Maybe Bool,
    -- | True, if a certified English translation is required with the document
    is_translation_required :: Maybe Bool,
    -- | True, if a selfie is required with the identity document
    is_selfie_required :: Maybe Bool,
    -- | Type of the element
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show PassportSuitableElement where
  show
    PassportSuitableElement
      { is_native_name_required = is_native_name_required_,
        is_translation_required = is_translation_required_,
        is_selfie_required = is_selfie_required_,
        _type = _type_
      } =
      "PassportSuitableElement"
        ++ U.cc
          [ U.p "is_native_name_required" is_native_name_required_,
            U.p "is_translation_required" is_translation_required_,
            U.p "is_selfie_required" is_selfie_required_,
            U.p "_type" _type_
          ]

instance T.FromJSON PassportSuitableElement where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportSuitableElement" -> parsePassportSuitableElement v
      _ -> mempty
    where
      parsePassportSuitableElement :: A.Value -> T.Parser PassportSuitableElement
      parsePassportSuitableElement = A.withObject "PassportSuitableElement" $ \o -> do
        is_native_name_required_ <- o A..:? "is_native_name_required"
        is_translation_required_ <- o A..:? "is_translation_required"
        is_selfie_required_ <- o A..:? "is_selfie_required"
        _type_ <- o A..:? "type"
        return $ PassportSuitableElement {is_native_name_required = is_native_name_required_, is_translation_required = is_translation_required_, is_selfie_required = is_selfie_required_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON PassportSuitableElement where
  toJSON
    PassportSuitableElement
      { is_native_name_required = is_native_name_required_,
        is_translation_required = is_translation_required_,
        is_selfie_required = is_selfie_required_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "passportSuitableElement",
          "is_native_name_required" A..= is_native_name_required_,
          "is_translation_required" A..= is_translation_required_,
          "is_selfie_required" A..= is_selfie_required_,
          "type" A..= _type_
        ]
