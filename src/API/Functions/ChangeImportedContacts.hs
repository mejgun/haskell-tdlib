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



instance T.FromJSON ChangeImportedContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changeImportedContacts" -> parseChangeImportedContacts v
  where
   parseChangeImportedContacts :: A.Value -> T.Parser ChangeImportedContacts
   parseChangeImportedContacts = A.withObject "ChangeImportedContacts" $ \o -> do
    contacts <- o A..: "contacts"
    return $ ChangeImportedContacts { contacts = contacts }