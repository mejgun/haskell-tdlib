-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Contact where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Contact = 
 Contact { user_id :: Maybe Int, vcard :: Maybe String, last_name :: Maybe String, first_name :: Maybe String, phone_number :: Maybe String }  deriving (Show)

instance T.ToJSON Contact where
 toJSON (Contact { user_id = user_id, vcard = vcard, last_name = last_name, first_name = first_name, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "contact", "user_id" A..= user_id, "vcard" A..= vcard, "last_name" A..= last_name, "first_name" A..= first_name, "phone_number" A..= phone_number ]

instance T.FromJSON Contact where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "contact" -> parseContact v
   _ -> mempty
  where
   parseContact :: A.Value -> T.Parser Contact
   parseContact = A.withObject "Contact" $ \o -> do
    user_id <- optional $ o A..: "user_id"
    vcard <- optional $ o A..: "vcard"
    last_name <- optional $ o A..: "last_name"
    first_name <- optional $ o A..: "first_name"
    phone_number <- optional $ o A..: "phone_number"
    return $ Contact { user_id = user_id, vcard = vcard, last_name = last_name, first_name = first_name, phone_number = phone_number }