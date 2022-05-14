{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PassportRequiredElement as PassportRequiredElement
import qualified Utils as U

-- |
data PassportAuthorizationForm = -- | Contains information about a Telegram Passport authorization form that was requested @id Unique identifier of the authorization form
  PassportAuthorizationForm
  { -- | URL for the privacy policy of the service; may be empty
    privacy_policy_url :: Maybe String,
    -- | Telegram Passport elements that must be provided to complete the form
    required_elements :: Maybe [PassportRequiredElement.PassportRequiredElement],
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show PassportAuthorizationForm where
  show
    PassportAuthorizationForm
      { privacy_policy_url = privacy_policy_url_,
        required_elements = required_elements_,
        _id = _id_
      } =
      "PassportAuthorizationForm"
        ++ U.cc
          [ U.p "privacy_policy_url" privacy_policy_url_,
            U.p "required_elements" required_elements_,
            U.p "_id" _id_
          ]

instance T.FromJSON PassportAuthorizationForm where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportAuthorizationForm" -> parsePassportAuthorizationForm v
      _ -> mempty
    where
      parsePassportAuthorizationForm :: A.Value -> T.Parser PassportAuthorizationForm
      parsePassportAuthorizationForm = A.withObject "PassportAuthorizationForm" $ \o -> do
        privacy_policy_url_ <- o A..:? "privacy_policy_url"
        required_elements_ <- o A..:? "required_elements"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ PassportAuthorizationForm {privacy_policy_url = privacy_policy_url_, required_elements = required_elements_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON PassportAuthorizationForm where
  toJSON
    PassportAuthorizationForm
      { privacy_policy_url = privacy_policy_url_,
        required_elements = required_elements_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "passportAuthorizationForm",
          "privacy_policy_url" A..= privacy_policy_url_,
          "required_elements" A..= required_elements_,
          "id" A..= _id_
        ]
