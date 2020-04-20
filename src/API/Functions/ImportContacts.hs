-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ImportContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

--main = putStrLn "ok"

data ImportContacts = 
 ImportContacts { contacts :: [Contact.Contact] }  -- deriving (Show)

instance T.ToJSON ImportContacts where
 toJSON (ImportContacts { contacts = contacts }) =
  A.object [ "@type" A..= T.String "importContacts", "contacts" A..= contacts ]
-- importContacts ImportContacts  { contacts :: [Contact.Contact] } 

