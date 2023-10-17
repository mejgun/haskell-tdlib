module TD.Data.PersonalDocument
  (PersonalDocument(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DatedFile as DatedFile

data PersonalDocument
  = PersonalDocument -- ^ A personal document, containing some information about a user
    { files       :: Maybe [DatedFile.DatedFile] -- ^ List of files containing the pages of the document
    , translation :: Maybe [DatedFile.DatedFile] -- ^ List of files containing a certified English translation of the document
    }
  deriving (Eq, Show)

instance I.ShortShow PersonalDocument where
  shortShow PersonalDocument
    { files       = files_
    , translation = translation_
    }
      = "PersonalDocument"
        ++ I.cc
        [ "files"       `I.p` files_
        , "translation" `I.p` translation_
        ]

instance AT.FromJSON PersonalDocument where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "personalDocument" -> parsePersonalDocument v
      _                  -> mempty
    
    where
      parsePersonalDocument :: A.Value -> AT.Parser PersonalDocument
      parsePersonalDocument = A.withObject "PersonalDocument" $ \o -> do
        files_       <- o A..:?  "files"
        translation_ <- o A..:?  "translation"
        pure $ PersonalDocument
          { files       = files_
          , translation = translation_
          }
  parseJSON _ = mempty

