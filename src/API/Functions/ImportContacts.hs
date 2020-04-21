-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ImportContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

--main = putStrLn "ok"

data ImportContacts = 
 ImportContacts { contacts :: [Contact.Contact] }  deriving (Show)

instance T.ToJSON ImportContacts where
 toJSON (ImportContacts { contacts = contacts }) =
  A.object [ "@type" A..= T.String "importContacts", "contacts" A..= contacts ]



instance T.FromJSON ImportContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "importContacts" -> parseImportContacts v

   _ -> mempty ""
  where
   parseImportContacts :: A.Value -> T.Parser ImportContacts
   parseImportContacts = A.withObject "ImportContacts" $ \o -> do
    contacts <- o A..: "contacts"
    return $ ImportContacts { contacts = contacts }