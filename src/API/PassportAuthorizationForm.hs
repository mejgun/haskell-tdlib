-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportAuthorizationForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportRequiredElement as PassportRequiredElement

-- |
-- 
-- Contains information about a Telegram Passport authorization form that was requested 
-- 
-- __id__ Unique identifier of the authorization form
-- 
-- __required_elements__ Information about the Telegram Passport elements that must be provided to complete the form
-- 
-- __privacy_policy_url__ URL for the privacy policy of the service; may be empty
data PassportAuthorizationForm = 

 PassportAuthorizationForm { privacy_policy_url :: Maybe String, required_elements :: Maybe [PassportRequiredElement.PassportRequiredElement], _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON PassportAuthorizationForm where
 toJSON (PassportAuthorizationForm { privacy_policy_url = privacy_policy_url, required_elements = required_elements, _id = _id }) =
  A.object [ "@type" A..= T.String "passportAuthorizationForm", "privacy_policy_url" A..= privacy_policy_url, "required_elements" A..= required_elements, "id" A..= _id ]

instance T.FromJSON PassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportAuthorizationForm" -> parsePassportAuthorizationForm v
   _ -> mempty
  where
   parsePassportAuthorizationForm :: A.Value -> T.Parser PassportAuthorizationForm
   parsePassportAuthorizationForm = A.withObject "PassportAuthorizationForm" $ \o -> do
    privacy_policy_url <- o A..:? "privacy_policy_url"
    required_elements <- o A..:? "required_elements"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PassportAuthorizationForm { privacy_policy_url = privacy_policy_url, required_elements = required_elements, _id = _id }