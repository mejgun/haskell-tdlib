-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ImportedContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ImportedContacts = 
 ImportedContacts { importer_count :: [Int], user_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON ImportedContacts where
 toJSON (ImportedContacts { importer_count = importer_count, user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "importedContacts", "importer_count" A..= importer_count, "user_ids" A..= user_ids ]
-- importedContacts ImportedContacts  { importer_count :: [Int], user_ids :: [Int] } 



instance T.FromJSON ImportedContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "importedContacts" -> parseImportedContacts v
  where
   parseImportedContacts :: A.Value -> T.Parser ImportedContacts
   parseImportedContacts = A.withObject "ImportedContacts" $ \o -> do
    importer_count <- o A..: "importer_count"
    user_ids <- o A..: "user_ids"
    return $ ImportedContacts { importer_count = importer_count, user_ids = user_ids }