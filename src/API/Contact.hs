-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Contact where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a user contact 
-- 
-- __phone_number__ Phone number of the user
-- 
-- __first_name__ First name of the user; 1-255 characters in length
-- 
-- __last_name__ Last name of the user
-- 
-- __vcard__ Additional data about the user in a form of vCard; 0-2048 bytes in length
-- 
-- __user_id__ Identifier of the user, if known; otherwise 0
data Contact = 
 Contact { user_id :: Maybe Int, vcard :: Maybe String, last_name :: Maybe String, first_name :: Maybe String, phone_number :: Maybe String }  deriving (Show, Eq)

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
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    vcard <- o A..:? "vcard"
    last_name <- o A..:? "last_name"
    first_name <- o A..:? "first_name"
    phone_number <- o A..:? "phone_number"
    return $ Contact { user_id = user_id, vcard = vcard, last_name = last_name, first_name = first_name, phone_number = phone_number }