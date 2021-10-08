-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddContact where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Contact as Contact

-- |
-- 
-- Adds a user to the contact list or edits an existing contact by their user identifier 
-- 
-- __contact__ The contact to add or edit; phone number can be empty and needs to be specified only if known, vCard is ignored
-- 
-- __share_phone_number__ True, if the new contact needs to be allowed to see current user's phone number. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
data AddContact = 

 AddContact { share_phone_number :: Maybe Bool, contact :: Maybe Contact.Contact }  deriving (Eq)

instance Show AddContact where
 show AddContact { share_phone_number=share_phone_number, contact=contact } =
  "AddContact" ++ cc [p "share_phone_number" share_phone_number, p "contact" contact ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


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
