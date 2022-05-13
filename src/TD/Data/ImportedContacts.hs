{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ImportedContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data ImportedContacts = -- | Represents the result of an ImportContacts request @user_ids User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
  ImportedContacts
  { -- | The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
    importer_count :: Maybe [Int],
    -- |
    user_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show ImportedContacts where
  show
    ImportedContacts
      { importer_count = importer_count_,
        user_ids = user_ids_
      } =
      "ImportedContacts"
        ++ U.cc
          [ U.p "importer_count" importer_count_,
            U.p "user_ids" user_ids_
          ]

instance T.FromJSON ImportedContacts where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "importedContacts" -> parseImportedContacts v
      _ -> mempty
    where
      parseImportedContacts :: A.Value -> T.Parser ImportedContacts
      parseImportedContacts = A.withObject "ImportedContacts" $ \o -> do
        importer_count_ <- o A..:? "importer_count"
        user_ids_ <- o A..:? "user_ids"
        return $ ImportedContacts {importer_count = importer_count_, user_ids = user_ids_}
  parseJSON _ = mempty

instance T.ToJSON ImportedContacts where
  toJSON
    ImportedContacts
      { importer_count = importer_count_,
        user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "importedContacts",
          "importer_count" A..= importer_count_,
          "user_ids" A..= user_ids_
        ]
