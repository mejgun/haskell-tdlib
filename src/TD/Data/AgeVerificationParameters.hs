module TD.Data.AgeVerificationParameters
  (AgeVerificationParameters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data AgeVerificationParameters
  = AgeVerificationParameters -- ^ Describes parameters for age verification of the current user
    { min_age                   :: Maybe Int    -- ^ The minimum age required to view restricted content
    , verification_bot_username :: Maybe T.Text -- ^ Username of the bot which main Web App may be used to verify age of the user
    , country                   :: Maybe T.Text -- ^ Unique name for the country or region, which legislation required age verification. May be used to get the corresponding localization key
    }
  deriving (Eq, Show)

instance I.ShortShow AgeVerificationParameters where
  shortShow AgeVerificationParameters
    { min_age                   = min_age_
    , verification_bot_username = verification_bot_username_
    , country                   = country_
    }
      = "AgeVerificationParameters"
        ++ I.cc
        [ "min_age"                   `I.p` min_age_
        , "verification_bot_username" `I.p` verification_bot_username_
        , "country"                   `I.p` country_
        ]

instance AT.FromJSON AgeVerificationParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "ageVerificationParameters" -> parseAgeVerificationParameters v
      _                           -> mempty
    
    where
      parseAgeVerificationParameters :: A.Value -> AT.Parser AgeVerificationParameters
      parseAgeVerificationParameters = A.withObject "AgeVerificationParameters" $ \o -> do
        min_age_                   <- o A..:?  "min_age"
        verification_bot_username_ <- o A..:?  "verification_bot_username"
        country_                   <- o A..:?  "country"
        pure $ AgeVerificationParameters
          { min_age                   = min_age_
          , verification_bot_username = verification_bot_username_
          , country                   = country_
          }
  parseJSON _ = mempty

