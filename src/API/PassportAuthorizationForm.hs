-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportRequiredElement as PassportRequiredElement

--main = putStrLn "ok"

data PassportAuthorizationForm = 
 PassportAuthorizationForm { privacy_policy_url :: String, required_elements :: [PassportRequiredElement.PassportRequiredElement], _id :: Int }  -- deriving (Show)

instance T.ToJSON PassportAuthorizationForm where
 toJSON (PassportAuthorizationForm { privacy_policy_url = privacy_policy_url, required_elements = required_elements, _id = _id }) =
  A.object [ "@type" A..= T.String "passportAuthorizationForm", "privacy_policy_url" A..= privacy_policy_url, "required_elements" A..= required_elements, "id" A..= _id ]
-- passportAuthorizationForm PassportAuthorizationForm  { privacy_policy_url :: String, required_elements :: [PassportRequiredElement.PassportRequiredElement], _id :: Int } 



instance T.FromJSON PassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportAuthorizationForm" -> parsePassportAuthorizationForm v
  where
   parsePassportAuthorizationForm :: A.Value -> T.Parser PassportAuthorizationForm
   parsePassportAuthorizationForm = A.withObject "PassportAuthorizationForm" $ \o -> do
    privacy_policy_url <- o A..: "privacy_policy_url"
    required_elements <- o A..: "required_elements"
    _id <- o A..: "id"
    return $ PassportAuthorizationForm { privacy_policy_url = privacy_policy_url, required_elements = required_elements, _id = _id }