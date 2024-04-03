module TD.Data.PhoneNumberInfo
  (PhoneNumberInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CountryInfo as CountryInfo
import qualified Data.Text as T

data PhoneNumberInfo
  = PhoneNumberInfo -- ^ Contains information about a phone number
    { country                :: Maybe CountryInfo.CountryInfo -- ^ Information about the country to which the phone number belongs; may be null
    , country_calling_code   :: Maybe T.Text                  -- ^ The part of the phone number denoting country calling code or its part
    , formatted_phone_number :: Maybe T.Text                  -- ^ The phone number without country calling code formatted accordingly to local rules. Expected digits are returned as '-', but even more digits might be entered by the user
    , is_anonymous           :: Maybe Bool                    -- ^ True, if the phone number was bought at https://fragment.com and isn't tied to a SIM card. Information about the phone number can be received using getCollectibleItemInfo
    }
  deriving (Eq, Show)

instance I.ShortShow PhoneNumberInfo where
  shortShow PhoneNumberInfo
    { country                = country_
    , country_calling_code   = country_calling_code_
    , formatted_phone_number = formatted_phone_number_
    , is_anonymous           = is_anonymous_
    }
      = "PhoneNumberInfo"
        ++ I.cc
        [ "country"                `I.p` country_
        , "country_calling_code"   `I.p` country_calling_code_
        , "formatted_phone_number" `I.p` formatted_phone_number_
        , "is_anonymous"           `I.p` is_anonymous_
        ]

instance AT.FromJSON PhoneNumberInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "phoneNumberInfo" -> parsePhoneNumberInfo v
      _                 -> mempty
    
    where
      parsePhoneNumberInfo :: A.Value -> AT.Parser PhoneNumberInfo
      parsePhoneNumberInfo = A.withObject "PhoneNumberInfo" $ \o -> do
        country_                <- o A..:?  "country"
        country_calling_code_   <- o A..:?  "country_calling_code"
        formatted_phone_number_ <- o A..:?  "formatted_phone_number"
        is_anonymous_           <- o A..:?  "is_anonymous"
        pure $ PhoneNumberInfo
          { country                = country_
          , country_calling_code   = country_calling_code_
          , formatted_phone_number = formatted_phone_number_
          , is_anonymous           = is_anonymous_
          }
  parseJSON _ = mempty

