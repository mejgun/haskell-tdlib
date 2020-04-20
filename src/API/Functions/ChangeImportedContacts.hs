-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeImportedContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

--main = putStrLn "ok"

data ChangeImportedContacts = 
 ChangeImportedContacts { contacts :: [Contact.Contact] }  -- deriving (Show)

instance T.ToJSON ChangeImportedContacts where
 toJSON (ChangeImportedContacts { contacts = contacts }) =
  A.object [ "@type" A..= T.String "changeImportedContacts", "contacts" A..= contacts ]
-- changeImportedContacts ChangeImportedContacts  { contacts :: [Contact.Contact] } 

