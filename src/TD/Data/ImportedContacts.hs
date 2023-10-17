module TD.Data.ImportedContacts
  (ImportedContacts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ImportedContacts
  = ImportedContacts -- ^ Represents the result of an importContacts request
    { user_ids       :: Maybe [Int] -- ^ User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
    , importer_count :: Maybe [Int] -- ^ The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
    }
  deriving (Eq, Show)

instance I.ShortShow ImportedContacts where
  shortShow ImportedContacts
    { user_ids       = user_ids_
    , importer_count = importer_count_
    }
      = "ImportedContacts"
        ++ I.cc
        [ "user_ids"       `I.p` user_ids_
        , "importer_count" `I.p` importer_count_
        ]

instance AT.FromJSON ImportedContacts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "importedContacts" -> parseImportedContacts v
      _                  -> mempty
    
    where
      parseImportedContacts :: A.Value -> AT.Parser ImportedContacts
      parseImportedContacts = A.withObject "ImportedContacts" $ \o -> do
        user_ids_       <- o A..:?  "user_ids"
        importer_count_ <- o A..:?  "importer_count"
        pure $ ImportedContacts
          { user_ids       = user_ids_
          , importer_count = importer_count_
          }
  parseJSON _ = mempty

