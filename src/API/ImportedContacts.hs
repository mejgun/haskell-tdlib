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

