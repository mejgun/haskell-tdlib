-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ImportContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Contact as Contact

-- |
-- 
-- Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored 
-- 
-- __contacts__ The list of contacts to import or edit; contacts' vCard are ignored and are not imported
data ImportContacts = 

 ImportContacts { contacts :: Maybe [Contact.Contact] }  deriving (Eq)

instance Show ImportContacts where
 show ImportContacts { contacts=contacts } =
  "ImportContacts" ++ cc [p "contacts" contacts ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ImportContacts where
 toJSON ImportContacts { contacts = contacts } =
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
 parseJSON _ = mempty
