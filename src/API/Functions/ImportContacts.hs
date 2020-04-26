-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ImportContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

-- |
-- 
-- Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored 
-- 
-- __contacts__ The list of contacts to import or edit; contacts' vCard are ignored and are not imported
data ImportContacts = 
 ImportContacts { contacts :: Maybe [Contact.Contact] }  deriving (Show, Eq)

instance T.ToJSON ImportContacts where
 toJSON (ImportContacts { contacts = contacts }) =
  A.object [ "@type" A..= T.String "importContacts", "contacts" A..= contacts ]

instance T.FromJSON ImportContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "importContacts" -> parseImportContacts v
   _ -> mempty
  where
   parseImportContacts :: A.Value -> T.Parser ImportContacts
   parseImportContacts = A.withObject "ImportContacts" $ \o -> do
    contacts <- o A..:? "contacts"
    return $ ImportContacts { contacts = contacts }