-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeImportedContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

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