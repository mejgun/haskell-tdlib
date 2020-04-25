-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ImportedContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ImportedContacts = 
 ImportedContacts { importer_count :: Maybe [Int], user_ids :: Maybe [Int] }  deriving (Show, Eq)

instance T.ToJSON ImportedContacts where
 toJSON (ImportedContacts { importer_count = importer_count, user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "importedContacts", "importer_count" A..= importer_count, "user_ids" A..= user_ids ]

instance T.FromJSON ImportedContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "importedContacts" -> parseImportedContacts v
   _ -> mempty
  where
   parseImportedContacts :: A.Value -> T.Parser ImportedContacts
   parseImportedContacts = A.withObject "ImportedContacts" $ \o -> do
    importer_count <- o A..:? "importer_count"
    user_ids <- o A..:? "user_ids"
    return $ ImportedContacts { importer_count = importer_count, user_ids = user_ids }