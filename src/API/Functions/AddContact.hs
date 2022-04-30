-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddContact where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Contact as Contact

-- |
-- 
-- Adds a user to the contact list or edits an existing contact by their user identifier 
-- 
-- __contact__ The contact to add or edit; phone number may be empty and needs to be specified only if known, vCard is ignored
-- 
-- __share_phone_number__ Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
data AddContact = 

 AddContact { share_phone_number :: Maybe Bool, contact :: Maybe Contact.Contact }  deriving (Eq)

instance Show AddContact where
 show AddContact { share_phone_number=share_phone_number, contact=contact } =
  "AddContact" ++ U.cc [U.p "share_phone_number" share_phone_number, U.p "contact" contact ]

instance T.ToJSON AddContact where
 toJSON AddContact { share_phone_number = share_phone_number, contact = contact } =
  A.object [ "@type" A..= T.String "addContact", "share_phone_number" A..= share_phone_number, "contact" A..= contact ]

instance T.FromJSON AddContact where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addContact" -> parseAddContact v
   _ -> mempty
  where
   parseAddContact :: A.Value -> T.Parser AddContact
   parseAddContact = A.withObject "AddContact" $ \o -> do
    share_phone_number <- o A..:? "share_phone_number"
    contact <- o A..:? "contact"
    return $ AddContact { share_phone_number = share_phone_number, contact = contact }
 parseJSON _ = mempty
