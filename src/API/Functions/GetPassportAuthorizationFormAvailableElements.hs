-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportAuthorizationFormAvailableElements where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPassportAuthorizationFormAvailableElements = 
 GetPassportAuthorizationFormAvailableElements { password :: Maybe String, autorization_form_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetPassportAuthorizationFormAvailableElements where
 toJSON (GetPassportAuthorizationFormAvailableElements { password = password, autorization_form_id = autorization_form_id }) =
  A.object [ "@type" A..= T.String "getPassportAuthorizationFormAvailableElements", "password" A..= password, "autorization_form_id" A..= autorization_form_id ]

instance T.FromJSON GetPassportAuthorizationFormAvailableElements where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPassportAuthorizationFormAvailableElements" -> parseGetPassportAuthorizationFormAvailableElements v
   _ -> mempty
  where
   parseGetPassportAuthorizationFormAvailableElements :: A.Value -> T.Parser GetPassportAuthorizationFormAvailableElements
   parseGetPassportAuthorizationFormAvailableElements = A.withObject "GetPassportAuthorizationFormAvailableElements" $ \o -> do
    password <- optional $ o A..: "password"
    autorization_form_id <- optional $ o A..: "autorization_form_id"
    return $ GetPassportAuthorizationFormAvailableElements { password = password, autorization_form_id = autorization_form_id }