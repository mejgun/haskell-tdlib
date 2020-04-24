-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPassportAuthorizationForm where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

data SendPassportAuthorizationForm = 
 SendPassportAuthorizationForm { types :: Maybe [PassportElementType.PassportElementType], autorization_form_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendPassportAuthorizationForm where
 toJSON (SendPassportAuthorizationForm { types = types, autorization_form_id = autorization_form_id }) =
  A.object [ "@type" A..= T.String "sendPassportAuthorizationForm", "types" A..= types, "autorization_form_id" A..= autorization_form_id ]

instance T.FromJSON SendPassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPassportAuthorizationForm" -> parseSendPassportAuthorizationForm v
   _ -> mempty
  where
   parseSendPassportAuthorizationForm :: A.Value -> T.Parser SendPassportAuthorizationForm
   parseSendPassportAuthorizationForm = A.withObject "SendPassportAuthorizationForm" $ \o -> do
    types <- optional $ o A..: "types"
    autorization_form_id <- optional $ o A..: "autorization_form_id"
    return $ SendPassportAuthorizationForm { types = types, autorization_form_id = autorization_form_id }