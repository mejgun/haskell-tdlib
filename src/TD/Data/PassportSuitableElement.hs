module TD.Data.PassportSuitableElement
  (PassportSuitableElement(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType

data PassportSuitableElement
  = PassportSuitableElement -- ^ Contains information about a Telegram Passport element that was requested by a service
    { _type                   :: Maybe PassportElementType.PassportElementType -- ^ Type of the element
    , is_selfie_required      :: Maybe Bool                                    -- ^ True, if a selfie is required with the identity document
    , is_translation_required :: Maybe Bool                                    -- ^ True, if a certified English translation is required with the document
    , is_native_name_required :: Maybe Bool                                    -- ^ True, if personal details must include the user's name in the language of their country of residence
    }
  deriving (Eq, Show)

instance I.ShortShow PassportSuitableElement where
  shortShow PassportSuitableElement
    { _type                   = _type_
    , is_selfie_required      = is_selfie_required_
    , is_translation_required = is_translation_required_
    , is_native_name_required = is_native_name_required_
    }
      = "PassportSuitableElement"
        ++ I.cc
        [ "_type"                   `I.p` _type_
        , "is_selfie_required"      `I.p` is_selfie_required_
        , "is_translation_required" `I.p` is_translation_required_
        , "is_native_name_required" `I.p` is_native_name_required_
        ]

instance AT.FromJSON PassportSuitableElement where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportSuitableElement" -> parsePassportSuitableElement v
      _                         -> mempty
    
    where
      parsePassportSuitableElement :: A.Value -> AT.Parser PassportSuitableElement
      parsePassportSuitableElement = A.withObject "PassportSuitableElement" $ \o -> do
        _type_                   <- o A..:?  "type"
        is_selfie_required_      <- o A..:?  "is_selfie_required"
        is_translation_required_ <- o A..:?  "is_translation_required"
        is_native_name_required_ <- o A..:?  "is_native_name_required"
        pure $ PassportSuitableElement
          { _type                   = _type_
          , is_selfie_required      = is_selfie_required_
          , is_translation_required = is_translation_required_
          , is_native_name_required = is_native_name_required_
          }
  parseJSON _ = mempty

