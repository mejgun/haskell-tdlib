module TD.Query.GetLanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetLanguagePackString -- ^ Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously
  = GetLanguagePackString
    { language_pack_database_path :: Maybe T.Text -- ^ Path to the language pack database in which strings are stored
    , localization_target         :: Maybe T.Text -- ^ Localization target to which the language pack belongs
    , language_pack_id            :: Maybe T.Text -- ^ Language pack identifier
    , key                         :: Maybe T.Text -- ^ Language pack key of the string to be returned
    }
  deriving (Eq)

instance Show GetLanguagePackString where
  show
    GetLanguagePackString
      { language_pack_database_path = language_pack_database_path_
      , localization_target         = localization_target_
      , language_pack_id            = language_pack_id_
      , key                         = key_
      }
        = "GetLanguagePackString"
          ++ I.cc
          [ "language_pack_database_path" `I.p` language_pack_database_path_
          , "localization_target"         `I.p` localization_target_
          , "language_pack_id"            `I.p` language_pack_id_
          , "key"                         `I.p` key_
          ]

instance AT.ToJSON GetLanguagePackString where
  toJSON
    GetLanguagePackString
      { language_pack_database_path = language_pack_database_path_
      , localization_target         = localization_target_
      , language_pack_id            = language_pack_id_
      , key                         = key_
      }
        = A.object
          [ "@type"                       A..= AT.String "getLanguagePackString"
          , "language_pack_database_path" A..= language_pack_database_path_
          , "localization_target"         A..= localization_target_
          , "language_pack_id"            A..= language_pack_id_
          , "key"                         A..= key_
          ]
