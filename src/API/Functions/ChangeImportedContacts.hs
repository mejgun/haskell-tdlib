-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeImportedContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

-- |
-- 
-- Changes imported contacts using the list of current user contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts.
-- 
-- -Query result depends on the result of the previous query, so only one query is possible at the same time 
-- 
-- __contacts__ The new list of contacts, contact's vCard are ignored and are not imported
data ChangeImportedContacts = 

 ChangeImportedContacts { contacts :: Maybe [Contact.Contact] }  deriving (Show, Eq)

instance T.ToJSON ChangeImportedContacts where
 toJSON (ChangeImportedContacts { contacts = contacts }) =
  A.object [ "@type" A..= T.String "changeImportedContacts", "contacts" A..= contacts ]

instance T.FromJSON ChangeImportedContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changeImportedContacts" -> parseChangeImportedContacts v
   _ -> mempty
  where
   parseChangeImportedContacts :: A.Value -> T.Parser ChangeImportedContacts
   parseChangeImportedContacts = A.withObject "ChangeImportedContacts" $ \o -> do
    contacts <- o A..:? "contacts"
    return $ ChangeImportedContacts { contacts = contacts }