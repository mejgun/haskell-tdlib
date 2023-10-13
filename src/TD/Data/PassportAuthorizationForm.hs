module TD.Data.PassportAuthorizationForm
  ( PassportAuthorizationForm(..)    
  , defaultPassportAuthorizationForm 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportRequiredElement as PassportRequiredElement
import qualified Data.Text as T

data PassportAuthorizationForm
  = PassportAuthorizationForm -- ^ Contains information about a Telegram Passport authorization form that was requested
    { _id                :: Maybe Int                                               -- ^ Unique identifier of the authorization form
    , required_elements  :: Maybe [PassportRequiredElement.PassportRequiredElement] -- ^ Telegram Passport elements that must be provided to complete the form
    , privacy_policy_url :: Maybe T.Text                                            -- ^ URL for the privacy policy of the service; may be empty
    }
  deriving (Eq)

instance Show PassportAuthorizationForm where
  show PassportAuthorizationForm
    { _id                = _id_
    , required_elements  = required_elements_
    , privacy_policy_url = privacy_policy_url_
    }
      = "PassportAuthorizationForm"
        ++ I.cc
        [ "_id"                `I.p` _id_
        , "required_elements"  `I.p` required_elements_
        , "privacy_policy_url" `I.p` privacy_policy_url_
        ]

instance AT.FromJSON PassportAuthorizationForm where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportAuthorizationForm" -> parsePassportAuthorizationForm v
      _                           -> mempty
    
    where
      parsePassportAuthorizationForm :: A.Value -> AT.Parser PassportAuthorizationForm
      parsePassportAuthorizationForm = A.withObject "PassportAuthorizationForm" $ \o -> do
        _id_                <- o A..:?  "id"
        required_elements_  <- o A..:?  "required_elements"
        privacy_policy_url_ <- o A..:?  "privacy_policy_url"
        pure $ PassportAuthorizationForm
          { _id                = _id_
          , required_elements  = required_elements_
          , privacy_policy_url = privacy_policy_url_
          }
  parseJSON _ = mempty

instance AT.ToJSON PassportAuthorizationForm where
  toJSON PassportAuthorizationForm
    { _id                = _id_
    , required_elements  = required_elements_
    , privacy_policy_url = privacy_policy_url_
    }
      = A.object
        [ "@type"              A..= AT.String "passportAuthorizationForm"
        , "id"                 A..= _id_
        , "required_elements"  A..= required_elements_
        , "privacy_policy_url" A..= privacy_policy_url_
        ]

defaultPassportAuthorizationForm :: PassportAuthorizationForm
defaultPassportAuthorizationForm =
  PassportAuthorizationForm
    { _id                = Nothing
    , required_elements  = Nothing
    , privacy_policy_url = Nothing
    }

