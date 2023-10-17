module TD.Data.PersonalDetails
  ( PersonalDetails(..)    
  , defaultPersonalDetails 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Date as Date

data PersonalDetails
  = PersonalDetails -- ^ Contains the user's personal details
    { first_name             :: Maybe T.Text    -- ^ First name of the user written in English; 1-255 characters
    , middle_name            :: Maybe T.Text    -- ^ Middle name of the user written in English; 0-255 characters
    , last_name              :: Maybe T.Text    -- ^ Last name of the user written in English; 1-255 characters
    , native_first_name      :: Maybe T.Text    -- ^ Native first name of the user; 1-255 characters
    , native_middle_name     :: Maybe T.Text    -- ^ Native middle name of the user; 0-255 characters
    , native_last_name       :: Maybe T.Text    -- ^ Native last name of the user; 1-255 characters
    , birthdate              :: Maybe Date.Date -- ^ Birthdate of the user
    , gender                 :: Maybe T.Text    -- ^ Gender of the user, "male" or "female"
    , country_code           :: Maybe T.Text    -- ^ A two-letter ISO 3166-1 alpha-2 country code of the user's country
    , residence_country_code :: Maybe T.Text    -- ^ A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
    }
  deriving (Eq, Show)

instance I.ShortShow PersonalDetails where
  shortShow PersonalDetails
    { first_name             = first_name_
    , middle_name            = middle_name_
    , last_name              = last_name_
    , native_first_name      = native_first_name_
    , native_middle_name     = native_middle_name_
    , native_last_name       = native_last_name_
    , birthdate              = birthdate_
    , gender                 = gender_
    , country_code           = country_code_
    , residence_country_code = residence_country_code_
    }
      = "PersonalDetails"
        ++ I.cc
        [ "first_name"             `I.p` first_name_
        , "middle_name"            `I.p` middle_name_
        , "last_name"              `I.p` last_name_
        , "native_first_name"      `I.p` native_first_name_
        , "native_middle_name"     `I.p` native_middle_name_
        , "native_last_name"       `I.p` native_last_name_
        , "birthdate"              `I.p` birthdate_
        , "gender"                 `I.p` gender_
        , "country_code"           `I.p` country_code_
        , "residence_country_code" `I.p` residence_country_code_
        ]

instance AT.FromJSON PersonalDetails where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "personalDetails" -> parsePersonalDetails v
      _                 -> mempty
    
    where
      parsePersonalDetails :: A.Value -> AT.Parser PersonalDetails
      parsePersonalDetails = A.withObject "PersonalDetails" $ \o -> do
        first_name_             <- o A..:?  "first_name"
        middle_name_            <- o A..:?  "middle_name"
        last_name_              <- o A..:?  "last_name"
        native_first_name_      <- o A..:?  "native_first_name"
        native_middle_name_     <- o A..:?  "native_middle_name"
        native_last_name_       <- o A..:?  "native_last_name"
        birthdate_              <- o A..:?  "birthdate"
        gender_                 <- o A..:?  "gender"
        country_code_           <- o A..:?  "country_code"
        residence_country_code_ <- o A..:?  "residence_country_code"
        pure $ PersonalDetails
          { first_name             = first_name_
          , middle_name            = middle_name_
          , last_name              = last_name_
          , native_first_name      = native_first_name_
          , native_middle_name     = native_middle_name_
          , native_last_name       = native_last_name_
          , birthdate              = birthdate_
          , gender                 = gender_
          , country_code           = country_code_
          , residence_country_code = residence_country_code_
          }
  parseJSON _ = mempty

instance AT.ToJSON PersonalDetails where
  toJSON PersonalDetails
    { first_name             = first_name_
    , middle_name            = middle_name_
    , last_name              = last_name_
    , native_first_name      = native_first_name_
    , native_middle_name     = native_middle_name_
    , native_last_name       = native_last_name_
    , birthdate              = birthdate_
    , gender                 = gender_
    , country_code           = country_code_
    , residence_country_code = residence_country_code_
    }
      = A.object
        [ "@type"                  A..= AT.String "personalDetails"
        , "first_name"             A..= first_name_
        , "middle_name"            A..= middle_name_
        , "last_name"              A..= last_name_
        , "native_first_name"      A..= native_first_name_
        , "native_middle_name"     A..= native_middle_name_
        , "native_last_name"       A..= native_last_name_
        , "birthdate"              A..= birthdate_
        , "gender"                 A..= gender_
        , "country_code"           A..= country_code_
        , "residence_country_code" A..= residence_country_code_
        ]

defaultPersonalDetails :: PersonalDetails
defaultPersonalDetails =
  PersonalDetails
    { first_name             = Nothing
    , middle_name            = Nothing
    , last_name              = Nothing
    , native_first_name      = Nothing
    , native_middle_name     = Nothing
    , native_last_name       = Nothing
    , birthdate              = Nothing
    , gender                 = Nothing
    , country_code           = Nothing
    , residence_country_code = Nothing
    }

