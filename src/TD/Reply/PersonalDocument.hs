{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PersonalDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.DatedFile as DatedFile
import qualified Utils as U

data PersonalDocument = -- | A personal document, containing some information about a user @files List of files containing the pages of the document @translation List of files containing a certified English translation of the document
  PersonalDocument
  { -- |
    translation :: Maybe [DatedFile.DatedFile],
    -- |
    files :: Maybe [DatedFile.DatedFile]
  }
  deriving (Eq)

instance Show PersonalDocument where
  show
    PersonalDocument
      { translation = translation,
        files = files
      } =
      "PersonalDocument"
        ++ U.cc
          [ U.p "translation" translation,
            U.p "files" files
          ]

instance T.FromJSON PersonalDocument where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "personalDocument" -> parsePersonalDocument v
      _ -> fail ""
    where
      parsePersonalDocument :: A.Value -> T.Parser PersonalDocument
      parsePersonalDocument = A.withObject "PersonalDocument" $ \o -> do
        translation_ <- o A..:? "translation"
        files_ <- o A..:? "files"
        return $ PersonalDocument {translation = translation_, files = files_}
  parseJSON _ = fail ""

instance T.ToJSON PersonalDocument where
  toJSON
    PersonalDocument
      { translation = translation,
        files = files
      } =
      A.object
        [ "@type" A..= T.String "personalDocument",
          "translation" A..= translation,
          "files" A..= files
        ]
